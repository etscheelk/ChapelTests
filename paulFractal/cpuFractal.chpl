use Math;
use Random;
use Time;
use IO;

// local
use image;
// use presets; incomplete

//---------------------------------------------------------------------------
// runtime available options, select with `--dim 4096` for example
config var dim : uint(32) = 512;

// Normally make a square with dim, but if these are set, set that dimension
config var dimx : uint(32) = 0;
config var dimy : uint(32) = 0;

config const rot : real(64) = 1.724643921305295;

config const thetaOffset : real(64) = 3.0466792337230033;

// Default number of points is 100 million. This is a multiplier on it.
// Run with `--mult 10` for 1 billion points. 
config const mult : real = 1;

// a. Very fractally, creates beautiful swirls that look like a black hole
// b. Very complicated fractals, a lot of self similarity 
// c. A little bit of both
// I recommend lower offsets for versions b and c (avoid a blurry swirl)
enum ver {a, b, c};
config const version : ver = ver.a;

// Unimplemented preset stuff
// config const sty : Style? = nil; // ? and nil, only for class types
//---------------------------------------------------------------------------


dimx = if dimx == 0 then dim else dimx;
dimy = if dimy == 0 then dim else dimy;
dim = min(dimx, dimy);

var densityDomain : domain(2) = {0..#dimy, 0..#dimx};
var density : [densityDomain] atomic uint(16) = 0;

const numPts : uint(64) = (100_000_000 * mult):uint(64);
const numRands : uint(64) = numPts / 64;

var timer = new Time.stopwatch();



// Prefill random numbers
timer.start();
var randArr : [0..#numRands] uint(64);
var rs = new Random.randomStream(uint(64));
// Random.fillRandom(randArr);
rs.fill(randArr);
writeln("Time to fill randoms ", timer.elapsed() * 1000.0, " ms");
timer.reset();


timer.start();
forall r in randArr 
with
(
    var x = 0.7,
    var y = 0.5,
    ref density
)
{
    for i in 0..#64
    {
        var thisRand = r & (1:uint(64) << i);

        if (thisRand == 0)
        {
            (x, y) = (
                x * cos(rot) + y * sin(rot),
                y * cos(rot) - x * sin(rot)
            );
        }
        else
        {
            var rad = x * 0.5 + 0.5;
            var theta : real;

            select version
            {
                // a. Intended Way
                when ver.a
                {
                    theta = y * pi + thetaOffset; 
                }
                // b. Very Fractally
                when ver.b
                {
                    theta = y * pi * thetaOffset;
                }
                // c. both
                when ver.c
                {
                    theta = y * pi * thetaOffset + thetaOffset;
                }
            }

            x = rad * cos(theta);
            y = rad * sin(theta);
        }

        // Add point to density
        var xx = (x / 2.0 + 0.5) * dim;
        var yy = (y / 2.0 + 0.5) * dim;
        if (xx > 0 && xx < dimx && yy > 0 && yy < dimy) {
            density[
                (yy + if dimy > dim then (dimy - dim)/2.0 else 0):uint(32), 
                (xx + if dimx > dim then (dimx - dim)/2.0 else 0):uint(32)
            ].add(1:uint(16)); // extra math with dim, dimx, dimy to center fractal and keep square
        }
    }
}
writeln("Time to do points: ", timer.elapsed(), " s");
timer.reset();


var m : uint(64) = 0;
var sum : uint(64) = 0;
forall i in density with(+ reduce sum, max reduce m) 
{
    sum += i.read();
    m = max(m, i.read());
}
if (sum != numPts)
{
    writeln("Incorrect sum at conclusion. Race condition or overflow?");
    writeln(sum , " versus expected ", numPts, ", diff(", (numPts - sum)/numPts, "%)");
}
writeln("Max brightness: ", m);


forall i in density 
{
    var v = i.read();

    if (v != 0) {
        i.write(sqrt(v):uint(16));
    }
}
writeln("Max brightness after sqrt: ", sqrt(m));


var fw = IO.openWriter("./test.bmp", locking = false);


timer.start();
// inefficient bmp for my application. 
// I use 8 bits of greyscale but this format expects 24 bits of color.
// 48 MB files instead of 16 MB
image.writeImageBMP(fw, density); 
writeln("Time to render to bmp: ", timer.elapsed(), " s");