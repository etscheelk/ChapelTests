// https://chapel-lang.org/docs/primers/taskParallel.html
use Time;

config const dur : real(64) = 3.0;

proc sayHello() {
    writeln("Hello there!");
}

proc sayGoodbye() {
    writeln("Goodbye!");
}

// A blocking task parallel segment
// Expect no specific order of processing
// except where logical within a function or block {...}
//
// Outputs in this case can still be interleaved, as shown with C
cobegin { 
    // A
    sayHello();

    // B
    sayGoodbye();

    // C
    {
        writeln("I'm a block");
        writeln("^ and this message should come below");
    }
}

writeln("\nI wait until everything in the above block is done.");

var a : atomic uint(64) = 0;
var b : atomic bool = false;
begin cobegin {
    // Creates a stopwatch and reads the value of atomic int a
    {
        var it : uint(64) = 0;
        var t : stopwatch;
        t.start();
        while (t.elapsed() < dur) {
            if (it % 1000000 == 0) {
                writeln("The value I read is ", a.read());
            }
            it += 1;
        }
        t.stop();
        b.write(true);
        writeln("\nThe amount of time passed: ", t.elapsed());
        writeln("And the final value I read is ", a.read());
    }

    // Task to constantly increment an atomic int
    {
        while(!b.read()) {
            a.write(a.read()+1);
        }
    }
    
    // I'll run a coforall loop too
    // {
    //     coforall 
    // }
}

writeln("Out here!");

var t2 : stopwatch;
t2.start();
coforall i in 1..#100000 {
    if (i % 5000 == 0) {
        writeln(i);
    }
}
t2.stop();
writeln("Time elapsed outside: ", t2.elapsed());