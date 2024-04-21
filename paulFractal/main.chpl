use Math;
use Random;
use Time;
use IO;

use image;

//
config const dim : int = 50;

config const rot : real(64) = 1.724643921305295;

config const thetaOffset : real(64) = 3.0466792337230033;

config const mult : real = 1;
//


var density : [0..#dim, 0..#dim] atomic uint(16) = 0;

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
            var theta = y * pi + thetaOffset;

            x = rad * cos(theta);
            y = rad * sin(theta);
        }

        // Add point to density
        var xx = (x / 2.0 + 0.5) * dim;
        var yy = (y / 2.0 + 0.5) * dim;
        if (xx > 0 && xx < dim && yy > 0 && yy < dim) {
            density[xx:uint(32), yy:uint(32)].add(1:uint(16));
        }
    }
}
writeln("Time to do points: ", timer.elapsed(), " s");
timer.reset();


var sum : uint(64) = 0;
forall i in density with(+ reduce sum) 
{
    sum += i.read();
}
if (sum != numPts)
{
    writeln("Race condition spotted! Incorrect sum at conclusion.");
}



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