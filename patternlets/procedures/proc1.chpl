



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