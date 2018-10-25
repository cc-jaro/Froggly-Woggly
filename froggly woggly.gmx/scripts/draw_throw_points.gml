///draw_throw_points(x1,y1,x2,y2,speed,speed type,gravity,step,object)
//Draws a trajectory between two points
var xi=argument[0], yi=argument[1], xf=argument[2], yf=argument[3], hv=argument[5], a=argument[6]/2, tstep=argument[7], object=argument[8];
var hi, vi;

var prevx=xi, prevy=yi, nextx=xi, nexty=yi, changey=0, tf=0, sf=0, dy=yf-yi, dx=xf-xi;

if tstep==0
return false;

if !(hv)
{   //Given vspeed, solve for hspeed.
    vi=argument[4];
    if sqr(vi)+4*a*dy<0
    {   vi=sqrt(-4*a*dy)+0.1;
        tstep=-tstep;
    }
    
    if hv==0
    tf=(-vi+sqrt(sqr(vi)+4*a*dy))/(2*a);
    else
    tf=(-vi-sqrt(sqr(vi)+4*a*dy))/(2*a);
    
    if tf==0
    return false;
    
    hi=dx/tf;
}
else
{   //Given hspeed, solve for vspeed.
    hi=argument[4];
    tf=dx/hi;
    
    if tf==0
    return false;
    
    vi=(dy-a*sqr(tf))/tf;
    
    if (hi<0 && dx>0) || (hi>0 && dx<0)
    tstep=-tstep;
}
    

for (var t=0; nexty<room_height; t+=tstep)
{   nextx=t*hi+xi;
    
    nexty=a*sqr(t)+vi*t+yi;
    
    if collision_line(nextx,nexty,prevx,prevy,object,false,true)
    {   t-=tstep;
        nextx=prevx;
        nexty=prevy;
        do
        {   draw_line(nextx,nexty,prevx,prevy);
            prevx=nextx;
            prevy=nexty;
            t+=tstep/4;
            nextx=t*hi+xi;
            nexty=a*sqr(t)+vi*t+yi;
        }
        until collision_line(nextx,nexty,prevx,prevy,object,false,true)
        
        break;
    }
    draw_line(nextx,nexty,prevx,prevy);
    prevx=nextx;
    prevy=nexty;
}

return true;
