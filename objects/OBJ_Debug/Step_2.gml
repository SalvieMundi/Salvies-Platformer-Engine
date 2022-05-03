/// @description Debug mode & console
if (!global.debug.isOn) {
	if (string_count("debug", keyboard_string) > 0) {
		global.debug.isOn = true;
		keyboard_string = "";
	}
}

if (global.debug.isOn) {
	if (string_count("/", keyboard_string) > 0) {
		global.debug.console.isSelected = true;
		global.controls.inputBlocked = true;
		global.debug.console.command = string_copy(keyboard_string, string_last_pos("/", keyboard_string), string_length(keyboard_string) - string_last_pos("/",keyboard_string) + 1);
	
		if (keyboard_check_pressed(vk_enter)) {
			debug_console_routing(global.debug.console.command);
			global.debug.console.command = "/";
			keyboard_string = "/";
		}
		
		if (keyboard_check_pressed(vk_up)) {
			if (array_length(global.debug.console.history) > 0) {
				if (global.debug.console.entry > 0) global.debug.console.entry--;
				else global.debug.console.entry = array_length(global.debug.console.history)-1;
			}
			global.debug.console.command = global.debug.console.history[global.debug.console.entry];	
			keyboard_string = global.debug.console.history[global.debug.console.entry];
		}
		
		if (keyboard_check_pressed(vk_down)) {
			if (array_length(global.debug.console.history) > 0) {
				if (global.debug.console.entry < array_length(global.debug.console.history)-1) global.debug.console.entry++;
				else global.debug.console.entry = 0;
			}
			global.debug.console.command = global.debug.console.history[global.debug.console.entry];	
			keyboard_string = global.debug.console.history[global.debug.console.entry];
		}
		
		if (keyboard_check_pressed(vk_escape)) {
			global.debug.console.isSelected = false;
			global.controls.inputBlocked = false;
			global.debug.console.command = "";
			keyboard_string = "";
		}
	} else {
		if (global.debug.console.isSelected) {
			global.debug.console.isSelected = false;
			global.controls.inputBlocked = false;
			global.debug.console.command = "";
			keyboard_string = "";
		}
	}
}