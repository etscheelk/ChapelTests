var d : domain(1) = {3..#10};

for i in d {
    writeln(i);
}

var A : [d] real = 5.0;

for (v, i) in zip(A, A.domain) {
    writeln("index: ", i, " val: ", v);
}

writeln(A.type:string);

writeln(A.domain:string);

writeln(A.domain.type:string);


proc takes2Darr(arr : [] real, d : domain(2)) {
    writeln("\n\tTakes 2D arr:");
    writeln(arr.type:string);

    writeln(arr.domain.type:string);
}
var DD : [1..10, 1..10] real = 0.0;

takes2Darr(DD, DD.domain);
// takes2Darr(A, A.domain);

proc takesDomain(dom : domain(?)) {
    writeln(dom);
}
takesDomain(DD.domain);


proc takesArray(arr : []) {
    writeln(arr);
}
takesArray(DD);

// proc process2DArray(arr: [1..?] real) {
//     const numRows = arr.numDims(1);
//     const numCols = arr.numDims(2);
//     for i in 1..numRows {
//         for j in 1..numCols {
//             writeln("arr[", i, ",", j, "] = ", arr[i, j]);
//         }
//     }
// }

// var myArray: [3, 4] real = [
//     [1.0, 2.0, 3.0, 4.0],
//     [5.0, 6.0, 7.0, 8.0],
//     [9.0, 10.0, 11.0, 12.0]
// ];

// process2DArray(myArray);

// var myOtherArray: [5, 2] real = [
//     [1.0, 2.0],
//     [3.0, 4.0],
//     [5.0, 6.0],
//     [7.0, 8.0],
//     [9.0, 10.0]
// ];

// process2DArray(myOtherArray);
