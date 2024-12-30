const takes2DandAnonArg = proc(A : [1..10, 1..10] int)
{
    writeln(A);
};

var arr2D : [1..10, 1..10] int = 5;

takes2DandAnonArg(arr2D);


// const p = proc(x: int) { return x + 1; };
// writeln(p(3));  // outputs: 4
