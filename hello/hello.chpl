config const numIts : int = 20;

config const numLocales: int = 4; 
const LocaleSpace = {0..numLocales-1}; 
const Locales: [LocaleSpace] locale; 

writeln("Hello world!");


// forall i in 1..numIts on Locales[i] {
//     writeln(here, " is my locale number");
// }


coforall i in 1..numIts {
    writeln("Hello #", i, " from ", here);
}

var n = numIts;
var count: sync int = n;    // counter which also serves as a lock
var release: sync bool;     // barrier release

coforall t in 1..n {
  var myc = count.readFE(); // read the count, grab the lock (state = empty)
  if myc!=1 {               // still waiting for others
    write(".");
    count.writeEF(myc-1);   // update the count, release the lock (state = full)
                            // we could do some work while waiting
    release.readFF();       // wait for everyone
  } else {                  // last one here
    release.writeEF(true);  // release everyone first (state = full)
    writeln("done");
  }
}

var working : sync bool = true;

proc forLoop() {
    writeln("Starting for-loop thing");
    coforall i in 1..n {
        writeln(i);
    }
    write("done\n");
    
    working.writeFF(false);
}

proc checkNumWorking() {
    while (working.readFF(true)) {
        writeln("Number of running tasks: ", here.runningTasks());
    }
    writeln("Done with checkNumWorking!");
}

cobegin {
    forLoop();
    checkNumWorking();
}

// var arr = 1..20;

// forall copy i in arr {
//     writeln(i)
// }

proc main() {
    writeln("Hello from main, if it worked");
}