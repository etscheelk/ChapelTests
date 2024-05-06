use Random;

// The Reduction or Reduce Intents documention is everything
writeln("Reduction operations!");

// Reduce / Scan operators
// + * && || & | ^ 'min' 'max' 'minmax' 'minloc' 'maxloc'

var A : [1..200] int = 0;

var r = new randomStream(int);

r.fill(A, -1000, 1000);

writeln("A filled with 200 random values");
writeln(A[1..20]);

var min, loc : int;

// Tuple assignment
(min, loc) = minloc reduce zip(A, A.domain);
writeln("Minloc found!\nmin: ", min, "\tloc: ", loc);

// bitwise xor of every element in A
// All operators are + * && || & | ^ min max minloc maxloc
var x = ^ reduce A;
writeln("xor reduce A: ", x);

// one line prefix sum
// as well as inline array of all 1's.
var B = + scan 1.0 : [1..100] real(64);
// var B = + scan [i in 1..100] i**2; // results in scan being serialized
writeln(B[1..20]);

// Reduce on a portion 
writeln(+ reduce A[1..5]);

var scanTestArr : [1..100, 1..100] int;
Random.fillRandom(scanTestArr);

// writeln(minmax scan scanTestArr);

writeln(minmax reduce scanTestArr);