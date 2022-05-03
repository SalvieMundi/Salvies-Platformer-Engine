/// @function		get_held(player, button)
/// @desc			Determines whether the keyboard, mouse button, gamepad button or touchscreen button is held
/// @arg player		1-4, which player are we checking input for (needed for gp)
/// @arg button
function get_held(player, button) {
	var gamepadSlot = 0;
	if (player == 1 && global.controls.player1.controller.guid != pointer_null) gamepadSlot = global.controls.player1.controller.slot;
	else if (player == 2 && global.controls.player2.controller.guid != pointer_null) gamepadSlot = global.controls.player2.controller.slot;
	else if (player == 3 && global.controls.player3.controller.guid != pointer_null) gamepadSlot = global.controls.player3.controller.slot;
	else if (player == 4 && global.controls.player4.controller.guid != pointer_null) gamepadSlot = global.controls.player4.controller.slot;
	
	switch (button) {
		case vk_add : return keyboard_check(button); break;
		case vk_alt : return keyboard_check(button); break;
		case vk_backspace : return keyboard_check(button); break;
		case vk_control : return keyboard_check(button); break;
		case vk_decimal : return keyboard_check(button); break;
		case vk_divide : return keyboard_check(button); break;
		case vk_down : return keyboard_check(button); break;
		case vk_end : return keyboard_check(button); break;
		case vk_enter : return keyboard_check(button); break;
		case vk_escape : return keyboard_check(button); break;
		case vk_f1 : return keyboard_check(button); break;
		case vk_f2 : return keyboard_check(button); break;
		case vk_f3 : return keyboard_check(button); break;
		case vk_f4 : return keyboard_check(button); break;
		case vk_f5 : return keyboard_check(button); break;
		case vk_f6 : return keyboard_check(button); break;
		case vk_f7 : return keyboard_check(button); break;
		case vk_f8 : return keyboard_check(button); break;
		case vk_f9 : return keyboard_check(button); break;
		case vk_f10 : return keyboard_check(button); break;
		case vk_f11 : return keyboard_check(button); break;
		case vk_f12 : return keyboard_check(button); break;
		case vk_home : return keyboard_check(button); break;
		case vk_insert : return keyboard_check(button); break;
		case vk_lalt : return keyboard_check(button); break;
		case vk_lcontrol : return keyboard_check(button); break;
		case vk_left : return keyboard_check(button); break;
		case vk_lshift : return keyboard_check(button); break;
		case vk_multiply : return keyboard_check(button); break;
		case vk_numpad0 : return keyboard_check(button); break;
		case vk_numpad1 : return keyboard_check(button); break;
		case vk_numpad2 : return keyboard_check(button); break;
		case vk_numpad3 : return keyboard_check(button); break;
		case vk_numpad4 : return keyboard_check(button); break;
		case vk_numpad5 : return keyboard_check(button); break;
		case vk_numpad6 : return keyboard_check(button); break;
		case vk_numpad7 : return keyboard_check(button); break;
		case vk_numpad8 : return keyboard_check(button); break;
		case vk_numpad9 : return keyboard_check(button); break;
		case vk_pagedown : return keyboard_check(button); break;
		case vk_pageup : return keyboard_check(button); break;
		case vk_pause : return keyboard_check(button); break;
		case vk_printscreen : return keyboard_check(button); break;
		case vk_ralt : return keyboard_check(button); break;
		case vk_rcontrol : return keyboard_check(button); break;
		case vk_right : return keyboard_check(button); break;
		case vk_rshift : return keyboard_check(button); break;
		case vk_shift : return keyboard_check(button); break;
		case vk_space : return keyboard_check(button); break;
		case vk_subtract : return keyboard_check(button); break;
		case vk_tab : return keyboard_check(button); break;
		case vk_up : return keyboard_check(button); break;
		case mb_left : return mouse_check_button(button); break;
		case mb_right : return mouse_check_button(button); break;
		case mb_middle : return mouse_check_button(button); break;
		case mb_side1 : return mouse_check_button(button); break;
		case mb_side2 : return mouse_check_button(button); break;
		case gp_face1 : return gamepad_button_check(gamepadSlot, button); break;
		case gp_face2 : return gamepad_button_check(gamepadSlot, button); break;
		case gp_face3 : return gamepad_button_check(gamepadSlot, button); break;
		case gp_face4 : return gamepad_button_check(gamepadSlot, button); break;
		case gp_padd : return gamepad_button_check(gamepadSlot, button); break;
		case gp_padl : return gamepad_button_check(gamepadSlot, button); break;
		case gp_padr : return gamepad_button_check(gamepadSlot, button); break;
		case gp_padu : return gamepad_button_check(gamepadSlot, button); break;
		case gp_start : return gamepad_button_check(gamepadSlot, button); break;
		case gp_select : return gamepad_button_check(gamepadSlot, button); break;
		case gp_shoulderl : return gamepad_button_check(gamepadSlot, button); break;
		case gp_shoulderlb : return gamepad_button_check(gamepadSlot, button); break;
		case gp_shoulderr : return gamepad_button_check(gamepadSlot, button); break;
		case gp_shoulderrb : return gamepad_button_check(gamepadSlot, button); break;
		case gp_stickl : return gamepad_button_check(gamepadSlot, button); break;
		case gp_stickr : return gamepad_button_check(gamepadSlot, button); break;
	}
	
	if (is_numeric(button)) {
		return keyboard_check(button);
	} else {
		return false;
	}
}

