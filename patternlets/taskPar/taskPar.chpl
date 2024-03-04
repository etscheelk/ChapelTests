// https://chapel-lang.org/docs/primers/taskParallel.html

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