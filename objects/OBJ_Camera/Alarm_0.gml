/// @description Resize window if stretched

if (global.resolution.external.wd != display_get_width() || global.resolution.external.ht != display_get_height()) {
	global.resolution.external.wd = display_get_width();
	global.resolution.external.ht = display_get_height();
	window_set_size(global.resolution.external.wd, global.resolution.external.ht);
}
alarm[0] = GAME_FPS / 2; // resize window every half a second
