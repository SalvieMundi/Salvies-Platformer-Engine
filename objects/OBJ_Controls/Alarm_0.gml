/// @description Search for connected gamepads

#region determine if any currently connected gamepads should be dropped

	if (global.controllers.gamepad1 != pointer_null) {
		if (!gamepad_is_connected(global.controllers.gamepad1.slot)) {
			global.controllers.gamepad1 = pointer_null;
		}
	}
	
	if (global.controllers.gamepad2 != pointer_null) {
		if (!gamepad_is_connected(global.controllers.gamepad2.slot)) {
			global.controllers.gamepad2 = pointer_null;
		}
	}
	
	if (global.controllers.gamepad3 != pointer_null) {
		if (!gamepad_is_connected(global.controllers.gamepad3.slot)) {
			global.controllers.gamepad3 = pointer_null;
		}
	}
	
	if (global.controllers.gamepad4 != pointer_null) {
		if (!gamepad_is_connected(global.controllers.gamepad4.slot)) {
			global.controllers.gamepad4 = pointer_null;
		}
	}

#endregion

#region add new gamepads to the in-game slots

	var gamepadCount = gamepad_get_device_count();

	for (var i=0; i<gamepadCount; i++) {
		if (gamepad_is_connected(i)) {
			
			var gamepad1 = global.controllers.gamepad1;
			var gamepad2 = global.controllers.gamepad2;
			var gamepad3 = global.controllers.gamepad3;
			var gamepad4 = global.controllers.gamepad4;
			var gamepadSlot1 = global.controllers.gamepad1.slot;
			var gamepadSlot2 = global.controllers.gamepad2.slot;
			var gamepadSlot3 = global.controllers.gamepad3.slot;
			var gamepadSlot4 = global.controllers.gamepad4.slot;
			
			if (gamepad1 == pointer_null &&
			(gamepad2 == pointer_null || gamepadSlot2 != i) && 
			(gamepad3 == pointer_null || gamepadSlot3 != i) && 
			(gamepad4 == pointer_null || gamepadSlot4 != i)) {
				global.controllers.gamepad1 = 
				{
					guid : gamepad_get_guid(i),
					slot : i,
					description : gamepad_get_description(i),
					bottom : translate_gamepad_button(i,gp_face1),
					right : translate_gamepad_button(i,gp_face2), 
					left : translate_gamepad_button(i,gp_face3),
					top : translate_gamepad_button(i,gp_face4),
					start : translate_gamepad_button(i,gp_start),
					select : translate_gamepad_button(i,gp_select),
					lb : translate_gamepad_button(i,gp_shoulderl),
					lr : translate_gamepad_button(i,gp_shoulderlb),
					rb : translate_gamepad_button(i,gp_shoulderr),
					rr : translate_gamepad_button(i,gp_shoulderrb)
				};
			} else if (gamepad2 == pointer_null &&
			(gamepad1 == pointer_null || gamepadSlot1 != i) && 
			(gamepad3 == pointer_null || gamepadSlot3 != i) && 
			(gamepad4 == pointer_null || gamepadSlot4 != i)) {
				global.controllers.gamepad2 = 
				{
					guid : gamepad_get_guid(i),
					slot : i,
					description : gamepad_get_description(i),
					bottom : translate_gamepad_button(i,gp_face1),
					right : translate_gamepad_button(i,gp_face2), 
					left : translate_gamepad_button(i,gp_face3),
					top : translate_gamepad_button(i,gp_face4),
					start : translate_gamepad_button(i,gp_start),
					select : translate_gamepad_button(i,gp_select),
					lb : translate_gamepad_button(i,gp_shoulderl),
					lr : translate_gamepad_button(i,gp_shoulderlb),
					rb : translate_gamepad_button(i,gp_shoulderr),
					rr : translate_gamepad_button(i,gp_shoulderrb)
				};
			} else if (gamepad3 == pointer_null &&
			(gamepad2 == pointer_null || gamepadSlot2 != i) && 
			(gamepad1 == pointer_null || gamepadSlot1 != i) && 
			(gamepad4 == pointer_null || gamepadSlot4 != i)) {
				global.controllers.gamepad3 = 
				{
					guid : gamepad_get_guid(i),
					slot : i,
					description : gamepad_get_description(i),
					bottom : translate_gamepad_button(i,gp_face1),
					right : translate_gamepad_button(i,gp_face2), 
					left : translate_gamepad_button(i,gp_face3),
					top : translate_gamepad_button(i,gp_face4),
					start : translate_gamepad_button(i,gp_start),
					select : translate_gamepad_button(i,gp_select),
					lb : translate_gamepad_button(i,gp_shoulderl),
					lr : translate_gamepad_button(i,gp_shoulderlb),
					rb : translate_gamepad_button(i,gp_shoulderr),
					rr : translate_gamepad_button(i,gp_shoulderrb)
				};
			} else if (gamepad4 == pointer_null &&
			(gamepad2 == pointer_null || gamepadSlot2 != i) && 
			(gamepad3 == pointer_null || gamepadSlot3 != i) && 
			(gamepad1 == pointer_null || gamepadSlot1 != i)) {
				global.controllers.gamepad4 = 
				{
					guid : gamepad_get_guid(i),
					slot : i,
					description : gamepad_get_description(i),
					bottom : translate_gamepad_button(i,gp_face1),
					right : translate_gamepad_button(i,gp_face2), 
					left : translate_gamepad_button(i,gp_face3),
					top : translate_gamepad_button(i,gp_face4),
					start : translate_gamepad_button(i,gp_start),
					select : translate_gamepad_button(i,gp_select),
					lb : translate_gamepad_button(i,gp_shoulderl),
					lr : translate_gamepad_button(i,gp_shoulderlb),
					rb : translate_gamepad_button(i,gp_shoulderr),
					rr : translate_gamepad_button(i,gp_shoulderrb)
				};
			}
		}
	}
	
#endregion

#region re-arrange controllers in chronological connection order

	var gamepad1 = global.controllers.gamepad1;
	var gamepad2 = global.controllers.gamepad2;
	var gamepad3 = global.controllers.gamepad3;
	var gamepad4 = global.controllers.gamepad4;

	if (gamepad3 == pointer_null && gamepad4 != pointer_null) {
		global.controllers.gamepad3 = gamepad4; 
		global.controllers.gamepad4 = pointer_null;
	}
	
	if (gamepad2 == pointer_null && gamepad3 != pointer_null) {
		global.controllers.gamepad2 = gamepad3;
		global.controllers.gamepad3 = gamepad4;
		global.controllers.gamepad4 = pointer_null;
	}
	
	if (gamepad1 == pointer_null && gamepad2 != pointer_null) {
		global.controllers.gamepad1 = gamepad2;
		global.controllers.gamepad2 = gamepad3;
		global.controllers.gamepad3 = gamepad4;
		global.controllers.gamepad4 = pointer_null;
	}

#endregion

alarm[0] = 15;