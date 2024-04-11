use IO;
use Math;
use Map;

config const a : uint(64) = 0;

config const n = 100,
             alpha = 0.01;

/*
Not the most efficient but it works lol
*/
proc findMajorityElement(arr : [] int) {
    // var a : [1..arr.size] atomic int;

    var m = new Map.map(int, int, initialCapacity = arr.size / 2);
    var maxOcc = 1;
    var maj = -1;

    for i in arr {
        var present : bool = m.add(i, 1);
        if !present then m.replace(i, m.this(i)+1);

        if (m.this(i) > maxOcc) {
            maxOcc = m.this(i);
            maj = i;
        }
    }

    return maj;
}

proc main() {
    var s :string;
    // var success : bool = IO.stdin.readString(s, 1);
    
    var success = IO.stdin.readLine(s, stripNewline = true);

    writeln(s);
    writeln(success);

    var A, B, C: [1..n] real;
    B = 1.0;
    C = 2.0;
    // This does parallel work
    A = B + alpha * C;

    writeln(A);

    var Z = [3, 3, 3, 2, 2, 1, 3, 9, 9, 9, 9, 9, 9, 9, 9];
    writeln("The most common element of ", Z, " is:");
    var maj = findMajorityElement(Z);
    writeln(maj, "\n");
}