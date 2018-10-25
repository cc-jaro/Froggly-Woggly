///draw_parabola(x1,x2,A,B,C,xstep,relative,xshift)
//Script by Volcanic Light
var pxf=argument0, j=argument0, pxs=argument1, A=argument2, B=argument3, C=argument4, precision=argument5, rel=argument6, xshift=argument7;
rel*=pxf;
var inc=sign(pxs-pxf)*precision, prevy=A*sqr(j-rel-xshift)+B*(j-rel-xshift)+C, nexty=0;

for (var i=pxf+inc; abs(i-pxs)>=precision; i+=inc)
{   nexty=A*sqr(i-rel-xshift)+B*(i-rel-xshift)+C;
    draw_line(i,nexty,j,prevy);
    prevy=nexty;
    j=i;
}
draw_line(pxs,A*sqr(pxs-rel-xshift)+B*(pxs-rel-xshift)+C,j,prevy);

return true;