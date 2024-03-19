/*
Illustrating task parallel programming

Official Documentation:
    https://chapel-lang.org/docs/primers/taskParallel.html
A stack overflow question I asked
    https://stackoverflow.com/questions/78181333/what-is-the-task-number-specification-on-begin-statements-compared-with-cobe 
*/

// stopwatch to time code
use Time; 

// runtime command line options
// --dur [numeric] : How long to run the optional test
config const dur : real(64) = 3.0;
// --run to set flag to true : Option to run optional test
config const run : bool = false;

// config const tests : [?D] int = {1};

proc sayHello() {
    writeln("Hello there!");
}

proc sayGoodbye() {
    writeln("Goodbye!");
}

proc main()
{
    /* 
     * 1. 
     * 
     * Creates a SINGLE TASK for the following
     * statement or function, etc. Therefore, processing
     * within the statement is sequential.
     * Goodbye will always follow Hello.
     * 
     * Output of the two independent tasks can still be interleaved. 
     * 
     * In effect, it's like a single C fork() that handles itself
     * 
     * For illustration purposes, the sync environment waits until all tasks are complete
     * This prevents the main thread from continuing and prematurely running
     * the rest of the tests. 
     */   
    writeln("1. Simple begin"); 
    sync {
        begin {
            sayHello();
            sayGoodbye();
            writeln("\n\n");
            for i in 100..#20 { // 100 indexed domain, 20 elements
                writeln(i);
                sleep(0.01);
            }
        }

        writeln("This could come before or after \"hello\"-\"goodbye\"\n\n");
        for i in 0..#10 { // 0 indexed domain, 10 elements
            writeln(i);
            sleep(0.01);
        }
    }


    // C code that would do the same
    /*
    ...
        pid_t pid = fork();
        if (pid == 0) // if child
        {
            sayHello();
            sayGoodbyte();
            exit(0);
        }
        else          // if parent
        {
            printf("This could come before or after \"hello\"-\"goodbye\"\n\n\n");
        }
    ...
    */


    /*
     * 2. 
     * 
     * A blocking task parallel segment.
     * 
     * Creates a TASK for EACH statement, function, etc.
     * Expect no specific order of tasks, except where logical 
     * within a function or block {...}
     * 
     * Outputs in this case can still be interleaved, as shown with C
     */
    writeln("2. Simple cobegin showing several-task, blocking");
    cobegin { 
        // A
        sayHello();

        // B
        sayGoodbye();

        // C
        {
            writeln("I'm a block");
            writeln("^ and this message will come below");
        }
    }

    writeln("\nI wait until everything in the above block is done.\n");


    /*
     * 3. Combining begin and cobegin
     * 
     * Creates two tasks: 
     *      The first increments constantly, reading 
     *      the value of atomic variable a. This loop
     *      is controlled by a timer, where it concludes
     *      after runtime config `dur` seconds have passed.
     *      Once the loop finishes, an atomic bool is set to
     *      tell the other task to end. 
     *
     *      The second adds 1 to the atomic int a
     *      until it is told to stop by task 1. 
     *
     *
     * Since it starts with `begin`, the main task continues past the block.
     * The coforall creates a task for EACH iterations, a very slow and dumb idea.
     * This is to test the overhead of having that many tasks and how it will
     * execution time and timer readings. 
     */
    if !run then exit(0);
    writeln("3. Combining begin and cobegin");
    var a : atomic uint(64) = 0;
    var b : atomic bool = false; // could also be a sync variable
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
                a.add(1);
                // a.write(a.read()+1); // more verbose
            }
        }
    }

    writeln("Out here!");

    var t2 : stopwatch;
    t2.start();
    // Creates a task for EACH index
    // 100,000 tasks is slow
    coforall i in 1..#100000 {
        if (i % 5000 == 0) {
            writeln(i);
        }
    }
    writeln("Time elapsed outside: ", t2.elapsed());
    t2.stop();
}