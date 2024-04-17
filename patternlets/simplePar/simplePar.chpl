for i in 1..10 {
    writeln(i);
}

writeln("\n---\n");

forall i in 1..10 {
    writeln(i);
}



var d : domain(1) = {3..#10};

for i in d {
    writeln(i);
}

var A : [d] real = 5.0;

for (v, i) in zip(A, A.domain) {
    writeln("index: ", i, " val: ", v);
}

writeln(A.domain:string);