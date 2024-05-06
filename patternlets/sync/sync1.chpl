var hold : sync bool;

writeln(hold.readXX());

hold.writeEF(true);

proc withSyncIntFormal(ref x: sync bool) {
  writeln("the value is: ", x.readFF());
}

withSyncIntFormal(hold);

var holdOut : bool = hold.readFF();
writeln("Value of hold: ", holdOut);

holdOut = false;

var holdOut2 : bool = hold.readFE();

writeln(holdOut2);


forall i in 1..100
{

}

// flawed example
writeln("\n----\n");
var wait : sync bool;
coforall tid in 0..#here.maxTaskPar 
{
    if (tid == 0)
    {
        writeln("I'm the captain tid(", tid, ") and I go first!"); // 0
        writeln("\tI command my underlings to walk past me in order\n");
        wait.writeEF(true);
    }
    else
    {
        wait.readFE();
        writeln("I'm tid(", tid, ")!");
        wait.writeEF(true);
    }
}

writeln("\nEveryone should have walked in order");