/// @function		get_pressed(player, button)
/// @desc			Determines whether the keyboard, mouse button, gamepad button or touchscreen button is pressed
/// @arg player		1-4, which player are we checking input for (needed for gp)
/// @arg button
function get_pressed(player, button) {
	var gamepadSlot = 0;
	if (player == 1 && global.controls.player1.controller.guid != pointer_null) gamepadSlot = global.controls.player1.controller.slot;
	else if (player == 2 && global.controls.player2.controller.guid != pointer_null) gamepadSlot = global.controls.player2.controller.slot;
	else if (player == 3 && global.controls.player3.controller.guid != pointer_null) gamepadSlot = global.controls.player3.controller.slot;
	else if (player == 4 && global.controls.player4.controller.guid != pointer_null) gamepadSlot = global.controls.player4.controller.slot;
	
	switch (button) {
		case vk_add : return keyboard_check_pressed(button); break;
		case vk_alt : return keyboard_check_pressed(button); break;
		case vk_backspace : return keyboard_check_pressed(button); break;
		case vk_control : return keyboard_check_pressed(button); break;
		case vk_decimal : return keyboard_check_pressed(button); break;
		case vk_divide : return keyboard_check_pressed(button); break;
		case vk_down : return keyboard_check_pressed(button); break;
		case vk_end : return keyboard_check_pressed(button); break;
		case vk_enter : return keyboard_check_pressed(button); break;
		case vk_escape : return keyboard_check_pressed(button); break;
		case vk_f1 : return keyboard_check_pressed(button); break;
		case vk_f2 : return keyboard_check_pressed(button); break;
		case vk_f3 : return keyboard_check_pressed(button); break;
		case vk_f4 : return keyboard_check_pressed(button); break;
		case vk_f5 : return keyboard_check_pressed(button); break;
		case vk_f6 : return keyboard_check_pressed(button); break;
		case vk_f7 : return keyboard_check_pressed(button); break;
		case vk_f8 : return keyboard_check_pressed(button); break;
		case vk_f9 : return keyboard_check_pressed(button); break;
		case vk_f10 : return keyboard_check_pressed(button); break;
		case vk_f11 : return keyboard_check_pressed(button); break;
		case vk_f12 : return keyboard_check_pressed(button); break;
		case vk_home : return keyboard_check_pressed(button); break;
		case vk_insert : return keyboard_check_pressed(button); break;
		case vk_lalt : return keyboard_check_pressed(button); break;
		case vk_lcontrol : return keyboard_check_pressed(button); break;
		case vk_left : return keyboard_check_pressed(button); break;
		case vk_lshift : return keyboard_check_pressed(button); break;
		case vk_multiply : return keyboard_check_pressed(button); break;
		case vk_numpad0 : return keyboard_check_pressed(button); break;
		case vk_numpad1 : return keyboard_check_pressed(button); break;
		case vk_numpad2 : return keyboard_check_pressed(button); break;
		case vk_numpad3 : return keyboard_check_pressed(button); break;
		case vk_numpad4 : return keyboard_check_pressed(button); break;
		case vk_numpad5 : return keyboard_check_pressed(button); break;
		case vk_numpad6 : return keyboard_check_pressed(button); break;
		case vk_numpad7 : return keyboard_check_pressed(button); break;
		case vk_numpad8 : return keyboard_check_pressed(button); break;
		case vk_numpad9 : return keyboard_check_pressed(button); break;
		case vk_pagedown : return keyboard_check_pressed(button); break;
		case vk_pageup : return keyboard_check_pressed(button); break;
		case vk_pause : return keyboard_check_pressed(button); break;
		case vk_printscreen : return keyboard_check_pressed(button); break;
		case vk_ralt : return keyboard_check_pressed(button); break;
		case vk_rcontrol : return keyboard_check_pressed(button); break;
		case vk_right : return keyboard_check_pressed(button); break;
		case vk_rshift : return keyboard_check_pressed(button); break;
		case vk_shift : return keyboard_check_pressed(button); break;
		case vk_space : return keyboard_check_pressed(button); break;
		case vk_subtract : return keyboard_check_pressed(button); break;
		case vk_tab : return keyboard_check_pressed(button); break;
		case vk_up : return keyboard_check_pressed(button); break;
		case mb_left : return mouse_check_button_pressed(button); break;
		case mb_right : return mouse_check_button_pressed(button); break;
		case mb_middle : return mouse_check_button_pressed(button); break;
		case mb_side1 : return mouse_check_button_pressed(button); break;
		case mb_side2 : return mouse_check_button_pressed(button); break;
		case gp_face1 : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_face2 : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_face3 : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_face4 : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_padd : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_padl : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_padr : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_padu : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_start : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_select : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_shoulderl : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_shoulderlb : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_shoulderr : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_shoulderrb : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_stickl : return gamepad_button_check_pressed(gamepadSlot, button); break;
		case gp_stickr : return gamepad_button_check_pressed(gamepadSlot, button); break;
	}
	
	if (is_numeric(button)) {
		return keyboard_check_pressed(button);
	} else {
		return false;
	}
}

