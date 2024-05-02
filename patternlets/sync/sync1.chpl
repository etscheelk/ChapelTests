var hold : sync bool;

writeln(hold.readXX());

hold.writeEF(true);

proc f_withSyncIntFormal(ref x: sync bool) {
  writeln("the value is: ", x.readFF());
}

f_withSyncIntFormal(hold);

var holdOut : bool = hold.readFF();
writeln("Value of hold: ", holdOut);

holdOut = false;

var holdOut2 : bool = hold.readFE();

writeln(holdOut2);

coforall tid in 0..#here.maxTaskPar 
{
    writeln(tid);
}

