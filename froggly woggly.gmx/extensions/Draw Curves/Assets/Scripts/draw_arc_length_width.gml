///draw_arc_length_width(x,y,radius,length,direction,precision,width)
//Script by Volcanic Light
//Draws part of a circle given a length
if argument5==0 || argument2==0
return false;

var pxf=argument0, pyf=argument1, r=argument2, len=argument3, dir=argument4, precision=1/argument5, w=argument6/2;

var h,k,n,start_t,end_t,inc,xpos,ypos,prevx,prevy,degs;

//Find center
h=lengthdir_x(r,dir-90)+pxf;
k=lengthdir_y(r,dir-90)+pyf;

n=len/r;

//Find start and end
start_t=arctan2(pyf-k,pxf-h);
end_t=start_t+n;

prevx=pxf;
prevy=pyf;

//Draw
draw_primitive_begin(pr_trianglestrip);
for (var i=start_t+precision;abs(i-end_t)>=precision; i+=precision)
{   xpos=h+r*cos(i);
    ypos=k+r*sin(i);
    
    degs=point_direction(xpos,ypos,prevx,prevy);
    
    draw_vertex(prevx+lengthdir_x(w,degs+90),prevy+lengthdir_y(w,degs+90));
    draw_vertex(prevx+lengthdir_x(w,degs-90),prevy+lengthdir_y(w,degs-90));
    prevx=xpos;
    prevy=ypos;
}

prevx=xpos;
prevy=ypos;
xpos=h+r*cos(end_t);
ypos=k+r*sin(end_t);
degs=point_direction(xpos,ypos,prevx,prevy);
    
draw_vertex(xpos+lengthdir_x(w,degs+90),ypos+lengthdir_y(w,degs+90));
draw_vertex(xpos+lengthdir_x(w,degs-90),ypos+lengthdir_y(w,degs-90));

draw_primitive_end();

return true;