/// @function		get_released(player, button)
/// @desc			Determines whether the keyboard, mouse button, gamepad button or touchscreen button is pressed
/// @arg player		1-4, which player are we checking input for (needed for gp)
/// @arg button
function get_released(player, button) {
	var gamepadSlot = 0;
	if (player == 1 && global.controls.player1.controller.guid != pointer_null) gamepadSlot = global.controls.player1.controller.slot;
	else if (player == 2 && global.controls.player2.controller.guid != pointer_null) gamepadSlot = global.controls.player2.controller.slot;
	else if (player == 3 && global.controls.player3.controller.guid != pointer_null) gamepadSlot = global.controls.player3.controller.slot;
	else if (player == 4 && global.controls.player4.controller.guid != pointer_null) gamepadSlot = global.controls.player4.controller.slot;
	
	switch (button) {
		case vk_add : return keyboard_check_released(button); break;
		case vk_alt : return keyboard_check_released(button); break;
		case vk_backspace : return keyboard_check_released(button); break;
		case vk_control : return keyboard_check_released(button); break;
		case vk_decimal : return keyboard_check_released(button); break;
		case vk_divide : return keyboard_check_released(button); break;
		case vk_down : return keyboard_check_released(button); break;
		case vk_end : return keyboard_check_released(button); break;
		case vk_enter : return keyboard_check_released(button); break;
		case vk_escape : return keyboard_check_released(button); break;
		case vk_f1 : return keyboard_check_released(button); break;
		case vk_f2 : return keyboard_check_released(button); break;
		case vk_f3 : return keyboard_check_released(button); break;
		case vk_f4 : return keyboard_check_released(button); break;
		case vk_f5 : return keyboard_check_released(button); break;
		case vk_f6 : return keyboard_check_released(button); break;
		case vk_f7 : return keyboard_check_released(button); break;
		case vk_f8 : return keyboard_check_released(button); break;
		case vk_f9 : return keyboard_check_released(button); break;
		case vk_f10 : return keyboard_check_released(button); break;
		case vk_f11 : return keyboard_check_released(button); break;
		case vk_f12 : return keyboard_check_released(button); break;
		case vk_home : return keyboard_check_released(button); break;
		case vk_insert : return keyboard_check_released(button); break;
		case vk_lalt : return keyboard_check_released(button); break;
		case vk_lcontrol : return keyboard_check_released(button); break;
		case vk_left : return keyboard_check_released(button); break;
		case vk_lshift : return keyboard_check_released(button); break;
		case vk_multiply : return keyboard_check_released(button); break;
		case vk_numpad0 : return keyboard_check_released(button); break;
		case vk_numpad1 : return keyboard_check_released(button); break;
		case vk_numpad2 : return keyboard_check_released(button); break;
		case vk_numpad3 : return keyboard_check_released(button); break;
		case vk_numpad4 : return keyboard_check_released(button); break;
		case vk_numpad5 : return keyboard_check_released(button); break;
		case vk_numpad6 : return keyboard_check_released(button); break;
		case vk_numpad7 : return keyboard_check_released(button); break;
		case vk_numpad8 : return keyboard_check_released(button); break;
		case vk_numpad9 : return keyboard_check_released(button); break;
		case vk_pagedown : return keyboard_check_released(button); break;
		case vk_pageup : return keyboard_check_released(button); break;
		case vk_pause : return keyboard_check_released(button); break;
		case vk_printscreen : return keyboard_check_released(button); break;
		case vk_ralt : return keyboard_check_released(button); break;
		case vk_rcontrol : return keyboard_check_released(button); break;
		case vk_right : return keyboard_check_released(button); break;
		case vk_rshift : return keyboard_check_released(button); break;
		case vk_shift : return keyboard_check_released(button); break;
		case vk_space : return keyboard_check_released(button); break;
		case vk_subtract : return keyboard_check_released(button); break;
		case vk_tab : return keyboard_check_released(button); break;
		case vk_up : return keyboard_check_released(button); break;
		case mb_left : return mouse_check_button_released(button); break;
		case mb_right : return mouse_check_button_released(button); break;
		case mb_middle : return mouse_check_button_released(button); break;
		case mb_side1 : return mouse_check_button_released(button); break;
		case mb_side2 : return mouse_check_button_released(button); break;
		case gp_face1 : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_face2 : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_face3 : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_face4 : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_padd : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_padl : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_padr : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_padu : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_start : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_select : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_shoulderl : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_shoulderlb : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_shoulderr : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_shoulderrb : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_stickl : return gamepad_button_check_released(gamepadSlot, button); break;
		case gp_stickr : return gamepad_button_check_released(gamepadSlot, button); break;
	}
	
	if (is_numeric(button)) {
		return keyboard_check_released(button);
	} else {
		return false;
	}
}

