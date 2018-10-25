///draw_throw_bounce_width(x,y,hspeed,vspeed,gravity,step,object,hbounce,vbounce,precise,quick,width,op tmax, op vsp max)
//Draws a trajectory given the initial data
var xi=argument[0], yi=argument[1], hi=argument[2], vi=argument[3], a=argument[4]/2, tstep=argument[5], object=argument[6], hbounce=argument[7], vbounce=argument[8];
var prec=argument[9], quick=argument[10], w=argument[11]/2;
var tmax=150, max_vel=0, have_max=(argument_count==14);

if have_max
max_vel=argument[13];

if argument_count>=13
tmax=argument[12];

var prevx=xi, prevy=yi, nextx=xi, nexty=yi, ab_t=0, staley=false, coll=noone;

if tstep<=0
return false;

draw_primitive_begin(pr_trianglestrip);
for (var t=0; abs(ab_t)<tmax; t+=tstep)
{   nextx=t*hi+xi;
    
    if !staley
    nexty=calculate_y(have_max,max_vel,t,vi,yi,a,prevy);
    
    coll=collision_line(nextx,nexty,prevx,prevy,object,prec,true);
    if coll!=noone
    {   var pdx=nextx-prevx, pdy=nexty-prevy, counter=0;
        t-=tstep;
        nextx=prevx;
        nexty=prevy;
        
        if !(quick)
        coll=object;
        do
        {   if (nextx!=prevx) || (nexty!=prevy)
            {   degs=point_direction(nextx,nexty,prevx,prevy);
    
                draw_vertex(nextx+lengthdir_x(w,degs+90),nexty+lengthdir_y(w,degs+90));
                draw_vertex(nextx+lengthdir_x(w,degs-90),nexty+lengthdir_y(w,degs-90));
            }
            prevx=nextx;
            prevy=nexty;
            t+=tstep/4;
            ab_t+=tstep/4;
            counter++;
            nextx=t*hi+xi;
            if !staley
            nexty=calculate_y(have_max,max_vel,t,vi,yi,a,prevy);
        }
        until (counter==5 || collision_line(nextx,nexty,prevx,prevy,coll,prec,true))
        
        var ydir=0, xdir=0, dx=nextx-prevx, dy=nexty-prevy;
        if collision_point(prevx+dx,prevy,object,prec,true)
        xdir=1;
        if collision_point(prevx,prevy+dy,object,prec,true)
        ydir=1;
        
        if xdir
        hi=-hi*hbounce;
        if ydir
        {   vi=-sign(dy)*abs(pdy*vbounce/tstep);
            if pdy>0 && vi>-0.5
            staley=true;
        }
        else
        vi=pdy/tstep;
        
        coll=noone;
        
        xi=prevx;
        yi=prevy;
        nextx=prevx;
        nexty=prevy;
        t=0;
        continue;
    }
    
    degs=point_direction(nextx,nexty,prevx,prevy);
    
    draw_vertex(prevx+lengthdir_x(w,degs+90),prevy+lengthdir_y(w,degs+90));
    draw_vertex(prevx+lengthdir_x(w,degs-90),prevy+lengthdir_y(w,degs-90));
    prevx=nextx;
    prevy=nexty;
    ab_t+=tstep;
}
draw_vertex(nextx+lengthdir_x(w,degs+90),nexty+lengthdir_y(w,degs+90));
draw_vertex(nextx+lengthdir_x(w,degs-90),nexty+lengthdir_y(w,degs-90));
draw_primitive_end();

return true;
