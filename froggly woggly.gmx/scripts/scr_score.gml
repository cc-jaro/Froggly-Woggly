///score drawing
draw_set_alpha(1);
draw_set_colour(c_black);

if ofrog.active = 0
{
if  counting = 1 //&& global.scoretick = 0 
    {
    draw_set_colour(c_black)
    draw_text((view_wview/2),(view_hview/2)-400,"Score: "+string(countingscore))
    draw_set_colour(c_red)
    draw_text((view_wview/2),(view_hview/2)-350,"Time: "+string(time2))
    draw_text((view_wview/2),(view_hview/2)-300,"Attempts: "+string(attempts2))
    draw_set_colour(c_green)
    draw_text((view_wview/2),(view_hview/2)-250,"Levelscore: "+string(levelscore2)) 
     
    }
}    





if global.scoretick = 1
{
if cphase = 0
    {
    if abs(time2) > 0
        {
        time2 +=2;
        countingscore -=2;
        valarm = 60;
        }
    if time2 = 0 && valarm = 0 && cphase = 0
        {
        cphase = 1;
        }
    }
    
if cphase = 1
    {     
    if time2 = 0 && abs(attempts2) > 0
        {
        attempts2 +=2;
        countingscore -=2;
        valarm = 60;
        }
    if attempts2 <= 0 && valarm = 0 && cphase = 1
        {
        cphase = 2;
        }
    }

if cphase = 2
{
    if levelscore2 > 10000
            {
            levelscore2 -= 50;
            countingscore += 50;
            valarm = 60;
            }
        if levelscore2 <= 10000 && levelscore2 >= 1000
            {
            levelscore2 -= 30;
            countingscore += 30;
            valarm = 60;
            }
        if levelscore2 < 1000 && levelscore2 >= 500
            {
            levelscore2 -= 10;
            countingscore += 10;
            valarm = 60;
            }
        if levelscore2 <= 500 && levelscore2 >= 180
            {
            levelscore2 -= 2;
            countingscore += 2;
            valarm = 60;
            }
        if levelscore2 <= 180 && levelscore2 > 0
            {
            levelscore2 --;
            countingscore ++;
            valarm = 60;
            }

    if levelscore2 <= 0 && valarm = 0 && cphase = 2
        {
        cphase = 3;
        }
}
if cphase = 3   
    {
    room_goto(rmenu)
    }
}     

if valarm > 0
valarm --;  
