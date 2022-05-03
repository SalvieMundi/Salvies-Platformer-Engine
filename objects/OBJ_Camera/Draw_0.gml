/// @description Draw tint effect
if (global.debug.isOn) draw_self();

if (global.camera.tintAmount > 0) {
	draw_set_color(global.camera.tint);
	draw_set_alpha(global.camera.tintAmount);
	draw_rectangle(global.camera.xPos, global.camera.yPos, global.camera.xPos + global.camera.wd, global.camera.yPos + global.camera.ht, false);	
	draw_set_alpha(1);
	draw_set_color(c_white);
}