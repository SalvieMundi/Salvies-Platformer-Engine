/// @description get controls statuses

#region get control inputs for mapped controls for player 1

	if (!global.controls.inputBlocked) {
		global.controls.player1.up.isHeld = get_held(1, global.controls.player1.mapping.up);
		global.controls.player1.down.isHeld = get_held(1, global.controls.player1.mapping.down);
		global.controls.player1.left.isHeld = get_held(1, global.controls.player1.mapping.left);
		global.controls.player1.right.isHeld = get_held(1, global.controls.player1.mapping.right);
		global.controls.player1.attack.isHeld = get_held(1, global.controls.player1.mapping.attack);
		global.controls.player1.interact.isHeld = get_held(1, global.controls.player1.mapping.interact);
		global.controls.player1.special.isHeld = get_held(1, global.controls.player1.mapping.special);
		global.controls.player1.jump.isHeld = get_held(1, global.controls.player1.mapping.jump);
		global.controls.player1.pause.isHeld = get_held(1, global.controls.player1.mapping.pause);

		global.controls.player1.up.wasPressed = get_pressed(1, global.controls.player1.mapping.up);
		global.controls.player1.down.wasPressed = get_pressed(1, global.controls.player1.mapping.down);
		global.controls.player1.left.wasPressed = get_pressed(1, global.controls.player1.mapping.left);
		global.controls.player1.right.wasPressed = get_pressed(1, global.controls.player1.mapping.right);
		global.controls.player1.attack.wasPressed = get_pressed(1, global.controls.player1.mapping.attack);
		global.controls.player1.interact.wasPressed = get_pressed(1, global.controls.player1.mapping.interact);
		global.controls.player1.special.wasPressed = get_pressed(1, global.controls.player1.mapping.special);
		global.controls.player1.jump.wasPressed = get_pressed(1, global.controls.player1.mapping.jump);
		global.controls.player1.pause.wasPressed = get_pressed(1, global.controls.player1.mapping.pause);

		global.controls.player1.up.wasReleased = get_released(1, global.controls.player1.mapping.up);
		global.controls.player1.down.wasReleased = get_released(1, global.controls.player1.mapping.down);
		global.controls.player1.left.wasReleased = get_released(1, global.controls.player1.mapping.left);
		global.controls.player1.right.wasReleased = get_released(1, global.controls.player1.mapping.right);
		global.controls.player1.attack.wasReleased = get_released(1, global.controls.player1.mapping.attack);
		global.controls.player1.interact.wasReleased = get_released(1, global.controls.player1.mapping.interact);
		global.controls.player1.special.wasReleased = get_released(1, global.controls.player1.mapping.special);
		global.controls.player1.jump.wasReleased = get_released(1, global.controls.player1.mapping.jump);
		global.controls.player1.pause.wasReleased = get_released(1, global.controls.player1.mapping.pause);
	} else {
		global.controls.player1.up.isHeld = false;
		global.controls.player1.down.isHeld = false;
		global.controls.player1.left.isHeld = false;
		global.controls.player1.right.isHeld = false;
		global.controls.player1.attack.isHeld = false;
		global.controls.player1.interact.isHeld = false;
		global.controls.player1.special.isHeld = false;
		global.controls.player1.jump.isHeld = false;
		global.controls.player1.pause.isHeld = false;

		global.controls.player1.up.wasPressed = false;
		global.controls.player1.down.wasPressed = false;
		global.controls.player1.left.wasPressed = false;
		global.controls.player1.right.wasPressed = false;
		global.controls.player1.attack.wasPressed = false;
		global.controls.player1.interact.wasPressed = false;
		global.controls.player1.special.wasPressed = false;
		global.controls.player1.jump.wasPressed = false;
		global.controls.player1.pause.wasPressed = false;

		global.controls.player1.up.wasReleased = false;
		global.controls.player1.down.wasReleased = false;
		global.controls.player1.left.wasReleased = false;
		global.controls.player1.right.wasReleased = false;
		global.controls.player1.attack.wasReleased = false;
		global.controls.player1.interact.wasReleased = false;
		global.controls.player1.special.wasReleased = false;
		global.controls.player1.jump.wasReleased = false;
		global.controls.player1.pause.wasReleased = false;
	}

#endregion