/// @function		remap_button(button, player)
/// @desc			sets game up to remap a button
/// @arg button		the button we are obtaining mapping input for
/// @arg player		which player is obtaining mapping input		
function remap_button(button, player = 1) {
	global.controls.inputBlocked = true;
	
	switch (player) {
		case 1 : global.controls.player1.mapping.obtaining = button; break;
		case 2 : global.controls.player2.mapping.obtaining = button; break;
		case 3 : global.controls.player3.mapping.obtaining = button; break;
		case 4 : global.controls.player4.mapping.obtaining = button; break;
	}
}

/// @function		get_any_input(player)
/// @desc			Gets any input from any device other than touch screen
/// @arg player		1-4, which player are we checking input for (needed for gp)
function get_any_input(player) {
	if (keyboard_check(vk_anykey)) {
		return keyboard_key;
	}
	
	if (mouse_check_button(mb_any)) {
		return mouse_button;
	}
	
	if (player == 1 && global.controls.player1.controller.guid != pointer_null) {
		var gamepadSlot = global.controls.player1.controller.slot;
		if (gamepad_button_check(gamepadSlot, gp_face1)) {
			return gp_face1;
		} else if (gamepad_button_check(gamepadSlot, gp_face2)) {
			return gp_face2;
		} else if (gamepad_button_check(gamepadSlot, gp_face3)) {
			return gp_face3;
		} else if (gamepad_button_check(gamepadSlot, gp_face4)) {
			return gp_face4;
		} else if (gamepad_button_check(gamepadSlot, gp_start)) {
			return gp_start;
		} else if (gamepad_button_check(gamepadSlot, gp_select)) {
			return gp_select;
		} else if (gamepad_button_check(gamepadSlot, gp_padd)) {
			return gp_padd;
		} else if (gamepad_button_check(gamepadSlot, gp_padu)) {
			return gp_padu;
		} else if (gamepad_button_check(gamepadSlot, gp_padl)) {
			return gp_padl;
		} else if (gamepad_button_check(gamepadSlot, gp_padr)) {
			return gp_padr;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderl)) {
			return gp_shoulderl;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderlb)) {
			return gp_shoulderlb;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderr)) {
			return gp_shoulderr;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderrb)) {
			return gp_shoulderrb;
		} else if (gamepad_button_check(gamepadSlot, gp_stickl)) {
			return gp_stickl;
		} else if (gamepad_button_check(gamepadSlot, gp_stickr)) {
			return gp_stickr;
		}
	}
	
	if (player == 2 && global.controls.player2.controller.guid != pointer_null) {
		var gamepadSlot = global.controls.player2.controller.slot;
		if (gamepad_button_check(gamepadSlot, gp_face1)) {
			return gp_face1;
		} else if (gamepad_button_check(gamepadSlot, gp_face2)) {
			return gp_face2;
		} else if (gamepad_button_check(gamepadSlot, gp_face3)) {
			return gp_face3;
		} else if (gamepad_button_check(gamepadSlot, gp_face4)) {
			return gp_face4;
		} else if (gamepad_button_check(gamepadSlot, gp_start)) {
			return gp_start;
		} else if (gamepad_button_check(gamepadSlot, gp_select)) {
			return gp_select;
		} else if (gamepad_button_check(gamepadSlot, gp_padd)) {
			return gp_padd;
		} else if (gamepad_button_check(gamepadSlot, gp_padu)) {
			return gp_padu;
		} else if (gamepad_button_check(gamepadSlot, gp_padl)) {
			return gp_padl;
		} else if (gamepad_button_check(gamepadSlot, gp_padr)) {
			return gp_padr;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderl)) {
			return gp_shoulderl;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderlb)) {
			return gp_shoulderlb;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderr)) {
			return gp_shoulderr;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderrb)) {
			return gp_shoulderrb;
		} else if (gamepad_button_check(gamepadSlot, gp_stickl)) {
			return gp_stickl;
		} else if (gamepad_button_check(gamepadSlot, gp_stickr)) {
			return gp_stickr;
		}
	}
	
	if (player == 3 && global.controls.player3.controller.guid != pointer_null) {
		var gamepadSlot = global.controls.player3.controller.slot;
		if (gamepad_button_check(gamepadSlot, gp_face1)) {
			return gp_face1;
		} else if (gamepad_button_check(gamepadSlot, gp_face2)) {
			return gp_face2;
		} else if (gamepad_button_check(gamepadSlot, gp_face3)) {
			return gp_face3;
		} else if (gamepad_button_check(gamepadSlot, gp_face4)) {
			return gp_face4;
		} else if (gamepad_button_check(gamepadSlot, gp_start)) {
			return gp_start;
		} else if (gamepad_button_check(gamepadSlot, gp_select)) {
			return gp_select;
		} else if (gamepad_button_check(gamepadSlot, gp_padd)) {
			return gp_padd;
		} else if (gamepad_button_check(gamepadSlot, gp_padu)) {
			return gp_padu;
		} else if (gamepad_button_check(gamepadSlot, gp_padl)) {
			return gp_padl;
		} else if (gamepad_button_check(gamepadSlot, gp_padr)) {
			return gp_padr;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderl)) {
			return gp_shoulderl;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderlb)) {
			return gp_shoulderlb;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderr)) {
			return gp_shoulderr;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderrb)) {
			return gp_shoulderrb;
		} else if (gamepad_button_check(gamepadSlot, gp_stickl)) {
			return gp_stickl;
		} else if (gamepad_button_check(gamepadSlot, gp_stickr)) {
			return gp_stickr;
		}
	}
	
	if (player == 4 && global.controls.player4.controller.guid != pointer_null) {
		var gamepadSlot = global.controls.player4.controller.slot;
		if (gamepad_button_check(gamepadSlot, gp_face1)) {
			return gp_face1;
		} else if (gamepad_button_check(gamepadSlot, gp_face2)) {
			return gp_face2;
		} else if (gamepad_button_check(gamepadSlot, gp_face3)) {
			return gp_face3;
		} else if (gamepad_button_check(gamepadSlot, gp_face4)) {
			return gp_face4;
		} else if (gamepad_button_check(gamepadSlot, gp_start)) {
			return gp_start;
		} else if (gamepad_button_check(gamepadSlot, gp_select)) {
			return gp_select;
		} else if (gamepad_button_check(gamepadSlot, gp_padd)) {
			return gp_padd;
		} else if (gamepad_button_check(gamepadSlot, gp_padu)) {
			return gp_padu;
		} else if (gamepad_button_check(gamepadSlot, gp_padl)) {
			return gp_padl;
		} else if (gamepad_button_check(gamepadSlot, gp_padr)) {
			return gp_padr;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderl)) {
			return gp_shoulderl;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderlb)) {
			return gp_shoulderlb;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderr)) {
			return gp_shoulderr;
		} else if (gamepad_button_check(gamepadSlot, gp_shoulderrb)) {
			return gp_shoulderrb;
		} else if (gamepad_button_check(gamepadSlot, gp_stickl)) {
			return gp_stickl;
		} else if (gamepad_button_check(gamepadSlot, gp_stickr)) {
			return gp_stickr;
		}
	}
	
	return pointer_null;
}

