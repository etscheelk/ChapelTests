use Random;

var rs = new Random.randomStream(int(64), 5);

for i in 0..#20 {
    writeln(rs.next(min=-10, max=10));
}

writeln("-----------");

// rs = new Random.randomStream(int(64), 5);
forall i in 0..#20 with (
    var rs = new Random.randomStream(int(64), 5)
) {
    writeln(rs.next(min=-10, max=10));
}