///draw_ellipse_angle_width(x,y,xaxis,yaxis,angle,direction,precision,width)
//Script by Volcanic Light
//Draws part of an ellipse
if argument6==0 || argument2==0 || argument3==0
return false;

var pxf=argument0, pyf=argument1, a=argument2, b=argument3, ang=argument4, dir=argument5, precision=1/argument6, w=argument7/2;

var h,k,start_t,end_t,xpos,ypos,prevx,prevy,degs;

//Find center and start/end t for parametric
h=lengthdir_x(a,dir-90)+pxf;
k=lengthdir_y(b,dir-90)+pyf;

start_t=arctan2(pyf-k,pxf-h);
end_t=start_t+degtorad(ang);

prevx=pxf;
prevy=pyf;

//Draw
draw_primitive_begin(pr_trianglestrip);

for (var i=start_t+precision;abs(i-end_t)>=precision; i+=precision)
{   xpos=h+a*cos(i);
    ypos=k+b*sin(i);
    
    degs=point_direction(xpos,ypos,prevx,prevy);
    
    draw_vertex(prevx+lengthdir_x(w,degs+90),prevy+lengthdir_y(w,degs+90));
    draw_vertex(prevx+lengthdir_x(w,degs-90),prevy+lengthdir_y(w,degs-90));
    
    prevx=xpos;
    prevy=ypos;
}

prevx=xpos;
prevy=ypos;
xpos=h+a*cos(end_t);
ypos=k+b*sin(end_t);
degs=point_direction(xpos,ypos,prevx,prevy);
    
draw_vertex(xpos+lengthdir_x(w,degs+90),ypos+lengthdir_y(w,degs+90));
draw_vertex(xpos+lengthdir_x(w,degs-90),ypos+lengthdir_y(w,degs-90));

draw_primitive_end();

return true;
