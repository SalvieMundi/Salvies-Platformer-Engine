/// @function		draw_canvas_to_screen()
/// @desc			Draw the internal canvas to the player's screen
function draw_canvas_to_screen() {
	
	//set this to avoid hud issues
	display_set_gui_size(global.resolution.external.wd, global.resolution.external.ht);
	
	//draw our canvas, then stretch to user's resolution
	if (surface_exists(global.window.surface)) {
		surface_copy(global.window.surface, 0, 0, application_surface);
		
		// target platform seems to affect this
		/*if (os_browser == browser_not_a_browser) draw_surface(global.window.surface, 0, 0);
		else */draw_surface_stretched(global.window.surface, 0, 0, global.resolution.internal.wdMultiplier * surface_get_width(global.window.surface), global.resolution.internal.htMultiplier * surface_get_height(global.window.surface));
	} else { 
		global.window.surface = surface_create(round_to_smallest_power_two(global.resolution.internal.wd), round_to_smallest_power_two(global.resolution.internal.ht));
		surface_copy(global.window.surface, 0, 0, application_surface);
		
		// target platform seems to affect this
		/*if (os_browser == browser_not_a_browser) draw_surface(global.window.surface, 0, 0);
		else */draw_surface_stretched(global.window.surface, 0, 0, global.resolution.internal.wdMultiplier * surface_get_width(global.window.surface), global.resolution.internal.htMultiplier * surface_get_height(global.window.surface));
	}
	
	//set this to avoid hud issues
	display_set_gui_size(global.resolution.internal.wd, global.resolution.internal.ht);
}

/// @function		resize_internal_canvas()
/// @desc			Resizes the canvas to draw to a resized window
function resize_internal_canvas() {
	if (global.window.mode == windowMode.fullscreen) {
		if (display_get_width() != global.resolution.external.wd || display_get_height() != global.resolution.external.ht) {
			global.resolution.external.wd = display_get_width(); //resolution of player's window
			global.resolution.external.ht = display_get_height(); //resolution of player's window
			global.resolution.internal.wdMultiplier = global.resolution.external.wd / global.resolution.internal.wd; //used to stretch to screen
			global.resolution.internal.htMultiplier = global.resolution.external.ht / global.resolution.internal.ht; //used to stretch to screen
			window_set_size(global.resolution.external.wd, global.resolution.external.ht); //make sure we are full size window
		}
	} else if (global.window.mode == windowMode.window1x) {
		global.resolution.external.wd = global.resolution.internal.wd; //resolution of player's window
		global.resolution.external.ht = global.resolution.internal.ht; //resolution of player's window
		global.resolution.internal.wdMultiplier = 1; //used to stretch to screen
		global.resolution.internal.htMultiplier = 1; //used to stretch to screen
		window_set_size(global.resolution.external.wd, global.resolution.external.ht); //make sure we are 1x size window
	} else if (global.window.mode == windowMode.window2x) {
		global.resolution.external.wd = global.resolution.internal.wd*2; //resolution of player's window
		global.resolution.external.ht = global.resolution.internal.ht*2; //resolution of player's window
		global.resolution.internal.wdMultiplier = 2; //used to stretch to screen
		global.resolution.internal.htMultiplier = 2; //used to stretch to screen
		window_set_size(global.resolution.external.wd, global.resolution.external.ht); //make sure we are 2x size window
	} else if (global.window.mode == windowMode.window3x) {
		global.resolution.external.wd = global.resolution.internal.wd*3; //resolution of player's window
		global.resolution.external.ht = global.resolution.internal.ht*3; //resolution of player's window
		global.resolution.internal.wdMultiplier = 3; //used to stretch to screen
		global.resolution.internal.htMultiplier = 3; //used to stretch to screen
		window_set_size(global.resolution.external.wd, global.resolution.external.ht); //make sure we are 3x size window
	}
}