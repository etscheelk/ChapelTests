use Random;



proc multiply(a, b) out
{
    return a * b;
}

writeln(multiply(5, 11));

proc multiply2(a : ?t ... 2) out
{
    return a(0) * a(1);
}

writeln(multiply2(5, 12));

class Obj
{
    var a : real;

    proc val do return a;

    proc init(val)
    {
        this.a = val;
    }

    operator *(src : Obj, other)
    {
        return new Obj(src.val * other);
    }

    operator *(src : Obj, other) where other.type == numeric
    {
        writeln("I see that the other is numeric");
        return new Obj(src.val * other);
    } 
}

var a = new Obj(5);

var b = a * 5;

writeln(b);


class C { };
var c : shared C?; // is nil
writeln(if c == nil then "nil" else "something");

proc binsearch(A : [], value, d : domain(1) = A.domain) 
{
    var low = A.domain.dim(0).low;
    var high = A.domain.dim(0).high;
    while (low <= high) {
        var mid = (low + high) / 2;

        if A(mid) > value then
            high = mid - 1;
        else if A(mid) < value then
            low = mid + 1;
        else
            return mid;
    }
    return 0;
}

writeln(binsearch([3, 4, 6, 9, 11], 9.0));

var test2D : [1..5, 1..5] int = 0;
Random.fillRandom(test2D);


coforall tid in 0..#here.maxTaskPar {
  
}

// binsearch(test2D, 3);

// delete c;