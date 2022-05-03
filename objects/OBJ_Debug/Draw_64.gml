/// @description Draw console and log
if (global.debug.isOn) {
	draw_set_color(c_black);
	draw_set_alpha((global.debug.console.isSelected ? 0.9 : 0.25));
	draw_rectangle(0, 0, 160, 360, false);
	draw_set_font(FNT_DebugConsole);
	draw_set_color(c_white);
	draw_set_valign(fa_bottom);
	draw_set_halign(fa_left);
	draw_text_ext(15, 300, global.debug.console.log, 10, 135);
	draw_set_valign(fa_top);
	draw_text_ext(15, 315, global.debug.console.command + (current_second % 2 == 0 ? "|" : ""), 10, 135);
	draw_set_halign(fa_right);
	draw_text(625, 15, "FPS: " + string(floor(fps_real)));
	draw_text(625, 25, "Instances: " + string(instance_count));
	draw_set_alpha(1);
}