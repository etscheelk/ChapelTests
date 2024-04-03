use LinearAlgebra;
use BLAS;
use LAPACK;
use Math;
use Random;

//
config const dim : int = 1000;

config const rotation : real(64) = 45.0;
const rotRad = rotation * pi / 180.0;
//


var density : [0..#dim, 0..#dim] uint(32) = 0;

var rotMat = Matrix([cos(rotRad), -sin(rotRad)], [sin(rotRad), cos(rotRad)], eltType=real(64));

writeln(rotMat);

var z = Vector([1,1], eltType=real(64));

writeln(dot(rotMat, z));

for i in 0..#100_000 {
    // find random position

}

on here.GPUS[0] {
    

    forall i in 1..100_000 {

    }
}