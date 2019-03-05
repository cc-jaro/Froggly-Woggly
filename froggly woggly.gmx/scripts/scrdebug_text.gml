//Debug text Left of Screen

var steps = 0;
var totalfps = 0;
var avgfps = 0;




steps ++
totalfps += fps_real;

avgfps = totalfps / steps;


draw_set_font(fpsfont);
draw_set_halign(fa_left);
draw_text(30,120,"Fps:"+string(fps))

draw_text(30,140,"Steps:"+string(avgfps))

if instance_exists(control)
{
draw_text(30,160,"Android?:"+string(control.android))
}

if instance_exists(ofrog)
{
draw_text(30,200,ofrog.aimdir)
draw_text(30,220,ofrog.ctrls)
draw_text(30,240,ofrog.grounded)
draw_text(30,260,ofrog.aiming)
}


if instance_exists(obmenu)
{
draw_text(30,200,obmenu.c)
}
