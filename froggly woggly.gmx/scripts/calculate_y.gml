///calculate_y(have max, max veloccity, t, vi, yi, prevy)

var have_max=argument0, changey=0, max_vel=argument1, nexty=0, t=argument2, vi=argument3, yi=argument4, a=argument5, prevy=argument6;

if have_max
{   changey=a*sqr(t)+vi*t+yi;
    if changey>max_vel+yi
    nexty=prevy+max_vel;
    else
    nexty=changey;
}
else
nexty=a*sqr(t)+vi*t+yi;

return nexty;
