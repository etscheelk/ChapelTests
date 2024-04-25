use Math;
use Random;
use Time;
use IO;

use image;

//
config var dim : uint(32) = 50;

// Normally make a square with dim, but if these are set, set that dimension
config var dimx : uint(32) = 0;
config var dimy : uint(32) = 0;

config const rot : real(64) = 1.724643921305295;

config const thetaOffset : real(64) = 3.0466792337230033;

config const mult : real = 1;
//

dimx = if dimx == 0 then dim else dimx;
dimy = if dimy == 0 then dim else dimy;
dim = min(dimx, dimy);

var densityDomain : domain(2) = {0..#dimy, 0..#dimx};
var density : [densityDomain] atomic uint(16) = 0;

// var density : [0..#dim, 0..#dim] atomic uint(16) = 0;

const numPts : uint(64) = (100_000_000 * mult):uint(64);
const numRands : uint(64) = numPts / 64;

var timer = new Time.stopwatch();


timer.start();
var randArr : [0..#numRands] uint(64);
// Random.fillRandom(randArr);
var rs = new Random.randomStream(uint(64));
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
            // var theta = y * pi * thetaOffset; // mistake
            // var theta = y * pi + thetaOffset;
            var theta = y * pi * thetaOffset + thetaOffset;

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
            ].add(1:uint(16));
        }
    }
}
writeln("Time to do points: ", timer.elapsed(), " s");
timer.reset();


// var brightest : uint(32);
// forall i in pixels with(max reduce brightest) {
//     brightest = max(i.read(), brightest);
// }
var m : uint(64) = 0;
var sum : uint(64) = 0;
forall i in density with(+ reduce sum, max reduce m) 
{
    sum += i.read();
    m = max(m, i.read());
}
if (sum != numPts)
{
    writeln("Race condition spotted! Incorrect sum at conclusion.");
}
writeln("Max brightness: ", m);



forall i in density {
    var v = i.read();

    if (v != 0) {
        i.write(sqrt(v):uint(16));
    }
}

// var d2 = density:[0..#dim, 0..#dim] uint;
var fw = IO.openWriter("./test.bmp", locking = false);

timer.start();
image.writeImageBMP(fw, density);
writeln("Time to render to bmp: ", timer.elapsed(), " s");

// image.writeImageBMP()
// writeln(density);
// forall val in density {
//     if val != 0 {
//         writeln(val);
//     }
// }

// writeln("Sum of all vals: ", + reduce density);


// on here.GPUS[0] {
    

//     forall i in 1..100_000 {

//     }
// }