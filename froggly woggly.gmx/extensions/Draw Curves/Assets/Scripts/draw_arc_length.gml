///draw_arc_length(x,y,radius,length,direction,precision,outline)
//Script by Volcanic Light
//Draws part of a circle given a length
if argument5==0 || argument2==0
return false;

var pxf=argument0, pyf=argument1, r=argument2, len=argument3, dir=argument4, precision=1/argument5, outline=argument6;

var h,k,n,start_t,end_t,inc,xpos,ypos,prevx,prevy,browser;

//HTML5 does not support pr_trianglefan, so drawing triangles have to be used
if !(outline)
browser=os_browser;
else
browser=0;

//Find center (so we can start parametric), and the angle of the arc
h=lengthdir_x(r,dir-90)+pxf;
k=lengthdir_y(r,dir-90)+pyf;

n=len/r;

start_t=arctan2(pyf-k,pxf-h);
end_t=start_t+n;

prevx=pxf;
prevy=pyf;

//Do the draws

if !(outline) && browser==browser_not_a_browser
{   draw_primitive_begin(pr_trianglefan);
    draw_vertex(h,k);
    draw_vertex(prevx,prevy);
}

for (var i=start_t+precision;abs(i-end_t)>=precision; i+=precision)
{   xpos=h+r*cos(i);
    ypos=k+r*sin(i);
    
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
draw_line(xpos,ypos,h+r*cos(end_t),k+r*sin(end_t));
else
{   if browser==browser_not_a_browser
    {draw_vertex(h+r*cos(end_t),k+r*sin(end_t)); draw_primitive_end();}
    else
    draw_triangle(xpos,ypos,h,k,h+r*cos(end_t),k+r*sin(end_t),false);
}

return true;