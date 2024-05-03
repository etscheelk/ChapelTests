enum pre {default, sardinia, corsica};

record Style
{
    var rotation : real(64);
    var thetaOffset : real(64);
    var version : ver;
}

var default : Style = new Style(1.724643921305295, 3.0466792337230033, ver.a);
var sardinia : Style = new Style(1.724643921305295, 0.5, ver.b);
var corsica : Style = new Style(1.724643921305295, 0.5, ver.c);

// record Exposure
// {
//     var dim : uint;
//     var 
// }