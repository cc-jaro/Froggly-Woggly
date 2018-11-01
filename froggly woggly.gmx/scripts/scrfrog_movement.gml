//falling code
if (vsp < 36)
 vsp += grav;

// Limits fall speed
if vsp > 36
vsp = 36;

//horizontal collision
if (place_meeting(x+hsp,y,osolid))
{
    while (!place_meeting(x+sign(hsp),y,osolid))
    {
    x += sign(hsp);
    }
hsp *= ((0.5)*-1);
}    

//Vertical Collision
if (place_meeting(x,y+vsp,osolid))
{
    while (!place_meeting(x,y+sign(vsp),osolid))
    {
    audio_play_sound(choose(slap1,slap2,slap3),1,0)
    y += sign(vsp);
    jumptimer = 30   
    }
vsp = 0;
}

//very inelegant solution for block stuck bug. Get stuck inside a block end up here. No idea how to fix
if grounded = 1 && place_meeting(x,y,osolid)
{ 
    y-=6
}

var fricmod = (1 * (abs(hsp)/4));
//friction code
if grounded = 1
{
    var vfric = 2 / fricmod
    if abs(hsp) > vfric
        {
        hsp -= vfric*sign(hsp)
        }
    if abs(hsp) <= vfric && vsp = 0
        {
        hsp = 0
        }  
    //hsp = 0;
    //vsp = 0;
}

//keeps frog within room
if x > room_width or x < 0
    {
    hsp *= -1
    }
    


