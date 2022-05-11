/// @description Resize window if stretched

if (global.resolution.external.wd != window_get_width() || global.resolution.external.ht != window_get_height()) {
	global.resolution.external.wd = window_get_width();
	global.resolution.external.ht = window_get_height();
	window_set_size(global.resolution.external.wd, global.resolution.external.ht);
}
alarm[0] = 30;
