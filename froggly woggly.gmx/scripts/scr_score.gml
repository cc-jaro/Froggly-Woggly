///score drawing
draw_set_alpha(1);


if ofrog.active = 0
{
if  counting = 1 //&& global.scoretick = 0 
    {
    draw_sprite_ext(sprite21,0,(view_wview/2),(view_hview/2)-325,3.2,2.4,0,c_white,1)
    draw_set_colour(c_black)
    draw_text((view_wview/2),(view_hview/2)-400,"Score: "+string(countingscore))
    draw_set_colour(c_red)
    draw_text((view_wview/2),(view_hview/2)-350,"Time: "+string(time2))
    draw_text((view_wview/2),(view_hview/2)-300,"Deaths: "+string(attempts2))
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
        audio_play_sound(sndping,1,0)
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
        audio_play_sound(sndping,1,0)
        }
    if attempts2 <= 0 && valarm = 0 && cphase = 1
        {
        cphase = 2;
        }
    }

if cphase = 2
{
    if levelscore2 > 150
            {
            levelscore2 -= 75;
            countingscore += 75;
            valarm = 60;
            audio_play_sound(sndping,1,0)
            }
        if levelscore2 > 0 && levelscore2 <= 150
            {
            levelscore2 -= 1;
            countingscore += 1;
            valarm = 60;
            audio_play_sound(sndping,1,0)
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
