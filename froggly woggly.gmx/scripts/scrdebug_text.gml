//Debug text Left of Screen
draw_set_font(fpsfont);
draw_set_halign(fa_left);
draw_text(30,120,"Fps:"+string(fps))
draw_text(30,140,"Steps:"+string(avgfps))
//draw_text(30,160,ofrog.aiming)
//draw_text(30,180,ofrog.savex)
draw_text(30,200,ofrog.hsp)
draw_text(30,220,ofrog.vsp)
