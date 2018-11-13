var fricmod = (1 * (abs(hsp)/4));
var vfric = (2 / fricmod) + (abs(vsp)/10)

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

var instnmh = (instance_nearest(x,y,osolidm).hsp)*sign(instance_nearest(x,y,osolidm).hsp);



//horizontal collision moving
if (place_meeting(x+hsp,y,osolidm))
{
    while (!place_meeting(x+(sign(hsp))-(instnmh),y,osolidm)) 
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

//Vertical Collision
if (place_meeting(x,y+vsp,osolidm))
{
    while (!place_meeting(x,y+sign(vsp),osolidm))
    {
    audio_play_sound(choose(slap1,slap2,slap3),1,0)
    y += sign(vsp);
    jumptimer = 30   
    }
vsp = 0;
grounded = 1
hsp = instance_nearest(x,y,osolidm).hsp
vfric = 0
}

//very inelegant solution for block stuck bug. Get stuck inside a block end up here. No idea how to fix
if grounded = 1 && place_meeting(x,y,osolid)
{ 
    y-=6
}


//friction code
if grounded = 1 
{
    
    
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
    



// calculation for hsp and vsp. Nice meme
x += hsp;
y+= vsp;


