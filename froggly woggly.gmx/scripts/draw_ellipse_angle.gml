///draw_ellipse_angle(x,y,xaxis,yaxis,angle,direction,precision,outline)
//Script by Volcanic Light
//Draws part of an ellipse
if argument5==6 || argument2==0 || argument3==0
return false;

var pxf=argument0, pyf=argument1, a=argument2, b=argument3, ang=argument4, dir=argument5, precision=1/argument6, outline=argument7;

var h,k,start_t,end_t,xpos,ypos,prevx,prevy,browser;

//HTML5 does not support pr_trianglefan, so drawing triangles have to be used
if !(outline)
browser=os_browser;
else
browser=0;

//Find center (so we can start parametric), and the angle of the arc
h=lengthdir_x(a,dir-90)+pxf;
k=lengthdir_y(b,dir-90)+pyf;

start_t=arctan2(pyf-k,pxf-h);
end_t=start_t+degtorad(ang);

prevx=pxf;
prevy=pyf;

//Draw
if !(outline) && browser==browser_not_a_browser
{   draw_primitive_begin(pr_trianglefan);
    draw_vertex(h,k);
    draw_vertex(prevx,prevy);
}

for (var i=start_t+precision;abs(i-end_t)>=precision; i+=precision)
{   xpos=h+a*cos(i);
    ypos=k+b*sin(i);
    
    if outline
    draw_line(prevx,prevy,xpos,ypos);
    else
    {   if browser==browser_not_a_browser
        draw_vertex(xpos,ypos);
        else
        draw_triangle(prevx,prevy,h,k,xpos,ypos,false);
    }
    prevx=xpos;
    prevy=ypos;
}

if outline
draw_line(xpos,ypos,h+a*cos(end_t),k+b*sin(end_t));
else
{   if browser==browser_not_a_browser
    {draw_vertex(h+a*cos(end_t),k+b*sin(end_t)); draw_primitive_end();}
    else
    draw_triangle(xpos,ypos,h,k,h+a*cos(end_t),k+b*sin(end_t),false);
}

return true;
