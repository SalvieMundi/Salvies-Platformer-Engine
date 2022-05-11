/// @description Draw console

if (global.debug.isOn) {
	if (os_browser == browser_not_a_browser) {
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
	} else {
		if (!surface_exists(global.window.surface)) global.window.surface = surface_create(round_to_smallest_power_two(global.resolution.internal.wd), round_to_smallest_power_two(global.resolution.internal.ht));
		surface_set_target(global.window.surface);
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
		surface_reset_target();
		var _externalw = global.resolution.external.wd*(surface_get_width(global.window.surface)/global.resolution.internal.wd);
		var _externalh = global.resolution.external.ht*(surface_get_height(global.window.surface)/global.resolution.internal.ht);
		draw_surface_stretched(global.window.surface, 0, 0, _externalw, _externalh);
	}
}
