///draw_nic_function_width(x1,x2,A,B,C,...,xstep,relative,xshift,width)
//Script by Volcanic Light
//Draws higher order functions
if argument_count<9
return false;
var args=argument_count;
var pxf=argument[0], j=argument[0], pxs=argument[1], precision=argument[args-4], rel=argument[args-3], xshift=argument[args-2], w=argument[args-1];

rel*=pxf;
var inc=sign(pxs-pxf)*precision, prevy=0, nexty=0, degs=0;

//This for loop calculates the y value at the x position (evaluates the function)
for (var t=2; t<argument_count-4; t++)
{prevy+=argument[t]*power(pxf-rel-xshift,argument_count-5-t);}

draw_primitive_begin(pr_trianglestrip);

for (var i=pxf+inc; abs(i-pxs)>=precision; i+=inc)
{   nexty=0;
    for (var t=2; t<argument_count-4; t++)
    {nexty+=argument[t]*power(i-rel-xshift,argument_count-5-t);}
    
    degs=point_direction(i,nexty,j,prevy);
    
    draw_vertex(j+lengthdir_x(w,degs+90),prevy+lengthdir_y(w,degs+90));
    draw_vertex(j+lengthdir_x(w,degs-90),prevy+lengthdir_y(w,degs-90));
    prevy=nexty;
    j=i;
}
nexty=0;
for (var t=2; t<argument_count-4; t++)
{nexty+=argument[t]*power(pxs-rel-xshift,argument_count-5-t);}
degs=point_direction(pxs,nexty,j,prevy);
    
draw_vertex(pxs+lengthdir_x(w,degs+90),nexty+lengthdir_y(w,degs+90));
draw_vertex(pxs+lengthdir_x(w,degs-90),nexty+lengthdir_y(w,degs-90));

draw_primitive_end();

return true;
