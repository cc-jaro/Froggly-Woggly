///draw_nic_function(x1,x2,A,B,C,...,xstep,relative,xshift)
//Script by Volcanic Light
//Draws higher order function

if argument_count<8
return false;
var args=argument_count;
var pxf=argument[0], j=argument[0], pxs=argument[1], precision=argument[args-3], rel=argument[args-2], xshift=argument[args-1];

rel*=pxf;
var inc=sign(pxs-pxf)*precision, prevy=0, nexty=0;

//This for loop will calculate the y value at the given x value
for (var t=2; t<argument_count-3; t++)
{prevy+=argument[t]*power(pxf-rel-xshift,argument_count-4-t);}

for (var i=pxf+inc; abs(i-pxs)>=precision; i+=inc)
{   nexty=0;
    for (var t=2; t<argument_count-3; t++)
    {nexty+=argument[t]*power(i-rel-xshift,argument_count-4-t);}
    
    draw_line(i,nexty,j,prevy);
    prevy=nexty;
    j=i;
}

nexty=0;
for (var t=2; t<argument_count-3; t++)
{nexty+=argument[t]*power(pxs-rel-xshift,argument_count-4-t);}

draw_line(pxs,nexty,j,prevy);

return true;
