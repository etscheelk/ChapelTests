# Beginning Language Specification

## Variables

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

## Comments

Comments are the same as in C. 

```
/*
Block comment
*/

// Single line comment
```