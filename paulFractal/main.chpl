use LinearAlgebra;
use BLAS;
use LAPACK;
use Math;
use Random;

//
config const dim : int = 1000;

config const rotation : real(64) = 45.0;
const rotRad : real = rotation * pi / 180.0;
//


var density : [0..#dim, 0..#dim] uint(32) = 0;

var rotMat = Matrix([cos(rotRad), -sin(rotRad)], [sin(rotRad), cos(rotRad)], eltType=real(64));

writeln(rotMat);

var z = Vector([1,1], eltType=real(64));

writeln(dot(rotMat, z));






var rs = new Random.randomStream(int(64), 5);
var num = rs.next();
var numRandsLeft = 64;
var x = 0.5;
var y = 0.0;
var rotRad2 : real(64) = 1.724643921305295;
var thetaOffset : real(64) = 3.0466792337230033;
for i in 0..#100_000_000 {
    // Find random position first


    if (num & 1 == 0) {
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
    num >>= 1;

    if (numRandsLeft == 0) {
        num = rs.next();
        numRandsLeft = 64;
    }

    var xx = (x / 2.0 + 0.5) * dim;
    var yy = (y / 2.0 + 0.5) * dim;
    if (xx > 0 && xx < dim && yy > 0 && yy < dim) {
        density[xx:uint(32), yy:uint(32)] += 1;
    }
}

writeln(density);
// forall val in density {
//     if val != 0 {
//         writeln(val);
//     }
// }

writeln("Sum of all vals: ", + reduce density);

// on here.GPUS[0] {
    

//     forall i in 1..100_000 {

//     }
// }