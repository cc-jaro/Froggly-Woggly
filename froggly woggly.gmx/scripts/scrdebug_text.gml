//Debug text Left of Screen

var steps = 0;
var totalfps = 0;
var avgfps = 0;
var posy  = 100;
var offset = 20;


steps ++
totalfps += fps_real;

avgfps = totalfps / steps;


draw_set_font(fpsfont);
draw_set_halign(fa_left);
draw_text(30,posy+offset,"Fps:"+string(fps))
offset += 20;
draw_text(30,posy+offset,"Steps:"+string(avgfps))
offset += 20;
if instance_exists(control)
{
draw_text(30,posy+offset,"Android?:"+string(control.android))
}
offset += 20;
if instance_exists(ofrog)
{
draw_text(30,posy+offset,"Aimdir:"+string(ofrog.aimdir))
offset += 20;
draw_text(30,posy+offset,"ctrls:"+string(ofrog.ctrls))
offset += 20;
draw_text(30,posy+offset,"grounded:"+string(ofrog.grounded))
offset += 20;
draw_text(30,posy+offset,"aiming:"+string(ofrog.aiming))
offset += 20;
draw_text(30,posy+offset,"lifetime:"+string(ofrog.lifetime))
offset += 20;
}


if instance_exists(obmenu)
{
draw_text(30,200,obmenu.c)
}
