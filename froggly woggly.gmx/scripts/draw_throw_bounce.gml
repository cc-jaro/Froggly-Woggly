///draw_throw_bounce(x,y,hspeed,vspeed,gravity,step,object,hbounce,vbounce,precise,quick,op tmax, op vsp max)
//Draws a trajectory given the initial data
var xi=argument[0], yi=argument[1], hi=argument[2], vi=argument[3], a=argument[4]/2, tstep=argument[5], object=argument[6], hbounce=argument[7], vbounce=argument[8];
var prec=argument[9], quick=argument[10];
var tmax=150, max_vel=0, have_max=(argument_count==13);

if have_max
max_vel=argument[12];

if argument_count>=12
tmax=argument[11];

var prevx=xi, prevy=yi, nextx=xi, nexty=yi, ab_t=0, staley=false, coll=noone;

if tstep<=0
return false;
for (var t=0; abs(ab_t)<tmax; t+=tstep)
{   nextx=t*hi+xi;
    
    if !staley
    nexty=calculate_y(have_max,max_vel,t,vi,yi,a,prevy);
    
    coll=collision_line(prevx,prevy,nextx,nexty,object,prec,true);
    if coll!=noone
    {   var pdx=nextx-prevx, pdy=nexty-prevy, counter=0;
        t-=tstep;
        nextx=prevx;
        nexty=prevy;
        
        if !(quick)
        coll=object;
        do
        {   draw_line(nextx,nexty,prevx,prevy);
            prevx=nextx;
            prevy=nexty;
            t+=tstep/4;
            ab_t+=tstep/4;
            counter++;
            nextx=t*hi+xi;
            if !staley
            nexty=calculate_y(have_max,max_vel,t,vi,yi,a,prevy);
        }
        until (counter==5 || collision_line(prevx,prevy,nextx,nexty,coll,prec,true))
        
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
    
    draw_line(nextx,nexty,prevx,prevy);
    prevx=nextx;
    prevy=nexty;
    ab_t+=tstep;
}

return true;
