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

For example, if you have two arrays of the same length `A` and `B`, Chapel allows `var C = A + B`. This will promote array item addition to a parallel loop. 

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

There are additional variable flavors, such as `sync`, `const`, and `atomic`. 

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
an array of 10 elements initialized to 0.0, where `1..10` *represents the set of indices* of `A`. This means `A[0]` *will result in a runtime error*. 

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

`proc takesArrayDomain(arr : [?D])` deduces the domain