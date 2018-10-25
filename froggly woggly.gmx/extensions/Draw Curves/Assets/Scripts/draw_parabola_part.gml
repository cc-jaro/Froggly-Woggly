///draw_parabola_part(x1,y1,x2,y2,constant,xstep)
//Script by Volcanic Light
var pxf=argument0, pyf=argument1, pxs=argument2, pys=argument3, C=argument4, j=argument0, precision=argument5;
var inc=sign(pxs-pxf)*precision, py=pyf, nexty=0;

//Prevent division by 0
if (pxs*sqr(pxf)-pxf*sqr(pxs))==0 || (pxs*sqr(pxf)-pxf*sqr(pxs))==0
return false;

//Find the other two constants
var A=(pxs*(pyf-C)+pxf*(C-pys))/(pxs*sqr(pxf)-pxf*sqr(pxs));
var B=(sqr(pxf)*(pys-C)+sqr(pxs)*(C-pyf))/(pxs*sqr(pxf)-pxf*sqr(pxs));

//Draw
for (var i=pxf; abs(i-pxs)>=precision; i+=inc)
{   nexty=A*sqr(i)+B*i+C;
    draw_line(i,nexty,j,py);
    py=nexty;
    j=i;
}
draw_line(pxs,pys,j,py);

return true;