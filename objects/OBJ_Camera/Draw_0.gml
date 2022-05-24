/// @description Draw tint effect

dont_draw_self();

if (global.camera.tintAmount > 0) {
	draw_set_color(global.camera.tint);
	draw_set_alpha(global.camera.tintAmount);
	draw_rectangle(global.camera.xPos, global.camera.yPos, global.camera.camR, global.camera.camB, false);	
	draw_set_alpha(1);
	draw_set_color(c_white);
}