/// @function		key_translate(player, key)
/// @desc			gives a human readable version of an input key or button
/// @arg player		1-4, which player are we checking input for (needed for gp)
/// @arg key
function key_translate(player, key) {
	var gamepadSlot = 
	{
		face1 : string_retrieve_lang(4),
		face2 : string_retrieve_lang(5), 
		face3 : string_retrieve_lang(6),
		face4 : string_retrieve_lang(7),
		start : string_retrieve_lang(12),
		select : string_retrieve_lang(13),
		shoulderr : string_retrieve_lang(14),
		shoulderrb : string_retrieve_lang(15),
		shoulderl : string_retrieve_lang(16),
		shoulderlb : string_retrieve_lang(17)
	};
	
	if (player == 1 && global.controls.player1.controller.guid != pointer_null) gamepadSlot = global.controls.player1.controller;
	else if (player == 2 && global.controls.player2.controller.guid != pointer_null) gamepadSlot = global.controls.player2.controller;
	else if (player == 3 && global.controls.player3.controller.guid != pointer_null) gamepadSlot = global.controls.player3.controller;
	else if (player == 4 && global.controls.player4.controller.guid != pointer_null) gamepadSlot = global.controls.player4.controller;
	
	switch (key) {
		case -1 : return " "; break;
		case vk_add : return "+"; break;
		case vk_alt : return string_retrieve_lang(38); break;
		case vk_backspace : return string_retrieve_lang(39); break;
		case vk_control : return string_retrieve_lang(40); break;
		case vk_decimal : return "."; break;
		case vk_divide : return "/"; break;
		case vk_down : return string_retrieve_lang(41); break;
		case vk_end : return string_retrieve_lang(42); break;
		case vk_enter : return string_retrieve_lang(43); break;
		case vk_escape : return string_retrieve_lang(44); break;
		case vk_f1 : return "F1"; break;
		case vk_f2 : return "F2"; break;
		case vk_f3 : return "F3"; break;
		case vk_f4 : return "F4"; break;
		case vk_f5 : return "F5"; break;
		case vk_f6 : return "F6"; break;
		case vk_f7 : return "F7"; break;
		case vk_f8 : return "F8"; break;
		case vk_f9 : return "F9"; break;
		case vk_f10 : return "F10"; break;
		case vk_f11 : return "F11"; break;
		case vk_f12 : return "F12"; break;
		case vk_home : return string_retrieve_lang(45); break;
		case vk_insert : return string_retrieve_lang(46); break;
		case vk_lalt : return string_retrieve_lang(38); break;
		case vk_lcontrol : return string_retrieve_lang(40); break;
		case vk_left : return string_retrieve_lang(47); break;
		case vk_lshift : return string_retrieve_lang(48); break;
		case vk_multiply : return "*"; break;
		case vk_numpad0 : return "0"; break;
		case vk_numpad1 : return "1"; break;
		case vk_numpad2 : return "2"; break;
		case vk_numpad3 : return "3"; break;
		case vk_numpad4 : return "4"; break;
		case vk_numpad5 : return "5"; break;
		case vk_numpad6 : return "6"; break;
		case vk_numpad7 : return "7"; break;
		case vk_numpad8 : return "8"; break;
		case vk_numpad9 : return "9"; break;
		case vk_pagedown : return string_retrieve_lang(49); break;
		case vk_pageup : return string_retrieve_lang(50); break;
		case vk_pause : return string_retrieve_lang(51); break;
		case vk_printscreen : return "Prt Scr"; break;
		case vk_ralt : return string_retrieve_lang(38); break;
		case vk_rcontrol : return string_retrieve_lang(40); break;
		case vk_right : return string_retrieve_lang(52); break;
		case vk_rshift : return string_retrieve_lang(48); break;
		case vk_shift : return string_retrieve_lang(48); break;
		case vk_space : return string_retrieve_lang(53); break;
		case vk_subtract : return "-"; break;
		case vk_tab : return string_retrieve_lang(54); break;
		case vk_up : return string_retrieve_lang(55); break;
		case mb_left : return string_retrieve_lang(58); break;
		case mb_right : return string_retrieve_lang(59); break;
		case mb_middle : return string_retrieve_lang(60); break;
		case mb_side1 : return string_retrieve_lang(61); break;
		case mb_side2 : return string_retrieve_lang(62); break;
		case gp_face1 : return gamepadSlot.face1; break;
		case gp_face2 : return gamepadSlot.face2; break;
		case gp_face3 : return gamepadSlot.face3; break;
		case gp_face4 : return gamepadSlot.face4; break;
		case gp_padd : return string_retrieve_lang(8); break;
		case gp_padl : return string_retrieve_lang(9); break;
		case gp_padr : return string_retrieve_lang(10); break;
		case gp_padu : return string_retrieve_lang(11); break;
		case gp_start : return gamepadSlot.start; break;
		case gp_select : return gamepadSlot.select; break;
		case gp_shoulderl : return gamepadSlot.shoulderl; break;
		case gp_shoulderlb : return gamepadSlot.shoulderlb; break;
		case gp_shoulderr : return gamepadSlot.shoulderr; break;
		case gp_shoulderrb : return gamepadSlot.shoulderrb; break;
		case gp_stickl : return string_retrieve_lang(18); break;
		case gp_stickr : return string_retrieve_lang(19); break;
	}
	
	if (is_numeric(key)) {
		return chr(key);
	} else {
		return "Unknown";
	}
}

