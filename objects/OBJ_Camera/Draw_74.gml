/// @description Stretch to fit screen

if (!surface_exists(global.window.surface)) global.window.surface = surface_create(round_to_smallest_power_two(global.resolution.internal.wd), round_to_smallest_power_two(global.resolution.internal.ht));
surface_set_target(global.window.surface);
draw_surface_stretched(application_surface, 0, 0, global.resolution.internal.wd, global.resolution.internal.ht);
surface_reset_target();
var _externalw = (os_browser == browser_not_a_browser ? global.resolution.external.wd*(surface_get_width(global.window.surface)/surface_get_width(application_surface)) : global.resolution.external.wd*(surface_get_width(global.window.surface)/global.resolution.internal.wd));
var _externalh = (os_browser == browser_not_a_browser ? global.resolution.external.ht*(surface_get_height(global.window.surface)/surface_get_height(application_surface)) : global.resolution.external.ht*(surface_get_height(global.window.surface)/global.resolution.internal.ht));
draw_surface_stretched(global.window.surface, 0, 0, _externalw, _externalh);
