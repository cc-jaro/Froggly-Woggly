///draw_throw_arc_width(x,y,hspeed,vspeed,gravity,step,object,width,op vsp max)
//Draws a trajectory given the initial data
var xi=argument[0], yi=argument[1], hi=argument[2], vi=argument[3], a=argument[4]/2, tstep=argument[5], object=argument[6], w=argument[7]/2, have_max=(argument_count==9);
var max_vel=0;
var len = jumpcharge*2.5


if have_max
max_vel=argument[8];

var prevx=xi, prevy=yi, nextx=xi, nexty=yi, degs=0;
var dist2 = point_distance(x,y,prevx,prevy);

if tstep<=0
return false;

draw_primitive_begin(pr_trianglestrip);
for (var t=0; nexty<room_height; t+=tstep)
{   nextx=t*hi+xi;
    
    nexty=calculate_y(have_max,max_vel,t,vi,yi,a,prevy);
    
    if collision_line(nextx,nexty,prevx,prevy,object,false,true) or point_distance(x,y,nextx,nexty) < len
    {   t-=tstep;
        nextx=prevx;
        nexty=prevy;
        do
        {   
        if (nextx!=prevx) || (nexty!=prevy)
            {   degs=point_direction(nextx,nexty,prevx,prevy);
    
                draw_vertex(nextx+lengthdir_x(w,degs+90),nexty+lengthdir_y(w,degs+90));
                draw_vertex(nextx+lengthdir_x(w,degs-90),nexty+lengthdir_y(w,degs-90));
            }
            prevx=nextx;
            prevy=nexty;
            t+=tstep/4;
            nextx=t*hi+xi;
            nexty=calculate_y(have_max,max_vel,t,vi,yi,a,prevy);
        }
        until collision_line(nextx,nexty,prevx,prevy,object,false,true) or point_distance(x,y,nextx,nexty) > len
        
        break;
    }
    
    degs=point_direction(nextx,nexty,prevx,prevy);
    
    draw_vertex(prevx+lengthdir_x(w,degs+90),prevy+lengthdir_y(w,degs+90));
    draw_vertex(prevx+lengthdir_x(w,degs-90),prevy+lengthdir_y(w,degs-90));
    
    prevx=nextx;
    prevy=nexty;
}

draw_primitive_end();

return true;