/// @function		translate_gamepad_button(slot, button)
/// @desc			translates Game Maker generic gp_* to human readable text
/// @arg slot
/// @arg button
function translate_gamepad_button(slot, button) {
	var desc = string_lower(gamepad_get_description(slot));
	
	if (string_count("playstation", desc) > 0 || string_count("sony", desc) > 0 || 
	string_count("ps3", desc) > 0 || string_count("ps4", desc) > 0 || string_count("ps5", desc) > 0
	|| string_count("dualshock", desc) > 0) {
		if (button == gp_face1) return string_retrieve_lang(22);
		else if (button == gp_face2) return string_retrieve_lang(23);
		else if (button == gp_face3) return string_retrieve_lang(24);
		else if (button == gp_face4) return string_retrieve_lang(25);
		else if (button == gp_start) return string_retrieve_lang(26);
		else if (button == gp_select) return string_retrieve_lang(27);
		else if (button == gp_shoulderl) return "L1";
		else if (button == gp_shoulderlb) return "L2";
		else if (button == gp_shoulderr) return "R1";
		else if (button == gp_shoulderrb) return "R2";
	} else if (string_count("microsoft", desc) > 0 || string_count("xbox", desc) > 0 ||
	string_count("360", desc) > 0 || string_count("xinput", desc) > 0) {
		if (button == gp_face1) return "A";
		else if (button == gp_face2) return "B";
		else if (button == gp_face3) return "X";
		else if (button == gp_face4) return "Y";
		else if (button == gp_start) return string_retrieve_lang(30);
		else if (button == gp_select) return string_retrieve_lang(31);
		else if (button == gp_shoulderl) return "LB";
		else if (button == gp_shoulderlb) return "LT";
		else if (button == gp_shoulderr) return "RB";
		else if (button == gp_shoulderrb) return "RT";
	} else if (string_count("nintendo", desc) > 0 || string_count("gamecube", desc) > 0 ||
	string_count("switch", desc) > 0) {
		if (button == gp_face1) return "B";
		else if (button == gp_face2) return "A";
		else if (button == gp_face3) return "Y";
		else if (button == gp_face4) return "X";
		else if (button == gp_start) return string_retrieve_lang(34);
		else if (button == gp_select) return string_retrieve_lang(35);
		else if (button == gp_shoulderl) return "L";
		else if (button == gp_shoulderlb) return "ZL";
		else if (button == gp_shoulderr) return "R";
		else if (button == gp_shoulderrb) return "ZR";
	} else {
		if (button == gp_face1) return string_retrieve_lang(4);
		else if (button == gp_face2) return string_retrieve_lang(5);
		else if (button == gp_face3) return string_retrieve_lang(6);
		else if (button == gp_face4) return string_retrieve_lang(7);
		else if (button == gp_start) return string_retrieve_lang(12);
		else if (button == gp_select) return string_retrieve_lang(13);
		else if (button == gp_shoulderl) return string_retrieve_lang(16);
		else if (button == gp_shoulderlb) return string_retrieve_lang(17);
		else if (button == gp_shoulderr) return string_retrieve_lang(14);
		else if (button == gp_shoulderrb) return string_retrieve_lang(15);
	}
}