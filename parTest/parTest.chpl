use IO;
use Math;

// https://open.kattis.com/problems/3dprinter 

var s = "";
IO.stdin.readLine(s, stripNewline = true);

// The method to cast
var numToMake = s:int;

writeln("Num to make: ", numToMake);

var minDays : int = numToMake;
var made : int = 0;
var numPrinters : int = 1;

// Tree explorations yay
/*
    For a given day you can choose to just do 3D prints of the remaining to make
        Or produce a 3D printer and look again the next day.
    How many iterations do I need to analyze 


*/
for i in 1..numToMake {
    /*  Path one: Spend the rest of your days with the number of printers
        you have and just print objects.

        The number this would be:

        roundup((numToMake - made) / numPrinters:float)
        e.g.
        999 / 4 = 249.75. 249 days times 4 printers make 996. Therefore, need 250 days to make 999. 
    */
    var a : int = Math.ceil( (numToMake - made) / numPrinters:real ):int
    
}