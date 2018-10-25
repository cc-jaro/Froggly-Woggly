///draw_throw_arc(x,y,hspeed,vspeed,gravity,step,object,op vsp max)
//Draws a trajectory given the initial data
var xi=argument[0], yi=argument[1], hi=argument[2], vi=argument[3], a=argument[4]/2, tstep=argument[5], object=argument[6], have_max=(argument_count==8);
var max_vel=0;
if have_max
max_vel=argument[7];

var prevx=xi, prevy=yi, nextx=xi, nexty=yi;

if tstep<=0
return false;

for (var t=0; nexty<room_height; t+=tstep)
{   nextx=t*hi+xi;
    
    nexty=calculate_y(have_max,max_vel,t,vi,yi,a,prevy);
    
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
            nexty=calculate_y(have_max,max_vel,t,vi,yi,a,prevy);
        }
        until collision_line(nextx,nexty,prevx,prevy,object,false,true)
        
        break;
    }
    
    draw_line(nextx,nexty,prevx,prevy);
    prevx=nextx;
    prevy=nexty;
}

return true;
