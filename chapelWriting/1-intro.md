# Chapel

# Introduction

Chapel is a programming language built to provide accessible parallel programming. What required compiler directives, other libraries, and intensive thought in C or C++ is now accessible through simple language keywords and helpful abstractions. Chapel is also intended to be easy to pick up and to be familiar to Python programmers, while still being a fast, scalable, statically typed language.

More information is available at the [Chapel home page](https://chapel-lang.org).

## Purpose

The purpose of this text is not to explain every component of the Chapel language but to offer a starting point, to illustrate the power of the language, and to provide a reference more accessible than documentation. 

## Simple Parallel

As an introduction, we will show some beginner parallel processes within Chapel. None of these provide real work but are meant to provide a first look at the language.

### Simple Data Parallel

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

In this case, the differences are not too great, but this is the minimum difference in code complexity between any two other comparisons.
Writing in parallel is part of Chapel's keywords and a new Chapel programmer will often use implicit parallel processes without being the wiser.

One example of an implicit parallel process is array addition. 
If you have two arrays `A` and `B`, Chapel allows `var C = A + B`. \
This array additional will be completed in parallel. 
Vector scalar multiplication `a * A` is also implicitly parallel. 


### Simple Task Parallel

These previous examples have shown data-parallel programming, but Chapel also provides easy methods to write task parallel code.

A word on vocabulary first: Chapel uses the word "task" as an abstraction of a piece of work, how many processes will be made. To expand, the `forall` loop above by default creates $n$ tasks, where $n$ is the number of physical CPU cores. Each task receives some share of the work, usually represented as each task receiving a subset of the indices of the problem. 

There is an additional `for` keyword: `coforall` creates a task for each index.

```chapel
coforall i in 1.10
{
    writeln(i);
}
```

In this case, 10 tasks are created, one for each index of the problem, without respect for the number of parallel cores. It is unwise to use `coforall` on large arrays, since there is considerable overhead of task creation. 

If you wished to create a task for each allowed core, you can use the following pattern:

```chapel
coforall tid in 0..#here.maxTaskPar 
{
    writeln(tid);
}
```

This in effect gives task IDs, a value not accessible in any other manner. 

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