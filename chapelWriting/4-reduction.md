## Reduction

Chapel offers the keyword `reduce` for a variety of use cases and it need not be tied to a forall loop. 

For example, if you have an array `A`, you can get the sum of `A` with `var sumA = + reduce A;`, given that `A` contains numerical types where the reduction can be applied. 

The other reduction operations are 
    
    + * && || & | ^ 'min' 'max' 'minmax' 'minloc' 'maxloc'

These are add, multiply, logical and, logical or, bitwise and, bitwise or, bitwise xor. 

Here, `minloc` and `maxloc` will return the minimum or maximum and the index it was at. It requires zippering the array with the set of indices, typically `var (minimum, loc) = minloc reduce zip(A, A.domain);`.

`minmax` returns a tuple of the minimum and the maximum. 

Custom reduction operations can be written. See Chapel documentation for details. 

### Parallel loop reduction

If you wish to reduce a parallel loop, you can place a `reduce` in a `with` clause as part of the loop specification.

```chapel
var d : domain(2) = {0..#gridHeight, 0..#gridWidth};
var density : [d] atomic uint(16) = 0;

...

var m : uint(64) = 0;
var sum : uint(64) = 0;
forall i in density with(+ reduce sum, max reduce m) 
{
    sum += i.read();
    m = max(m, i.read());
}
```
The above example shows an addition and a maximum reduce used within a forall loop operating on an array of atomic integers. 

## Scan

The scan operator has the same operations as reduce, but returns the result for each element of the list from the beginning up to and including the current element.

For instance, `+ scan A` will return a prefix sum of A, the same length of A. 