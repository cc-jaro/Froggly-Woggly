
//makes sure it's always moving so no bugs occur later  
if hsp = 0 
    {
    hsp = 2 * (choose(1,-1));
    }


var vdice = random(360); 
var vdice2 = random(250); 

var jtimer = -1;
var canjump = 1;
var jcharges = 2;


var dista = point_distance(x,y,anchorx,anchory);
var distp = point_distance(x,y,ofrog.x,ofrog.y);


if distp < 300 && !place_meeting(x,y,ofrog)
locked = 1;
else
locked = 0;



check = x+((abs(sprite_width)/2) * sign(hsp));

if instance_exists(ofrog)
    {
    if place_empty(check,y+(sprite_height*0.66))
        {
        valid = 0;
        }
    else
    valid = 1;  
    
    if valid = 0
        { 
        hsp *= -1;
        timer = -40;
        }
    
    if dista < 600 && valid = 1
        {
        if locked = 0 && valid = 1
            {
            if timer < vdice
                {
                timer ++;
                }
            if timer >= vdice
                {
                hsp *= -1;
                timer = -20;
                }
            }
        if locked = 1 && timer > 0 && valid = 1
            {
            hsp = abs(hsp)*(sign(ofrog.x-x))
            }
        }
        if dista >= 600
            {
            x = anchorx;
            y = anchory;
            }
        
    if (place_meeting(x+hsp,y,osolid))
        {
        hsp *= -1;
        timer = -40;
        } 
    }
    

//makes sure it's moving correctly  
x += hsp; 

//falling code
if vsp <= 36
vsp += grav;   
    
//vertical collision
if (place_meeting(x,y+vsp,osolid))
{
    while (!place_meeting(x,y+sign(vsp),osolid))
    {
    y += sign(vsp);
    }
vsp = 0;
}

//y movement
y += vsp;     

//jumping random


if (place_meeting(x,y+2,osolid)) && distp <= 300
    {
    if canjump = 1
        {
        if jcharges > 0
            {
            if jtimer < vdice2
                {
                jtimer ++;
                }
                
            if jtimer >= vdice2
                {
                vsp = - 15;
                canjump = 0;
                jcharges --;
                jtimer = -10;
                }
                
            }
        }
    }

if (place_meeting(x,y+2,osolid))
    {
    canjump = 1;
    }










































