# Chapel

## Introduction

Chapel is a programming language built to provide accessible parallel programming. What required compiler directives, other libraries, and intensive thought in C or C++ is now accessible through simple language keywords and helpful abstractions. Chapel is also intended to be easy to pick up and to be familiar to Python programmers, while still being a fast, scalable, statically typed language.

More information is available at the [Chapel home page](https://chapel-lang.org).

### Simple Parallel

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
for (int i = 0; i < 10; ++i)
{
    printf("%d\n", i);
}
```

In this case, the differences are not too great, but this is the minimum difference in code complexity between any two other comparisons. Writing in parallel is part of Chapel's keywords and a new Chapel programmer will often use implicit parallel processes without being the wiser.

For example, if you have two arrays of the same length `A` and `B`, Chapel allows `var C = A + B`. This will promote array item addition to a parallel loop. 

#### Simple Task Parallel

These previous examples have shown data-parallel programming, but Chapel also provides easy methods to write task parallel code.

A word on vocabulary first: Chapel uses the word "task" as an abstraction of a piece of work, how many processes will be made. To expand, the `forall` loop above by default creates $n$ tasks, where $n$ is the number of physical CPU cores. Each task receives some share of the work, usually represented as each task receiving a subset of the indices of the problem. 



If you wanted to fork threads and let