use LinearAlgebra;
use BLAS;
use LAPACK;
use Math;
use Random;

use image;
use IO;

//
config const dim : int = 50;

config const rotation : real(64) = 45.0;
const rotRad : real = rotation * pi / 180.0;
//

config const mult : uint = 1;


var density : [0..#dim, 0..#dim] atomic uint(32) = 0;

var rotMat = Matrix([cos(rotRad), -sin(rotRad)], [sin(rotRad), cos(rotRad)], eltType=real(64));

writeln(rotMat);

var z = Vector([1,1], eltType=real(64));

writeln(dot(rotMat, z));

// var rs = new Random.randomStream(int(64), 5);
// var num = rs.next();
// var numRandsLeft = 64;
// var numRandsLeft = 64;
// var x = 0.5;
// var y = 0.0;
var rotRad2 : real(64) = 1.724643921305295;
rotRad2 = pi/2.0;
var thetaOffset : real(64) = 3.0466792337230033;
thetaOffset = 0.41235511241;

var rs = new Random.randomStream(int(64));
forall i in 0..#(100_000_000 * mult)
with 
(
    ref rs, 
    var rand = rs.next(), 
    var numRandsLeft = 64,
    var x = 0.7,
    var y = 0.2,
    ref density
) 
{
    if (rand & 1 == 0) {
        (x, y) = (
            x * cos(rotRad2) + y * sin(rotRad2),
            y * cos(rotRad2) - x * sin(rotRad2)
        );
    }   
    else {
        var r = x * 0.5 + 0.5;
        var theta = y * pi * thetaOffset;

        x = r * cos(theta);
        y = r * sin(theta);
    }

    numRandsLeft -= 1;
    rand >>= 1;

    if (numRandsLeft == 0) {
        rand = rs.next();
        numRandsLeft = 64;
    }

    var xx = (x / 2.0 + 0.5) * dim;
    var yy = (y / 2.0 + 0.5) * dim;
    if (xx > 0 && xx < dim && yy > 0 && yy < dim) {
        density[xx:uint(32), yy:uint(32)].add(1);
    }
}


forall i in density {
    var v = i.read();

    if (v != 0) {
        i.write(sqrt(v):uint(32));
    }
}

// var d2 = density:[0..#dim, 0..#dim] uint;
var fw = IO.openWriter("./test.bmp", locking = false);

image.writeImageBMP(fw, density);

// image.writeImageBMP()
// writeln(density);
// forall val in density {
//     if val != 0 {
//         writeln(val);
//     }
// }

// writeln("Sum of all vals: ", + reduce density);

var sum = 0;
forall i in density with(+ reduce sum) {
    sum += i.read():int(64);
}
writeln(sum);

// on here.GPUS[0] {
    

//     forall i in 1..100_000 {

//     }
// }