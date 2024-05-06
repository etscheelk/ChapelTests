## Arrays

### Simple Creation

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


### Multidimensional

Rectangular arrays in multiple dimensions can be created with `var A : [1..10, 1..10] = 0;`. Then the array can be accessed by comma-separated indices like `var a = A[1, 2];`. 

There are several ways to pass a function to a function. By default, arrays passed to functions are `const`. Argument intents describe alternative ways to pass variables into functions, discussed later.

First is the most basic way:

`proc takesArray(arr : [])`: There are no restrictions on the size, type, or domain of A.

`proc takesArrayDomain(arr : [?D])` deduces the domain to a function-local variable `D`. 

`proc takesArrayAndDomainShape(arr : [], d : domain(2))` takes in the array and requires that its domain be 2-dimensional. 