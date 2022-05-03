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

	for (var i=0; i<gamepad_get_device_count(); i++) {
		if (gamepad_is_connected(i)) {
			if (global.controllers.gamepad1 == pointer_null &&
			(global.controllers.gamepad2 == pointer_null || global.controllers.gamepad2.slot != i) && 
			(global.controllers.gamepad3 == pointer_null || global.controllers.gamepad3.slot != i) && 
			(global.controllers.gamepad4 == pointer_null || global.controllers.gamepad4.slot != i)) {
				global.controllers.gamepad1 = 
				{
					guid : gamepad_get_guid(i),
					slot : i,
					description : gamepad_get_description(i),
					bottom : translateGamepadButton(i,gp_face1),
					right : translateGamepadButton(i,gp_face2), 
					left : translateGamepadButton(i,gp_face3),
					top : translateGamepadButton(i,gp_face4),
					start : translateGamepadButton(i,gp_start),
					select : translateGamepadButton(i,gp_select),
					lb : translateGamepadButton(i,gp_shoulderl),
					lr : translateGamepadButton(i,gp_shoulderlb),
					rb : translateGamepadButton(i,gp_shoulderr),
					rr : translateGamepadButton(i,gp_shoulderrb)
				};
			} else if (global.controllers.gamepad2 == pointer_null &&
			(global.controllers.gamepad1 == pointer_null || global.controllers.gamepad1.slot != i) && 
			(global.controllers.gamepad3 == pointer_null || global.controllers.gamepad3.slot != i) && 
			(global.controllers.gamepad4 == pointer_null || global.controllers.gamepad4.slot != i)) {
				global.controllers.gamepad2 = 
				{
					guid : gamepad_get_guid(i),
					slot : i,
					description : gamepad_get_description(i),
					bottom : translateGamepadButton(i,gp_face1),
					right : translateGamepadButton(i,gp_face2), 
					left : translateGamepadButton(i,gp_face3),
					top : translateGamepadButton(i,gp_face4),
					start : translateGamepadButton(i,gp_start),
					select : translateGamepadButton(i,gp_select),
					lb : translateGamepadButton(i,gp_shoulderl),
					lr : translateGamepadButton(i,gp_shoulderlb),
					rb : translateGamepadButton(i,gp_shoulderr),
					rr : translateGamepadButton(i,gp_shoulderrb)
				};
			} else if (global.controllers.gamepad3 == pointer_null &&
			(global.controllers.gamepad2 == pointer_null || global.controllers.gamepad2.slot != i) && 
			(global.controllers.gamepad1 == pointer_null || global.controllers.gamepad1.slot != i) && 
			(global.controllers.gamepad4 == pointer_null || global.controllers.gamepad4.slot != i)) {
				global.controllers.gamepad3 = 
				{
					guid : gamepad_get_guid(i),
					slot : i,
					description : gamepad_get_description(i),
					bottom : translateGamepadButton(i,gp_face1),
					right : translateGamepadButton(i,gp_face2), 
					left : translateGamepadButton(i,gp_face3),
					top : translateGamepadButton(i,gp_face4),
					start : translateGamepadButton(i,gp_start),
					select : translateGamepadButton(i,gp_select),
					lb : translateGamepadButton(i,gp_shoulderl),
					lr : translateGamepadButton(i,gp_shoulderlb),
					rb : translateGamepadButton(i,gp_shoulderr),
					rr : translateGamepadButton(i,gp_shoulderrb)
				};
			} else if (global.controllers.gamepad4 == pointer_null &&
			(global.controllers.gamepad2 == pointer_null || global.controllers.gamepad2.slot != i) && 
			(global.controllers.gamepad3 == pointer_null || global.controllers.gamepad3.slot != i) && 
			(global.controllers.gamepad1 == pointer_null || global.controllers.gamepad1.slot != i)) {
				global.controllers.gamepad4 = 
				{
					guid : gamepad_get_guid(i),
					slot : i,
					description : gamepad_get_description(i),
					bottom : translateGamepadButton(i,gp_face1),
					right : translateGamepadButton(i,gp_face2), 
					left : translateGamepadButton(i,gp_face3),
					top : translateGamepadButton(i,gp_face4),
					start : translateGamepadButton(i,gp_start),
					select : translateGamepadButton(i,gp_select),
					lb : translateGamepadButton(i,gp_shoulderl),
					lr : translateGamepadButton(i,gp_shoulderlb),
					rb : translateGamepadButton(i,gp_shoulderr),
					rr : translateGamepadButton(i,gp_shoulderrb)
				};
			}
		}
	}
	
#endregion

#region re-arrange controllers in chronological connection order

	if (global.controllers.gamepad3 == pointer_null && global.controllers.gamepad4 != pointer_null) {
		global.controllers.gamepad3 = global.controllers.gamepad4; 
		global.controllers.gamepad4 = pointer_null;
	}
	
	if (global.controllers.gamepad2 == pointer_null && global.controllers.gamepad3 != pointer_null) {
		global.controllers.gamepad2 = global.controllers.gamepad3;
		global.controllers.gamepad3 = global.controllers.gamepad4;
		global.controllers.gamepad4 = pointer_null;
	}
	
	if (global.controllers.gamepad1 == pointer_null && global.controllers.gamepad2 != pointer_null) {
		global.controllers.gamepad1 = global.controllers.gamepad2;
		global.controllers.gamepad2 = global.controllers.gamepad3;
		global.controllers.gamepad3 = global.controllers.gamepad4;
		global.controllers.gamepad4 = pointer_null;
	}

#endregion

alarm[0] = 15;