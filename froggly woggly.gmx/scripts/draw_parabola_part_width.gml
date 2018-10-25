///draw_parabola_part_width(x1,y1,x2,y2,constant,xstep,width)
//Script by Volcanic Light
var pxf=argument0, pyf=argument1, pxs=argument2, pys=argument3, C=argument4, j=argument0, precision=argument5, w=argument6/2;
var inc=sign(pxs-pxf)*precision, py=pyf, nexty=0, degs=0;

//Prevent division by 0
if (pxs*sqr(pxf)-pxf*sqr(pxs))==0 || (pxs*sqr(pxf)-pxf*sqr(pxs))==0
return false;

//Find the constants
var A=(pxs*(pyf-C)+pxf*(C-pys))/(pxs*sqr(pxf)-pxf*sqr(pxs));
var B=(sqr(pxf)*(pys-C)+sqr(pxs)*(C-pyf))/(pxs*sqr(pxf)-pxf*sqr(pxs));

//Draw
draw_primitive_begin(pr_trianglestrip);

for (var i=pxf; abs(i-pxs)>=precision; i+=inc)
{   nexty=A*sqr(i)+B*i+C;
    
    degs=point_direction(i,nexty,j,py);
    
    draw_vertex(j+lengthdir_x(w,degs+90),py+lengthdir_y(w,degs+90));
    draw_vertex(j+lengthdir_x(w,degs-90),py+lengthdir_y(w,degs-90));
    
    py=nexty;
    j=i;
}

degs=point_direction(pxs,pys,j,py);
    
draw_vertex(pxs+lengthdir_x(w,degs+90),pys+lengthdir_y(w,degs+90));
draw_vertex(pxs+lengthdir_x(w,degs-90),pys+lengthdir_y(w,degs-90));

draw_primitive_end();

return true;