#region get control for purpose of mapping somewhere to player 1

	if (global.controls.player1.mapping.obtaining != "" && global.controls.player1.mapping.obtaining != "waiting for button release") {
		var input = get_any_input(1);
		if (input != pointer_null) {
			if (global.controls.player1.mapping.obtaining = "up") {
				global.controls.player1.mapping.up = input;
				if (global.controls.player1.mapping.down == input) global.controls.player1.mapping.down = -1;
				if (global.controls.player1.mapping.left == input) global.controls.player1.mapping.left = -1;
				if (global.controls.player1.mapping.right == input) global.controls.player1.mapping.right = -1;
				if (global.controls.player1.mapping.attack == input) global.controls.player1.mapping.attack = -1;
				if (global.controls.player1.mapping.interact == input) global.controls.player1.mapping.interact = -1;
				if (global.controls.player1.mapping.jump == input) global.controls.player1.mapping.jump = -1;
				if (global.controls.player1.mapping.pause == input) global.controls.player1.mapping.pause = -1;
				if (global.controls.player1.mapping.special == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player1.mapping.obtaining = "down") {
				global.controls.player1.mapping.down = input;
				if (global.controls.player1.mapping.up == input) global.controls.player1.mapping.up = -1;
				if (global.controls.player1.mapping.left == input) global.controls.player1.mapping.left = -1;
				if (global.controls.player1.mapping.right == input) global.controls.player1.mapping.right = -1;
				if (global.controls.player1.mapping.attack == input) global.controls.player1.mapping.attack = -1;
				if (global.controls.player1.mapping.interact == input) global.controls.player1.mapping.interact = -1;
				if (global.controls.player1.mapping.jump == input) global.controls.player1.mapping.jump = -1;
				if (global.controls.player1.mapping.pause == input) global.controls.player1.mapping.pause = -1;
				if (global.controls.player1.mapping.special == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player1.mapping.obtaining = "left") {
				global.controls.player1.mapping.left = input;
				if (global.controls.player1.mapping.down == input) global.controls.player1.mapping.down = -1;
				if (global.controls.player1.mapping.up == input) global.controls.player1.mapping.up = -1;
				if (global.controls.player1.mapping.right == input) global.controls.player1.mapping.right = -1;
				if (global.controls.player1.mapping.attack == input) global.controls.player1.mapping.attack = -1;
				if (global.controls.player1.mapping.interact == input) global.controls.player1.mapping.interact = -1;
				if (global.controls.player1.mapping.jump == input) global.controls.player1.mapping.jump = -1;
				if (global.controls.player1.mapping.pause == input) global.controls.player1.mapping.pause = -1;
				if (global.controls.player1.mapping.special == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player1.mapping.obtaining = "right") {
				global.controls.player1.mapping.right = input;
				if (global.controls.player1.mapping.down == input) global.controls.player1.mapping.down = -1;
				if (global.controls.player1.mapping.left == input) global.controls.player1.mapping.left = -1;
				if (global.controls.player1.mapping.up == input) global.controls.player1.mapping.up = -1;
				if (global.controls.player1.mapping.attack == input) global.controls.player1.mapping.attack = -1;
				if (global.controls.player1.mapping.interact == input) global.controls.player1.mapping.interact = -1;
				if (global.controls.player1.mapping.jump == input) global.controls.player1.mapping.jump = -1;
				if (global.controls.player1.mapping.pause == input) global.controls.player1.mapping.pause = -1;
				if (global.controls.player1.mapping.special == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player1.mapping.obtaining = "attack") {
				global.controls.player1.mapping.attack = input;
				if (global.controls.player1.mapping.down == input) global.controls.player1.mapping.down = -1;
				if (global.controls.player1.mapping.left == input) global.controls.player1.mapping.left = -1;
				if (global.controls.player1.mapping.right == input) global.controls.player1.mapping.right = -1;
				if (global.controls.player1.mapping.up == input) global.controls.player1.mapping.up = -1;
				if (global.controls.player1.mapping.interact == input) global.controls.player1.mapping.interact = -1;
				if (global.controls.player1.mapping.jump == input) global.controls.player1.mapping.jump = -1;
				if (global.controls.player1.mapping.pause == input) global.controls.player1.mapping.pause = -1;
				if (global.controls.player1.mapping.special == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player1.mapping.obtaining = "interact") {
				global.controls.player1.mapping.interact = input;
				if (global.controls.player1.mapping.down == input) global.controls.player1.mapping.down = -1;
				if (global.controls.player1.mapping.left == input) global.controls.player1.mapping.left = -1;
				if (global.controls.player1.mapping.right == input) global.controls.player1.mapping.right = -1;
				if (global.controls.player1.mapping.attack == input) global.controls.player1.mapping.attack = -1;
				if (global.controls.player1.mapping.jump == input) global.controls.player1.mapping.jump = -1;
				if (global.controls.player1.mapping.up == input) global.controls.player1.mapping.up = -1;
				if (global.controls.player1.mapping.pause == input) global.controls.player1.mapping.pause = -1;
				if (global.controls.player1.mapping.special == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player1.mapping.obtaining = "jump") {
				global.controls.player1.mapping.jump = input;
				if (global.controls.player1.mapping.down == input) global.controls.player1.mapping.down = -1;
				if (global.controls.player1.mapping.left == input) global.controls.player1.mapping.left = -1;
				if (global.controls.player1.mapping.right == input) global.controls.player1.mapping.right = -1;
				if (global.controls.player1.mapping.attack == input) global.controls.player1.mapping.attack = -1;
				if (global.controls.player1.mapping.interact == input) global.controls.player1.mapping.interact = -1;
				if (global.controls.player1.mapping.up == input) global.controls.player1.mapping.up = -1;
				if (global.controls.player1.mapping.pause == input) global.controls.player1.mapping.pause = -1;
				if (global.controls.player1.mapping.special == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player1.mapping.obtaining = "pause") {
				global.controls.player1.mapping.pause = input;
				if (global.controls.player1.mapping.down == input) global.controls.player1.mapping.down = -1;
				if (global.controls.player1.mapping.left == input) global.controls.player1.mapping.left = -1;
				if (global.controls.player1.mapping.right == input) global.controls.player1.mapping.right = -1;
				if (global.controls.player1.mapping.attack == input) global.controls.player1.mapping.attack = -1;
				if (global.controls.player1.mapping.interact == input) global.controls.player1.mapping.interact = -1;
				if (global.controls.player1.mapping.jump == input) global.controls.player1.mapping.jump = -1;
				if (global.controls.player1.mapping.up == input) global.controls.player1.mapping.up = -1;
				if (global.controls.player1.mapping.special == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player1.mapping.obtaining = "special") {
				global.controls.player1.mapping.special = input;
				if (global.controls.player1.mapping.down == input) global.controls.player1.mapping.down = -1;
				if (global.controls.player1.mapping.left == input) global.controls.player1.mapping.left = -1;
				if (global.controls.player1.mapping.right == input) global.controls.player1.mapping.right = -1;
				if (global.controls.player1.mapping.attack == input) global.controls.player1.mapping.attack = -1;
				if (global.controls.player1.mapping.interact == input) global.controls.player1.mapping.interact = -1;
				if (global.controls.player1.mapping.jump == input) global.controls.player1.mapping.jump = -1;
				if (global.controls.player1.mapping.up == input) global.controls.player1.mapping.up = -1;
				if (global.controls.player1.mapping.pause == input) global.controls.player1.mapping.pause = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			}
		}
	} else if (global.controls.player1.mapping.obtaining == "waiting for button release") {	
		if (get_any_input(1) == pointer_null) {
			if (global.controls.inputBlocked) global.controls.inputBlocked = false;
			global.controls.player1.mapping.obtaining = "";
		}
	}

#endregion

#region get control inputs for mapped controls for player 2

	if (!global.controls.inputBlocked) {
		global.controls.player2.up.isHeld = get_held(2, global.controls.player2.mapping.up);
		global.controls.player2.down.isHeld = get_held(2, global.controls.player2.mapping.down);
		global.controls.player2.left.isHeld = get_held(2, global.controls.player2.mapping.left);
		global.controls.player2.right.isHeld = get_held(2, global.controls.player2.mapping.right);
		global.controls.player2.attack.isHeld = get_held(2, global.controls.player2.mapping.attack);
		global.controls.player2.interact.isHeld = get_held(2, global.controls.player2.mapping.interact);
		global.controls.player2.special.isHeld = get_held(2, global.controls.player2.mapping.special);
		global.controls.player2.jump.isHeld = get_held(2, global.controls.player2.mapping.jump);
		global.controls.player2.pause.isHeld = get_held(2, global.controls.player2.mapping.pause);

		global.controls.player2.up.wasPressed = get_pressed(2, global.controls.player2.mapping.up);
		global.controls.player2.down.wasPressed = get_pressed(2, global.controls.player2.mapping.down);
		global.controls.player2.left.wasPressed = get_pressed(2, global.controls.player2.mapping.left);
		global.controls.player2.right.wasPressed = get_pressed(2, global.controls.player2.mapping.right);
		global.controls.player2.attack.wasPressed = get_pressed(2, global.controls.player2.mapping.attack);
		global.controls.player2.interact.wasPressed = get_pressed(2, global.controls.player2.mapping.interact);
		global.controls.player2.special.wasPressed = get_pressed(2, global.controls.player2.mapping.special);
		global.controls.player2.jump.wasPressed = get_pressed(2, global.controls.player2.mapping.jump);
		global.controls.player2.pause.wasPressed = get_pressed(2, global.controls.player2.mapping.pause);

		global.controls.player2.up.wasReleased = get_released(2, global.controls.player2.mapping.up);
		global.controls.player2.down.wasReleased = get_released(2, global.controls.player2.mapping.down);
		global.controls.player2.left.wasReleased = get_released(2, global.controls.player2.mapping.left);
		global.controls.player2.right.wasReleased = get_released(2, global.controls.player2.mapping.right);
		global.controls.player2.attack.wasReleased = get_released(2, global.controls.player2.mapping.attack);
		global.controls.player2.interact.wasReleased = get_released(2, global.controls.player2.mapping.interact);
		global.controls.player2.special.wasReleased = get_released(2, global.controls.player2.mapping.special);
		global.controls.player2.jump.wasReleased = get_released(2, global.controls.player2.mapping.jump);
		global.controls.player2.pause.wasReleased = get_released(2, global.controls.player2.mapping.pause);
	} else {
		global.controls.player2.up.isHeld = false;
		global.controls.player2.down.isHeld = false;
		global.controls.player2.left.isHeld = false;
		global.controls.player2.right.isHeld = false;
		global.controls.player2.attack.isHeld = false;
		global.controls.player2.interact.isHeld = false;
		global.controls.player2.special.isHeld = false;
		global.controls.player2.jump.isHeld = false;
		global.controls.player2.pause.isHeld = false;

		global.controls.player2.up.wasPressed = false;
		global.controls.player2.down.wasPressed = false;
		global.controls.player2.left.wasPressed = false;
		global.controls.player2.right.wasPressed = false;
		global.controls.player2.attack.wasPressed = false;
		global.controls.player2.interact.wasPressed = false;
		global.controls.player2.special.wasPressed = false;
		global.controls.player2.jump.wasPressed = false;
		global.controls.player2.pause.wasPressed = false;

		global.controls.player2.up.wasReleased = false;
		global.controls.player2.down.wasReleased = false;
		global.controls.player2.left.wasReleased = false;
		global.controls.player2.right.wasReleased = false;
		global.controls.player2.attack.wasReleased = false;
		global.controls.player2.interact.wasReleased = false;
		global.controls.player2.special.wasReleased = false;
		global.controls.player2.jump.wasReleased = false;
		global.controls.player2.pause.wasReleased = false;
	}

#endregion

#region get control for purpose of mapping somewhere to player 2

	if (global.controls.player2.mapping.obtaining != "" && global.controls.player2.mapping.obtaining != "waiting for button release") {
		var input = get_any_input(2);
		if (input != pointer_null) {
			if (global.controls.player2.mapping.obtaining = "up") {
				global.controls.player2.mapping.up = input;
				if (global.controls.player2.mapping.down == input) global.controls.player2.mapping.down = -1;
				if (global.controls.player2.mapping.left == input) global.controls.player2.mapping.left = -1;
				if (global.controls.player2.mapping.right == input) global.controls.player2.mapping.right = -1;
				if (global.controls.player2.mapping.attack == input) global.controls.player2.mapping.attack = -1;
				if (global.controls.player2.mapping.interact == input) global.controls.player2.mapping.interact = -1;
				if (global.controls.player2.mapping.jump == input) global.controls.player2.mapping.jump = -1;
				if (global.controls.player2.mapping.pause == input) global.controls.player2.mapping.pause = -1;
				if (global.controls.player2.mapping.special == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player2.mapping.obtaining = "down") {
				global.controls.player2.mapping.down = input;
				if (global.controls.player2.mapping.up == input) global.controls.player2.mapping.up = -1;
				if (global.controls.player2.mapping.left == input) global.controls.player2.mapping.left = -1;
				if (global.controls.player2.mapping.right == input) global.controls.player2.mapping.right = -1;
				if (global.controls.player2.mapping.attack == input) global.controls.player2.mapping.attack = -1;
				if (global.controls.player2.mapping.interact == input) global.controls.player2.mapping.interact = -1;
				if (global.controls.player2.mapping.jump == input) global.controls.player2.mapping.jump = -1;
				if (global.controls.player2.mapping.pause == input) global.controls.player2.mapping.pause = -1;
				if (global.controls.player2.mapping.special == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player2.mapping.obtaining = "left") {
				global.controls.player2.mapping.left = input;
				if (global.controls.player2.mapping.down == input) global.controls.player2.mapping.down = -1;
				if (global.controls.player2.mapping.up == input) global.controls.player2.mapping.up = -1;
				if (global.controls.player2.mapping.right == input) global.controls.player2.mapping.right = -1;
				if (global.controls.player2.mapping.attack == input) global.controls.player2.mapping.attack = -1;
				if (global.controls.player2.mapping.interact == input) global.controls.player2.mapping.interact = -1;
				if (global.controls.player2.mapping.jump == input) global.controls.player2.mapping.jump = -1;
				if (global.controls.player2.mapping.pause == input) global.controls.player2.mapping.pause = -1;
				if (global.controls.player2.mapping.special == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player2.mapping.obtaining = "right") {
				global.controls.player2.mapping.right = input;
				if (global.controls.player2.mapping.down == input) global.controls.player2.mapping.down = -1;
				if (global.controls.player2.mapping.left == input) global.controls.player2.mapping.left = -1;
				if (global.controls.player2.mapping.up == input) global.controls.player2.mapping.up = -1;
				if (global.controls.player2.mapping.attack == input) global.controls.player2.mapping.attack = -1;
				if (global.controls.player2.mapping.interact == input) global.controls.player2.mapping.interact = -1;
				if (global.controls.player2.mapping.jump == input) global.controls.player2.mapping.jump = -1;
				if (global.controls.player2.mapping.pause == input) global.controls.player2.mapping.pause = -1;
				if (global.controls.player2.mapping.special == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player2.mapping.obtaining = "attack") {
				global.controls.player2.mapping.attack = input;
				if (global.controls.player2.mapping.down == input) global.controls.player2.mapping.down = -1;
				if (global.controls.player2.mapping.left == input) global.controls.player2.mapping.left = -1;
				if (global.controls.player2.mapping.right == input) global.controls.player2.mapping.right = -1;
				if (global.controls.player2.mapping.up == input) global.controls.player2.mapping.up = -1;
				if (global.controls.player2.mapping.interact == input) global.controls.player2.mapping.interact = -1;
				if (global.controls.player2.mapping.jump == input) global.controls.player2.mapping.jump = -1;
				if (global.controls.player2.mapping.pause == input) global.controls.player2.mapping.pause = -1;
				if (global.controls.player2.mapping.special == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player2.mapping.obtaining = "interact") {
				global.controls.player2.mapping.interact = input;
				if (global.controls.player2.mapping.down == input) global.controls.player2.mapping.down = -1;
				if (global.controls.player2.mapping.left == input) global.controls.player2.mapping.left = -1;
				if (global.controls.player2.mapping.right == input) global.controls.player2.mapping.right = -1;
				if (global.controls.player2.mapping.attack == input) global.controls.player2.mapping.attack = -1;
				if (global.controls.player2.mapping.jump == input) global.controls.player2.mapping.jump = -1;
				if (global.controls.player2.mapping.up == input) global.controls.player2.mapping.up = -1;
				if (global.controls.player2.mapping.pause == input) global.controls.player2.mapping.pause = -1;
				if (global.controls.player2.mapping.special == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player2.mapping.obtaining = "jump") {
				global.controls.player2.mapping.jump = input;
				if (global.controls.player2.mapping.down == input) global.controls.player2.mapping.down = -1;
				if (global.controls.player2.mapping.left == input) global.controls.player2.mapping.left = -1;
				if (global.controls.player2.mapping.right == input) global.controls.player2.mapping.right = -1;
				if (global.controls.player2.mapping.attack == input) global.controls.player2.mapping.attack = -1;
				if (global.controls.player2.mapping.interact == input) global.controls.player2.mapping.interact = -1;
				if (global.controls.player2.mapping.up == input) global.controls.player2.mapping.up = -1;
				if (global.controls.player2.mapping.pause == input) global.controls.player2.mapping.pause = -1;
				if (global.controls.player2.mapping.special == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player2.mapping.obtaining = "pause") {
				global.controls.player2.mapping.pause = input;
				if (global.controls.player2.mapping.down == input) global.controls.player2.mapping.down = -1;
				if (global.controls.player2.mapping.left == input) global.controls.player2.mapping.left = -1;
				if (global.controls.player2.mapping.right == input) global.controls.player2.mapping.right = -1;
				if (global.controls.player2.mapping.attack == input) global.controls.player2.mapping.attack = -1;
				if (global.controls.player2.mapping.interact == input) global.controls.player2.mapping.interact = -1;
				if (global.controls.player2.mapping.jump == input) global.controls.player2.mapping.jump = -1;
				if (global.controls.player2.mapping.up == input) global.controls.player2.mapping.up = -1;
				if (global.controls.player2.mapping.special == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player2.mapping.obtaining = "special") {
				global.controls.player2.mapping.special = input;
				if (global.controls.player2.mapping.down == input) global.controls.player2.mapping.down = -1;
				if (global.controls.player2.mapping.left == input) global.controls.player2.mapping.left = -1;
				if (global.controls.player2.mapping.right == input) global.controls.player2.mapping.right = -1;
				if (global.controls.player2.mapping.attack == input) global.controls.player2.mapping.attack = -1;
				if (global.controls.player2.mapping.interact == input) global.controls.player2.mapping.interact = -1;
				if (global.controls.player2.mapping.jump == input) global.controls.player2.mapping.jump = -1;
				if (global.controls.player2.mapping.up == input) global.controls.player2.mapping.up = -1;
				if (global.controls.player2.mapping.pause == input) global.controls.player2.mapping.pause = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			}
		}
	} else if (global.controls.player2.mapping.obtaining == "waiting for button release") {	
		if (get_any_input(2) == pointer_null) {
			if (global.controls.inputBlocked) global.controls.inputBlocked = false;
			global.controls.player2.mapping.obtaining = "";
		}
	}

#endregion

#region get control inputs for mapped controls for player 3

	if (!global.controls.inputBlocked) {
		global.controls.player3.up.isHeld = get_held(3, global.controls.player3.mapping.up);
		global.controls.player3.down.isHeld = get_held(3, global.controls.player3.mapping.down);
		global.controls.player3.left.isHeld = get_held(3, global.controls.player3.mapping.left);
		global.controls.player3.right.isHeld = get_held(3, global.controls.player3.mapping.right);
		global.controls.player3.attack.isHeld = get_held(3, global.controls.player3.mapping.attack);
		global.controls.player3.interact.isHeld = get_held(3, global.controls.player3.mapping.interact);
		global.controls.player3.special.isHeld = get_held(3, global.controls.player3.mapping.special);
		global.controls.player3.jump.isHeld = get_held(3, global.controls.player3.mapping.jump);
		global.controls.player3.pause.isHeld = get_held(3, global.controls.player3.mapping.pause);

		global.controls.player3.up.wasPressed = get_pressed(3, global.controls.player3.mapping.up);
		global.controls.player3.down.wasPressed = get_pressed(3, global.controls.player3.mapping.down);
		global.controls.player3.left.wasPressed = get_pressed(3, global.controls.player3.mapping.left);
		global.controls.player3.right.wasPressed = get_pressed(3, global.controls.player3.mapping.right);
		global.controls.player3.attack.wasPressed = get_pressed(3, global.controls.player3.mapping.attack);
		global.controls.player3.interact.wasPressed = get_pressed(3, global.controls.player3.mapping.interact);
		global.controls.player3.special.wasPressed = get_pressed(3, global.controls.player3.mapping.special);
		global.controls.player3.jump.wasPressed = get_pressed(3, global.controls.player3.mapping.jump);
		global.controls.player3.pause.wasPressed = get_pressed(3, global.controls.player3.mapping.pause);

		global.controls.player3.up.wasReleased = get_released(3, global.controls.player3.mapping.up);
		global.controls.player3.down.wasReleased = get_released(3, global.controls.player3.mapping.down);
		global.controls.player3.left.wasReleased = get_released(3, global.controls.player3.mapping.left);
		global.controls.player3.right.wasReleased = get_released(3, global.controls.player3.mapping.right);
		global.controls.player3.attack.wasReleased = get_released(3, global.controls.player3.mapping.attack);
		global.controls.player3.interact.wasReleased = get_released(3, global.controls.player3.mapping.interact);
		global.controls.player3.special.wasReleased = get_released(3, global.controls.player3.mapping.special);
		global.controls.player3.jump.wasReleased = get_released(3, global.controls.player3.mapping.jump);
		global.controls.player3.pause.wasReleased = get_released(3, global.controls.player3.mapping.pause);
	} else {
		global.controls.player3.up.isHeld = false;
		global.controls.player3.down.isHeld = false;
		global.controls.player3.left.isHeld = false;
		global.controls.player3.right.isHeld = false;
		global.controls.player3.attack.isHeld = false;
		global.controls.player3.interact.isHeld = false;
		global.controls.player3.special.isHeld = false;
		global.controls.player3.jump.isHeld = false;
		global.controls.player3.pause.isHeld = false;

		global.controls.player3.up.wasPressed = false;
		global.controls.player3.down.wasPressed = false;
		global.controls.player3.left.wasPressed = false;
		global.controls.player3.right.wasPressed = false;
		global.controls.player3.attack.wasPressed = false;
		global.controls.player3.interact.wasPressed = false;
		global.controls.player3.special.wasPressed = false;
		global.controls.player3.jump.wasPressed = false;
		global.controls.player3.pause.wasPressed = false;

		global.controls.player3.up.wasReleased = false;
		global.controls.player3.down.wasReleased = false;
		global.controls.player3.left.wasReleased = false;
		global.controls.player3.right.wasReleased = false;
		global.controls.player3.attack.wasReleased = false;
		global.controls.player3.interact.wasReleased = false;
		global.controls.player3.special.wasReleased = false;
		global.controls.player3.jump.wasReleased = false;
		global.controls.player3.pause.wasReleased = false;
	}

#endregion

#region get control for purpose of mapping somewhere to player 3

	if (global.controls.player3.mapping.obtaining != "" && global.controls.player3.mapping.obtaining != "waiting for button release") {
		var input = get_any_input(3);
		if (input != pointer_null) {
			if (global.controls.player3.mapping.obtaining = "up") {
				global.controls.player3.mapping.up = input;
				if (global.controls.player3.mapping.down == input) global.controls.player3.mapping.down = -1;
				if (global.controls.player3.mapping.left == input) global.controls.player3.mapping.left = -1;
				if (global.controls.player3.mapping.right == input) global.controls.player3.mapping.right = -1;
				if (global.controls.player3.mapping.attack == input) global.controls.player3.mapping.attack = -1;
				if (global.controls.player3.mapping.interact == input) global.controls.player3.mapping.interact = -1;
				if (global.controls.player3.mapping.jump == input) global.controls.player3.mapping.jump = -1;
				if (global.controls.player3.mapping.pause == input) global.controls.player3.mapping.pause = -1;
				if (global.controls.player3.mapping.special == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player3.mapping.obtaining = "down") {
				global.controls.player3.mapping.down = input;
				if (global.controls.player3.mapping.up == input) global.controls.player3.mapping.up = -1;
				if (global.controls.player3.mapping.left == input) global.controls.player3.mapping.left = -1;
				if (global.controls.player3.mapping.right == input) global.controls.player3.mapping.right = -1;
				if (global.controls.player3.mapping.attack == input) global.controls.player3.mapping.attack = -1;
				if (global.controls.player3.mapping.interact == input) global.controls.player3.mapping.interact = -1;
				if (global.controls.player3.mapping.jump == input) global.controls.player3.mapping.jump = -1;
				if (global.controls.player3.mapping.pause == input) global.controls.player3.mapping.pause = -1;
				if (global.controls.player3.mapping.special == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player3.mapping.obtaining = "left") {
				global.controls.player3.mapping.left = input;
				if (global.controls.player3.mapping.down == input) global.controls.player3.mapping.down = -1;
				if (global.controls.player3.mapping.up == input) global.controls.player3.mapping.up = -1;
				if (global.controls.player3.mapping.right == input) global.controls.player3.mapping.right = -1;
				if (global.controls.player3.mapping.attack == input) global.controls.player3.mapping.attack = -1;
				if (global.controls.player3.mapping.interact == input) global.controls.player3.mapping.interact = -1;
				if (global.controls.player3.mapping.jump == input) global.controls.player3.mapping.jump = -1;
				if (global.controls.player3.mapping.pause == input) global.controls.player3.mapping.pause = -1;
				if (global.controls.player3.mapping.special == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player3.mapping.obtaining = "right") {
				global.controls.player3.mapping.right = input;
				if (global.controls.player3.mapping.down == input) global.controls.player3.mapping.down = -1;
				if (global.controls.player3.mapping.left == input) global.controls.player3.mapping.left = -1;
				if (global.controls.player3.mapping.up == input) global.controls.player3.mapping.up = -1;
				if (global.controls.player3.mapping.attack == input) global.controls.player3.mapping.attack = -1;
				if (global.controls.player3.mapping.interact == input) global.controls.player3.mapping.interact = -1;
				if (global.controls.player3.mapping.jump == input) global.controls.player3.mapping.jump = -1;
				if (global.controls.player3.mapping.pause == input) global.controls.player3.mapping.pause = -1;
				if (global.controls.player3.mapping.special == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player3.mapping.obtaining = "attack") {
				global.controls.player3.mapping.attack = input;
				if (global.controls.player3.mapping.down == input) global.controls.player3.mapping.down = -1;
				if (global.controls.player3.mapping.left == input) global.controls.player3.mapping.left = -1;
				if (global.controls.player3.mapping.right == input) global.controls.player3.mapping.right = -1;
				if (global.controls.player3.mapping.up == input) global.controls.player3.mapping.up = -1;
				if (global.controls.player3.mapping.interact == input) global.controls.player3.mapping.interact = -1;
				if (global.controls.player3.mapping.jump == input) global.controls.player3.mapping.jump = -1;
				if (global.controls.player3.mapping.pause == input) global.controls.player3.mapping.pause = -1;
				if (global.controls.player3.mapping.special == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player3.mapping.obtaining = "interact") {
				global.controls.player3.mapping.interact = input;
				if (global.controls.player3.mapping.down == input) global.controls.player3.mapping.down = -1;
				if (global.controls.player3.mapping.left == input) global.controls.player3.mapping.left = -1;
				if (global.controls.player3.mapping.right == input) global.controls.player3.mapping.right = -1;
				if (global.controls.player3.mapping.attack == input) global.controls.player3.mapping.attack = -1;
				if (global.controls.player3.mapping.jump == input) global.controls.player3.mapping.jump = -1;
				if (global.controls.player3.mapping.up == input) global.controls.player3.mapping.up = -1;
				if (global.controls.player3.mapping.pause == input) global.controls.player3.mapping.pause = -1;
				if (global.controls.player3.mapping.special == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player3.mapping.obtaining = "jump") {
				global.controls.player3.mapping.jump = input;
				if (global.controls.player3.mapping.down == input) global.controls.player3.mapping.down = -1;
				if (global.controls.player3.mapping.left == input) global.controls.player3.mapping.left = -1;
				if (global.controls.player3.mapping.right == input) global.controls.player3.mapping.right = -1;
				if (global.controls.player3.mapping.attack == input) global.controls.player3.mapping.attack = -1;
				if (global.controls.player3.mapping.interact == input) global.controls.player3.mapping.interact = -1;
				if (global.controls.player3.mapping.up == input) global.controls.player3.mapping.up = -1;
				if (global.controls.player3.mapping.pause == input) global.controls.player3.mapping.pause = -1;
				if (global.controls.player3.mapping.special == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player3.mapping.obtaining = "pause") {
				global.controls.player3.mapping.pause = input;
				if (global.controls.player3.mapping.down == input) global.controls.player3.mapping.down = -1;
				if (global.controls.player3.mapping.left == input) global.controls.player3.mapping.left = -1;
				if (global.controls.player3.mapping.right == input) global.controls.player3.mapping.right = -1;
				if (global.controls.player3.mapping.attack == input) global.controls.player3.mapping.attack = -1;
				if (global.controls.player3.mapping.interact == input) global.controls.player3.mapping.interact = -1;
				if (global.controls.player3.mapping.jump == input) global.controls.player3.mapping.jump = -1;
				if (global.controls.player3.mapping.up == input) global.controls.player3.mapping.up = -1;
				if (global.controls.player3.mapping.special == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player3.mapping.obtaining = "special") {
				global.controls.player3.mapping.special = input;
				if (global.controls.player3.mapping.down == input) global.controls.player3.mapping.down = -1;
				if (global.controls.player3.mapping.left == input) global.controls.player3.mapping.left = -1;
				if (global.controls.player3.mapping.right == input) global.controls.player3.mapping.right = -1;
				if (global.controls.player3.mapping.attack == input) global.controls.player3.mapping.attack = -1;
				if (global.controls.player3.mapping.interact == input) global.controls.player3.mapping.interact = -1;
				if (global.controls.player3.mapping.jump == input) global.controls.player3.mapping.jump = -1;
				if (global.controls.player3.mapping.up == input) global.controls.player3.mapping.up = -1;
				if (global.controls.player3.mapping.pause == input) global.controls.player3.mapping.pause = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			}
		}
	} else if (global.controls.player3.mapping.obtaining == "waiting for button release") {	
		if (get_any_input(3) == pointer_null) {
			if (global.controls.inputBlocked) global.controls.inputBlocked = false;
			global.controls.player3.mapping.obtaining = "";
		}
	}

#endregion

#region get control inputs for mapped controls for player 4

	if (!global.controls.inputBlocked) {
		global.controls.player4.up.isHeld = get_held(4, global.controls.player4.mapping.up);
		global.controls.player4.down.isHeld = get_held(4, global.controls.player4.mapping.down);
		global.controls.player4.left.isHeld = get_held(4, global.controls.player4.mapping.left);
		global.controls.player4.right.isHeld = get_held(4, global.controls.player4.mapping.right);
		global.controls.player4.attack.isHeld = get_held(4, global.controls.player4.mapping.attack);
		global.controls.player4.interact.isHeld = get_held(4, global.controls.player4.mapping.interact);
		global.controls.player4.special.isHeld = get_held(4, global.controls.player4.mapping.special);
		global.controls.player4.jump.isHeld = get_held(4, global.controls.player4.mapping.jump);
		global.controls.player4.pause.isHeld = get_held(4, global.controls.player4.mapping.pause);

		global.controls.player4.up.wasPressed = get_pressed(4, global.controls.player4.mapping.up);
		global.controls.player4.down.wasPressed = get_pressed(4, global.controls.player4.mapping.down);
		global.controls.player4.left.wasPressed = get_pressed(4, global.controls.player4.mapping.left);
		global.controls.player4.right.wasPressed = get_pressed(4, global.controls.player4.mapping.right);
		global.controls.player4.attack.wasPressed = get_pressed(4, global.controls.player4.mapping.attack);
		global.controls.player4.interact.wasPressed = get_pressed(4, global.controls.player4.mapping.interact);
		global.controls.player4.special.wasPressed = get_pressed(4, global.controls.player4.mapping.special);
		global.controls.player4.jump.wasPressed = get_pressed(4, global.controls.player4.mapping.jump);
		global.controls.player4.pause.wasPressed = get_pressed(4, global.controls.player4.mapping.pause);

		global.controls.player4.up.wasReleased = get_released(4, global.controls.player4.mapping.up);
		global.controls.player4.down.wasReleased = get_released(4, global.controls.player4.mapping.down);
		global.controls.player4.left.wasReleased = get_released(4, global.controls.player4.mapping.left);
		global.controls.player4.right.wasReleased = get_released(4, global.controls.player4.mapping.right);
		global.controls.player4.attack.wasReleased = get_released(4, global.controls.player4.mapping.attack);
		global.controls.player4.interact.wasReleased = get_released(4, global.controls.player4.mapping.interact);
		global.controls.player4.special.wasReleased = get_released(4, global.controls.player4.mapping.special);
		global.controls.player4.jump.wasReleased = get_released(4, global.controls.player4.mapping.jump);
		global.controls.player4.pause.wasReleased = get_released(4, global.controls.player4.mapping.pause);
	} else {
		global.controls.player4.up.isHeld = false;
		global.controls.player4.down.isHeld = false;
		global.controls.player4.left.isHeld = false;
		global.controls.player4.right.isHeld = false;
		global.controls.player4.attack.isHeld = false;
		global.controls.player4.interact.isHeld = false;
		global.controls.player4.special.isHeld = false;
		global.controls.player4.jump.isHeld = false;
		global.controls.player4.pause.isHeld = false;

		global.controls.player4.up.wasPressed = false;
		global.controls.player4.down.wasPressed = false;
		global.controls.player4.left.wasPressed = false;
		global.controls.player4.right.wasPressed = false;
		global.controls.player4.attack.wasPressed = false;
		global.controls.player4.interact.wasPressed = false;
		global.controls.player4.special.wasPressed = false;
		global.controls.player4.jump.wasPressed = false;
		global.controls.player4.pause.wasPressed = false;

		global.controls.player4.up.wasReleased = false;
		global.controls.player4.down.wasReleased = false;
		global.controls.player4.left.wasReleased = false;
		global.controls.player4.right.wasReleased = false;
		global.controls.player4.attack.wasReleased = false;
		global.controls.player4.interact.wasReleased = false;
		global.controls.player4.special.wasReleased = false;
		global.controls.player4.jump.wasReleased = false;
		global.controls.player4.pause.wasReleased = false;
	}

#endregion

#region get control for purpose of mapping somewhere to player 4

	if (global.controls.player4.mapping.obtaining != "" && global.controls.player4.mapping.obtaining != "waiting for button release") {
		var input = get_any_input(4);
		if (input != pointer_null) {
			if (global.controls.player4.mapping.obtaining = "up") {
				global.controls.player4.mapping.up = input;
				if (global.controls.player4.mapping.down == input) global.controls.player4.mapping.down = -1;
				if (global.controls.player4.mapping.left == input) global.controls.player4.mapping.left = -1;
				if (global.controls.player4.mapping.right == input) global.controls.player4.mapping.right = -1;
				if (global.controls.player4.mapping.attack == input) global.controls.player4.mapping.attack = -1;
				if (global.controls.player4.mapping.interact == input) global.controls.player4.mapping.interact = -1;
				if (global.controls.player4.mapping.jump == input) global.controls.player4.mapping.jump = -1;
				if (global.controls.player4.mapping.pause == input) global.controls.player4.mapping.pause = -1;
				if (global.controls.player4.mapping.special == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player4.mapping.obtaining = "down") {
				global.controls.player4.mapping.down = input;
				if (global.controls.player4.mapping.up == input) global.controls.player4.mapping.up = -1;
				if (global.controls.player4.mapping.left == input) global.controls.player4.mapping.left = -1;
				if (global.controls.player4.mapping.right == input) global.controls.player4.mapping.right = -1;
				if (global.controls.player4.mapping.attack == input) global.controls.player4.mapping.attack = -1;
				if (global.controls.player4.mapping.interact == input) global.controls.player4.mapping.interact = -1;
				if (global.controls.player4.mapping.jump == input) global.controls.player4.mapping.jump = -1;
				if (global.controls.player4.mapping.pause == input) global.controls.player4.mapping.pause = -1;
				if (global.controls.player4.mapping.special == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player4.mapping.obtaining = "left") {
				global.controls.player4.mapping.left = input;
				if (global.controls.player4.mapping.down == input) global.controls.player4.mapping.down = -1;
				if (global.controls.player4.mapping.up == input) global.controls.player4.mapping.up = -1;
				if (global.controls.player4.mapping.right == input) global.controls.player4.mapping.right = -1;
				if (global.controls.player4.mapping.attack == input) global.controls.player4.mapping.attack = -1;
				if (global.controls.player4.mapping.interact == input) global.controls.player4.mapping.interact = -1;
				if (global.controls.player4.mapping.jump == input) global.controls.player4.mapping.jump = -1;
				if (global.controls.player4.mapping.pause == input) global.controls.player4.mapping.pause = -1;
				if (global.controls.player4.mapping.special == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player4.mapping.obtaining = "right") {
				global.controls.player4.mapping.right = input;
				if (global.controls.player4.mapping.down == input) global.controls.player4.mapping.down = -1;
				if (global.controls.player4.mapping.left == input) global.controls.player4.mapping.left = -1;
				if (global.controls.player4.mapping.up == input) global.controls.player4.mapping.up = -1;
				if (global.controls.player4.mapping.attack == input) global.controls.player4.mapping.attack = -1;
				if (global.controls.player4.mapping.interact == input) global.controls.player4.mapping.interact = -1;
				if (global.controls.player4.mapping.jump == input) global.controls.player4.mapping.jump = -1;
				if (global.controls.player4.mapping.pause == input) global.controls.player4.mapping.pause = -1;
				if (global.controls.player4.mapping.special == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player4.mapping.obtaining = "attack") {
				global.controls.player4.mapping.attack = input;
				if (global.controls.player4.mapping.down == input) global.controls.player4.mapping.down = -1;
				if (global.controls.player4.mapping.left == input) global.controls.player4.mapping.left = -1;
				if (global.controls.player4.mapping.right == input) global.controls.player4.mapping.right = -1;
				if (global.controls.player4.mapping.up == input) global.controls.player4.mapping.up = -1;
				if (global.controls.player4.mapping.interact == input) global.controls.player4.mapping.interact = -1;
				if (global.controls.player4.mapping.jump == input) global.controls.player4.mapping.jump = -1;
				if (global.controls.player4.mapping.pause == input) global.controls.player4.mapping.pause = -1;
				if (global.controls.player4.mapping.special == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player4.mapping.obtaining = "interact") {
				global.controls.player4.mapping.interact = input;
				if (global.controls.player4.mapping.down == input) global.controls.player4.mapping.down = -1;
				if (global.controls.player4.mapping.left == input) global.controls.player4.mapping.left = -1;
				if (global.controls.player4.mapping.right == input) global.controls.player4.mapping.right = -1;
				if (global.controls.player4.mapping.attack == input) global.controls.player4.mapping.attack = -1;
				if (global.controls.player4.mapping.jump == input) global.controls.player4.mapping.jump = -1;
				if (global.controls.player4.mapping.up == input) global.controls.player4.mapping.up = -1;
				if (global.controls.player4.mapping.pause == input) global.controls.player4.mapping.pause = -1;
				if (global.controls.player4.mapping.special == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player4.mapping.obtaining = "jump") {
				global.controls.player4.mapping.jump = input;
				if (global.controls.player4.mapping.down == input) global.controls.player4.mapping.down = -1;
				if (global.controls.player4.mapping.left == input) global.controls.player4.mapping.left = -1;
				if (global.controls.player4.mapping.right == input) global.controls.player4.mapping.right = -1;
				if (global.controls.player4.mapping.attack == input) global.controls.player4.mapping.attack = -1;
				if (global.controls.player4.mapping.interact == input) global.controls.player4.mapping.interact = -1;
				if (global.controls.player4.mapping.up == input) global.controls.player4.mapping.up = -1;
				if (global.controls.player4.mapping.pause == input) global.controls.player4.mapping.pause = -1;
				if (global.controls.player4.mapping.special == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player4.mapping.obtaining = "pause") {
				global.controls.player4.mapping.pause = input;
				if (global.controls.player4.mapping.down == input) global.controls.player4.mapping.down = -1;
				if (global.controls.player4.mapping.left == input) global.controls.player4.mapping.left = -1;
				if (global.controls.player4.mapping.right == input) global.controls.player4.mapping.right = -1;
				if (global.controls.player4.mapping.attack == input) global.controls.player4.mapping.attack = -1;
				if (global.controls.player4.mapping.interact == input) global.controls.player4.mapping.interact = -1;
				if (global.controls.player4.mapping.jump == input) global.controls.player4.mapping.jump = -1;
				if (global.controls.player4.mapping.up == input) global.controls.player4.mapping.up = -1;
				if (global.controls.player4.mapping.special == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (global.controls.player4.mapping.obtaining = "special") {
				global.controls.player4.mapping.special = input;
				if (global.controls.player4.mapping.down == input) global.controls.player4.mapping.down = -1;
				if (global.controls.player4.mapping.left == input) global.controls.player4.mapping.left = -1;
				if (global.controls.player4.mapping.right == input) global.controls.player4.mapping.right = -1;
				if (global.controls.player4.mapping.attack == input) global.controls.player4.mapping.attack = -1;
				if (global.controls.player4.mapping.interact == input) global.controls.player4.mapping.interact = -1;
				if (global.controls.player4.mapping.jump == input) global.controls.player4.mapping.jump = -1;
				if (global.controls.player4.mapping.up == input) global.controls.player4.mapping.up = -1;
				if (global.controls.player4.mapping.pause == input) global.controls.player4.mapping.pause = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			}
		}
	} else if (global.controls.player4.mapping.obtaining == "waiting for button release") {	
		if (get_any_input(4) == pointer_null) {
			if (global.controls.inputBlocked) global.controls.inputBlocked = false;
			global.controls.player4.mapping.obtaining = "";
		}
	}

#endregion