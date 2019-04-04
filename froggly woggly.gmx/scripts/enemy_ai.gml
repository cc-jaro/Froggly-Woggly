
//makes sure it's always moving so no bugs occur later  
if hsp = 0 
    {
    hsp = 2 * (choose(1,-1));
    }

var vdice = random(360); 
var dista = point_distance(x,y,anchorx,anchory);
var distp = point_distance(x,y,ofrog.x,ofrog.y);


if distp < 150 && !place_meeting(x,y,ofrog)
locked = 1;
else
locked = 0;



check = x+((35) * sign(hsp));

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

