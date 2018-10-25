///draw_parabola_width(x1,x2,A,B,C,xstep,relative,width)
//Script by Volcanic Light
var pxf=argument0, j=argument0, pxs=argument1, A=argument2, B=argument3, C=argument4, precision=argument5, rel=argument6, w=argument7/2;
rel*=pxf;
var inc=sign(pxs-pxf)*precision, prevy=A*sqr(j-rel)+B*(j-rel)+C, nexty=0, degs=0;

draw_primitive_begin(pr_trianglestrip);
for (var i=pxf+inc; abs(i-pxs)>=precision; i+=inc)
{   nexty=A*sqr(i-rel)+B*(i-rel)+C;

    degs=point_direction(i,nexty,j,prevy);
    
    draw_vertex(j+lengthdir_x(w,degs+90),prevy+lengthdir_y(w,degs+90));
    draw_vertex(j+lengthdir_x(w,degs-90),prevy+lengthdir_y(w,degs-90));
    
    prevy=nexty;
    j=i;
}
nexty=A*sqr(pxs-rel)+B*(pxs-rel)+C;
degs=point_direction(pxs,nexty,xprev,yprev);
    
draw_vertex(pxs+lengthdir_x(w,degs+90),nexty+lengthdir_y(w,degs+90));
draw_vertex(pxs+lengthdir_x(w,degs-90),nexty+lengthdir_y(w,degs-90));

draw_primitive_end();

return true;
