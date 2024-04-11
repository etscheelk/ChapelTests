config const len = 100_000_000;

// no bug on `in x`
// or `const x`
// or `const ref`,
// or other task intents.
//
var x : atomic int = 0;


//coforall gpu in here.gpus do on gpu {
    foreach i in 0..#len
    with (ref x, var y = 1)
        
    {
        x.add(1);
    }
// }

writeln(x.read());
