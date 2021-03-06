///draw_arc_width(x1,y1,x2,y2,precision,flip,width)
//Script by Volcanic Light
//Draws an arc between two points
if argument4==0
return false;

var pxf=argument0, pyf=argument1, pxs=argument2, pys=argument3, precision=1/argument4, sub=argument5, w=argument6/2;

var r=sqrt(sqr(pxf-pxs)+sqr(pyf-pys)), midx=(pxf+pxs)/2, midy=(pyf+pys)/2;
if r==0
return false;

var h,k,start_t,end_t,inc,xpos,ypos,short_curve,degs;

short_curve=false;

//Find the center point of the circle (usually different from the mid-point of the points provided)

if sub<1
sub=-1;
else
sub=1;

if sub==1
{   h=midx-sqrt(sqr(r)-sqr(r/2))*(pyf-pys)/r;
    k=midy-sqrt(sqr(r)-sqr(r/2))*(pxs-pxf)/r;
}
else
{   h=midx+sqrt(sqr(r)-sqr(r/2))*(pyf-pys)/r;
    k=midy+sqrt(sqr(r)-sqr(r/2))*(pxs-pxf)/r;
}

//Find the start and end t for the parametric equations
start_t=arctan2(pyf-k,pxf-h);
end_t=arctan2(pys-k,pxs-h);
inc=sign(end_t-start_t)*precision;

//Use the shortest path instead of the long path.
if abs(start_t-end_t)>pi
{inc=-inc; short_curve=true;}

xpos=pxf;
ypos=pyf;
xprev=xpos;
yprev=ypos;

//Draw
draw_primitive_begin(pr_trianglestrip);

for (var i=start_t+inc;abs(i-end_t)>=precision; i+=inc)
{   if short_curve
    {   if i<-pi
        {   i+=2*pi;
            if abs(i-end_t)<precision
            break;
        }
        if i>pi
        {   i-=2*pi;
            if abs(i-end_t)<precision
            break;
        }
    }
    
    xpos=h+r*cos(i);
    ypos=k+r*sin(i);
    
    degs=point_direction(xpos,ypos,xprev,yprev);
    
    draw_vertex(xprev+lengthdir_x(w,degs+90),yprev+lengthdir_y(w,degs+90));
    draw_vertex(xprev+lengthdir_x(w,degs-90),yprev+lengthdir_y(w,degs-90));
    xprev=xpos;
    yprev=ypos;
}
prevx=xpos;
prevy=ypos;
xpos=h+r*cos(end_t);
ypos=k+r*sin(end_t);

degs=point_direction(xpos,ypos,xprev,yprev);
draw_vertex(xpos+lengthdir_x(w,degs+90),ypos+lengthdir_y(w,degs+90));
draw_vertex(xpos+lengthdir_x(w,degs-90),ypos+lengthdir_y(w,degs-90));

draw_primitive_end();

return true;
