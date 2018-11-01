///score drawing
draw_set_alpha(1);
draw_set_font(fnt_blockfont)

var vmidx = (view_wview/2), vmidy = (view_hview/2), vdrawx = vmidx + 300;


if ofrog.active = 0
{
if  counting = 1 //&& global.scoretick = 0 
    {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_sprite_ext(sprite21,0,vdrawx,vmidy-25,3.4,2.5,0,c_white,1);
    draw_sprite_ext(sprite21,0,vdrawx,vmidy-25,3.2,2.3,0,c_ltgray,0.4);
    draw_set_colour(c_black);
    draw_text(vdrawx,vmidy-100,"Score: "+string(countingscore));
    draw_set_colour(c_red);
    draw_text(vdrawx,vmidy-50,"Time: "+string(time2));
    draw_text(vdrawx,vmidy,"Deaths: "+string(attempts2));
    draw_set_colour(c_green);
    draw_text(vdrawx,vmidy+50,"Levelscore: "+string(levelscore2)) ;
     
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
        //audio_play_sound(sndping,1,0)
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
        //audio_play_sound(sndping,1,0)
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
            levelscore2 -= 25;
            countingscore += 25;
            valarm = 60;
            //audio_play_sound(sndping,1,0)
            }
        if levelscore2 > 0 && levelscore2 <= 150
            {
            levelscore2 -= 1;
            countingscore += 1;
            valarm = 60;
            //audio_play_sound(sndping,1,0)
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

if valarm >= 59
    {
   // if audio_is_playing(sndping)
        {
        audio_play_sound(sndping,1,0)
        }
    }
    
if valarm > 0
valarm --;  
