use Random;

config const n = 10; // dimension of board

var A : [0..#n, 0..#n] int = 0;
var B = A;
var r : randomStream(int) = new randomStream(int);
r.fill(A, 0, 1);


proc iteration(ref A : [?D] int) {
    forall (i, j) in D {
        // find neighbors
        var neighbors : int = 0;
        for (m, d) in {-1..#3, -1..#3} {
            if (i == 0) {
                print(m, ", ", d);
            }
            // if (i + m > n) {

            // }

            // if (i + m < 0)
        }
    }
}

proc main() {
    forall (x, y) in A.domain {
        writeln(x, ", ", y);
    }

    writeln(A);

    iteration(A);
}