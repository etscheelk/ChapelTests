use Time;

config const n : uint = 100_000;
config const quiet : bool = false;
config const skip : bool = false;

var A : [1..n] real = 2.0;
var B = [1..n] 5.0;
var C = [1..n] 0.0;

var t : stopwatch; 

t.start();
C = A + B;
t.stop();
if !quiet then
    writeln("Implicit vector add: ", t.elapsed()*1_000, " ms");
t.clear();

proc writeC() {
    writeln(C[if n <= 20 then 1:uint..n else 1:uint..20:uint]);
}

writeC();

if (!skip) {
    C = 0.0;
    t.start();
    coforall (a, b, c) in zip(A, B, C) {
        c = a + b;
    }
    t.stop();
    if !quiet then
        writeln("Explicit coforall add: ", t.elapsed()*1_000, " ms");
    t.clear();

    writeC();
}