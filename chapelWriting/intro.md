# Chapel

## Introduction

Chapel is a programming language built to provide accessible parallel programming. What required compiler directives, other libraries, and intensive thought in C or C++ is now accessible through simple language keywords and helpful abstractions. Chapel is also intended to be easy to pick up and to be familiar to Python programmers, while still being a fast, scalable, statically typed language.

More information is available at the [Chapel home page](https://chapel-lang.org).

### Simple Parallel

As an introduction, we will show some beginner parallel processes within Chapel. None of these provide real work but are meant to provide a first look at the language.

#### Simple Data Parallel

A simple iterator for-loop executes sequentially, as expected.

```chapel
for i in 1..10 
{
    writeln(i);
}
```

A simple modification makes this a parallel program. The `for` becomes a `forall`.
This will distribute the work among a number of threads, the number being an environment variable, by default the number of physical cores. 

***Room for interative block maybe (baby's first Chapel)***
```chapel
forall i in 1..10
{
    writeln(i);
}
```

Output will be random.

```
6
1
10
2
8
5
9
7
3
4
```

To write the same in C is shown below, which of course requires compiler directives, an external library, and a compiler flag

```C
#pragma omp parallel for
for (int i = 1; i <= 10; ++i)
{
    printf("%d\n", i);
}
```

In this case, the differences are not too great, but this is the minimum difference in code complexity between any two other comparisons. Writing in parallel is part of Chapel's keywords and a new Chapel programmer will often use implicit parallel processes without being the wiser.

One example of an implicit parallel process is array addition. If you have two arrays `A` and `B`, Chapel allows `var C = A + B`. This array additional will be completed in parallel. 

#### Simple Task Parallel

These previous examples have shown data-parallel programming, but Chapel also provides easy methods to write task parallel code.

A word on vocabulary first: Chapel uses the word "task" as an abstraction of a piece of work, how many processes will be made. To expand, the `forall` loop above by default creates $n$ tasks, where $n$ is the number of physical CPU cores. Each task receives some share of the work, usually represented as each task receiving a subset of the indices of the problem. 

There is an additional `for` keyword: `coforall` creates a task for each index.

```chapel
coforall i in 1.10
{
    writeln(i);
}
```

In this case, 10 tasks are created, one for each index of the problem. It is unwise to use `coforall` on large arrays, since there is considerable overhead of task creation. 

If you wanted to fork a single thread and allow processing to continue past that point, Chapel has the `begin` statement, which creates a single task.

```chapel
begin 
{
    writeln("Hello!");
    writeln("I'm a different process! When I'm done, I'm cleaned up automatically");
    writeln("Goodbye!");
}

writeln("I'm executing in the main thread");
```

The `begin` statement will always create a single task for its entire block, where processing within the block will remain sequential for the task, i.e. hello always before goodbye. 

To write something similar in C is shown below. 

```C
pid_t pid = fork();
if (pid == 0) // if child
{
    sayHello();
    sayGoodbyte();
    exit(0);
}
else          // if parent
{
    printf("This could come before or after \"hello\"-\"goodbye\"\n\n\n");
}
```

A sibling of `begin` is `cobegin`, which acts like `coforall`. For each statement following `cobegin`, a new task will be created. Additionally, `cobegin` is blocking, meaning the main thread will not continue until all tasks spawned are complete. 

```chapel
cobegin 
{
    {
        writeln("I'm sequential within here");
    }

    sayHello();

    sayGoodbye();
}

writeln("main thread!");
```

Here, the `cobegin` statement will create three tasks that may execute in any order, and all must complete before execution in the main thread continues. 

Variables such as `sync` and `atomic` variables allow for inter-task communication. Chapel makes it very simple to conceptualize and program task parallel programming 


## Beginning Language Specification

### Variables

A variable is declared with `var a = 1`, yet `a` remains statically typed. The compiler will infer the type of `a` based on context. Type hints can be provided with a colon after the name alongside type, e.g. `var a : int`. The compiler does not allow an unspecified `var b`, so you must either provide it with an initializer or hint the type. 

```chapel
// var a; // not allowed
var b = 1.0; // Inferred to be floating point
var c : int; // no value provided, assumed default instance, being 0 in this case. 
```

Chapel has primitive types 


$$
\begin{array}{|l |l| l| l}

\text{Type} & \text{Default Size} & \text{Other sizes} & \text{Default init} \\
\hline
\verb|bool| & \text{impl. dep.} & 8,16,32,64 & \verb|false| \\
\verb|int| & 64 & 8,16,32 & 0 \\
\verb|uint| & 64 & 8,16,32 & 0 \\
\verb|real| & 64 & 32 & 0.0 \\
\verb|imag| & 64 & 32 & 0.0i \\
\verb|complex| & 128 & 64 & 0.0 + 0.0i \\
\verb|string| & \text{n/a} &  & \verb|""| \\
\end{array}
$$

Alternate sizes from default are written by appending parentheses containing the size in bits. For example, `int` is default 64 bits, `int(32)` is a 32 bit int. 

There are additional variable flavors, such as `sync`, `const`, and `atomic` which will be discussed later, alongside argument intents and return intents. 

### Comments

Comments are the same as in C. 

```
/*
Block comment
*/

// Single line comment
```

### Arrays

#### Simple Creation

The most basic Chapel array can be created with `var A: [1..10] real;`. This will create
an array of 10 elements initialized to 0.0, where `1..10` *represents the set of indices* of `A`, 1 through 10. This means `A[0]` *will result in a runtime error*. 

    error: halt reached - array index out of bounds
    note: index was 0 but array bounds are 1..10

If you instead wish to write this set of indices (the domain) starting at some index and continuing for `n` elements, you can write `var B : [0..#10] real;`, which will be a 0-indexed array with 10 elements (note the (#) pound sign). 

Runtime-size-dependent domain and array creation is accepted. 

Additionally, you can write `var C : [d] real = 1.0;`, where `var d : domain(1) = {0..#12};`. 

- First, `domain(1)` declares it will be a one-dimensional set of indices. 
- Then, `{0..#12}` defines a domain (set of indices) that is 0-indexed and has 12 elements.
- Further, this domain `d` can be used to create an array with the given domain. 

The domain is the object which defines a set of indices. This will create a 0-indexed 1-dimensional array with 12 elements initialized to 1.0. 

An array must have a domain and a type.


#### Multidimensional

Rectangular arrays in multiple dimensions can be created with `var A : [1..10, 1..10] = 0;`. Then the array can be accessed by comma-separated indices like `var a = A[1, 2];`. 

There are several ways to pass a function to a function. By default, arrays passed to functions are `const`. Variable intents describe alternative ways to pass variables into functions. 

First is the most basic way:

`proc takesArray(arr : [])`: There are no restrictions on the size, type, or domain of A.

`proc takesArrayDomain(arr : [?D])` deduces the domain to a function-local variable `D`. 

`proc takesArrayAndDomainShape(arr : [], d : domain(2))` takes in the array and requires that its domain be 2-dimensional. 



### Reduction

Chapel offers the keyword `reduce` for a variety of use cases and it need not be tied to a forall loop. 

For example, if you have an array `A`, you can get the sum of `A` with `var sumA = + reduce A;`, given that `A` contains numerical types where the reduction can be applied. 

The other reduction operations are 
    
    + * && || & | ^ 'min' 'max' 'minmax' 'minloc' 'maxloc'

Here, `minloc` and `maxloc` will return the minimum or maximum and the index it was at. It requires zippering the array with the set of indices, typically `var (minimum, loc) = minloc reduce zip(A, A.domain);`.

Custom reduction operations can be written. See Chapel documentation for details. 

#### Parallel loop reduction

If you wish to reduce a parallel loop, you can place a `reduce` in a `with` clause as part of the loop specification.

```chapel
var m : uint(64) = 0;
var sum : uint(64) = 0;
forall i in density with(+ reduce sum, max reduce m) 
{
    sum += i.read();
    m = max(m, i.read());
}
```
The above example shows an addition and a maximum reduce used within a forall loop operating on an array of atomic integers. 


### Variables part 2

Variables in Chapel also come in extra "flavors", such as `sync` and `atomic` pertaining to parallel-safety and communication, as well as "intents" describing how it will be used like `const`, `ref`, `in`, and so on. 

#### Atomic

An atomic variable can be created with `var x : atomic int(64) = 0;`. Atomic variables can only be of primitive numerical types `bool`, `int`, `uint`, and `real`. 

The basic operations like `+` and `-` are not directly supported with atomic variables, wherein you must use a member function like `x.read()` to access the stored value or `x.add(1)` and `x.write(1)` to set a particular value.

See the [Chapel Documentation](https://chapel-lang.org/docs/language/spec/task-parallelism-and-synchronization.html#atomic-variables) for more details.

Atomic variables are accessible only on the CPU. 
Other techniques must be used for atomic operations on the GPU. 

#### Sync

> Synchronization variables have a logical state associated with the value. The state of the variable is either full or empty. Normal reads of a synchronization variable cannot proceed until the variable’s state is full. Normal writes of a synchronization variable cannot proceed until the variable’s state is empty.
>
> [chapel-lang.org](chapel-lang.org)

Sync is a type flavor of primitive types `nothing`, `bool`, `int`, `uint`, `real`, `imag`, `complex`, `range`, `bytes`, and `string`; enumerated types; classes; and records.

In essence, a sync variable is a regular variable with an extra boolean "empty" or "full" contained alongside, yet that is not all. 
If you have a sync variable `var release : sync bool;` it will be by default empty. 
If a task tries to read or write to a sync variable that is not in the correct state the task will be blocked. 
If multiple tasks are waiting for a sync variable to enter the correct state, **a random task will be selected to continue** and the others will continue to wait, depending on the action of the active task. 

For instance,

```chapel
var count: sync int = n;  // counter which also serves as a lock
var release: sync bool; // barrier release

forall t in 1..n do begin 
{
    foo(t); // Some amount of work

    var myCount = count.readFE();  // read the count, set state to empty

    if myCount != 1 
    {
        write(".");
        count.writeEF(myCount - 1);   // update the count, set state to full

        // we could also do some work here before blocking

        release.readFF();
    } 

    else 
    {
        release.writeEF(true);  // last one here, release everyone
        writeln("done");
    }
}
```

Sync variable `count` is initialized with value `n` and state `full`, release is not ititialized so it is state `empty` and has default value for the base type (`false`).

Much like atomic variables, normal reads, writes, and mathematical operations cannot be performed on sync variables without use of functions. 

1. `proc sync.readFE() out : T`
   1. Block until the sync variable is full
   2. Once full, read and return copy of its value
   3. Set to empty, continue (value unchanged)
2. `proc sync.readFF() out : T`
   1. Block until the sync variable is full
   2. Once full, read and return copy of its value
   3. **Leave full**, continue (value unchanged)
3. ` proc sync.writeEF(in val : T) : void`
   1. Block until the sync variable is empty
   2. Write `val` into the value of the sync variable
   3. Set to full, continue

The following functions are noted as unstable due to danger with race conditions:

4. `proc sync.readXX() out : T`
   1. Without blocking read the value of the sync variable
   2. Do not change the state
   3. Return copy of variable if full. If empty, return default value if possible else last value stored.
   4. Continue
5. `proc sync.writeFF(in val : T) out : T`
   1. Block until sync variable is full
   2. Write `val` into value of sync variable
   3. Do not change state. Continue on.
6. `proc sync.writeXF(in val : T) : void`
   1. Do not block (no matter the state)
   2. Write `val` into sync variable value
   3. Set state to full, continue.
7. `proc sync.reset() : void` 
   1. Non-blocking
   2. Reset value of sync variable to default
   3. Set state to empty
8. `proc sync.isFull : bool`
   1. Non-blocking
   2. Return boolean stating whether the sync variable is full

A sync variable is by default passed as reference as an argument to a function, and this is the only supported option. A procedure return intent other than `ref` for sync variables is not supported. 
Initialization from another sync is deprecated, except through standard read functions.

As an argument to a function it can be written as `foo(x)`, `foo(ref x)`, or `foo(x : sync bool)`, or `foo(ref x : sync bool)`. 



<!-- - intents (in, out, inout, ref, const, const ref, ...) -->



### "Structured Types"

Probably not the most relevant for a parallel reader but there are some tips here that I think will be helpful. 

Talking about generics would be helpful too. I'm just thinking about topics I've found it hard to figure out whenever I've been doing stuff. 

- Class

    - They can read themselves on owned, borrowed, managed
- Array access overload
    - `proc this(i : int, j : int) ref : T`
- Operator overload
    - `overator +(left, right)`
- Record
- Union
- Tuples

### Function Promotion

- Inputs can become vectorized automatically, like R. 