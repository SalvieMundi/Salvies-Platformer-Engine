/// @description get controls statuses

#region get local variables

	var inputBlocked = global.controls.inputBlocked;
	var mappingUp1 = global.controls.player1.mapping.up;
	var mappingDown1 = global.controls.player1.mapping.down;
	var mappingLeft1 = global.controls.player1.mapping.left;
	var mappingRight1 = global.controls.player1.mapping.right;
	var mappingAttack1 = global.controls.player1.mapping.attack;
	var mappingInteract1 = global.controls.player1.mapping.interact;
	var mappingSpecial1 = global.controls.player1.mapping.special;
	var mappingJump1 = global.controls.player1.mapping.jump;
	var mappingPause1 = global.controls.player1.mapping.pause;
	var mappingUp2 = global.controls.player2.mapping.up;
	var mappingDown2 = global.controls.player2.mapping.down;
	var mappingLeft2 = global.controls.player2.mapping.left;
	var mappingRight2 = global.controls.player2.mapping.right;
	var mappingAttack2 = global.controls.player2.mapping.attack;
	var mappingInteract2 = global.controls.player2.mapping.interact;
	var mappingSpecial2 = global.controls.player2.mapping.special;
	var mappingJump2 = global.controls.player2.mapping.jump;
	var mappingPause2 = global.controls.player2.mapping.pause;
	var mappingUp3 = global.controls.player3.mapping.up;
	var mappingDown3 = global.controls.player3.mapping.down;
	var mappingLeft3 = global.controls.player3.mapping.left;
	var mappingRight3 = global.controls.player3.mapping.right;
	var mappingAttack3 = global.controls.player3.mapping.attack;
	var mappingInteract3 = global.controls.player3.mapping.interact;
	var mappingSpecial3 = global.controls.player3.mapping.special;
	var mappingJump3 = global.controls.player3.mapping.jump;
	var mappingPause3 = global.controls.player3.mapping.pause;
	var mappingUp4 = global.controls.player4.mapping.up;
	var mappingDown4 = global.controls.player4.mapping.down;
	var mappingLeft4 = global.controls.player4.mapping.left;
	var mappingRight4 = global.controls.player4.mapping.right;
	var mappingAttack4 = global.controls.player4.mapping.attack;
	var mappingInteract4 = global.controls.player4.mapping.interact;
	var mappingSpecial4 = global.controls.player4.mapping.special;
	var mappingJump4 = global.controls.player4.mapping.jump;
	var mappingPause4 = global.controls.player4.mapping.pause;

#endregion

#region get control inputs for mapped controls for player 1

	if (!inputBlocked) {
		global.controls.player1.up.isHeld = get_held(1, mappingUp1);
		global.controls.player1.down.isHeld = get_held(1, mappingDown1);
		global.controls.player1.left.isHeld = get_held(1, mappingLeft1);
		global.controls.player1.right.isHeld = get_held(1, mappingRight1);
		global.controls.player1.attack.isHeld = get_held(1, mappingAttack1);
		global.controls.player1.interact.isHeld = get_held(1, mappingInteract1);
		global.controls.player1.special.isHeld = get_held(1, mappingSpecial1);
		global.controls.player1.jump.isHeld = get_held(1, mappingJump1);
		global.controls.player1.pause.isHeld = get_held(1, mappingPause1);

		global.controls.player1.up.wasPressed = get_pressed(1, mappingUp1);
		global.controls.player1.down.wasPressed = get_pressed(1, mappingDown1);
		global.controls.player1.left.wasPressed = get_pressed(1, mappingLeft1);
		global.controls.player1.right.wasPressed = get_pressed(1, mappingRight1);
		global.controls.player1.attack.wasPressed = get_pressed(1, mappingAttack1);
		global.controls.player1.interact.wasPressed = get_pressed(1, mappingInteract1);
		global.controls.player1.special.wasPressed = get_pressed(1, mappingSpecial1);
		global.controls.player1.jump.wasPressed = get_pressed(1, mappingJump1);
		global.controls.player1.pause.wasPressed = get_pressed(1, mappingPause1);

		global.controls.player1.up.wasReleased = get_released(1, mappingUp1);
		global.controls.player1.down.wasReleased = get_released(1, mappingDown1);
		global.controls.player1.left.wasReleased = get_released(1, mappingLeft1);
		global.controls.player1.right.wasReleased = get_released(1, mappingRight1);
		global.controls.player1.attack.wasReleased = get_released(1, mappingAttack1);
		global.controls.player1.interact.wasReleased = get_released(1, mappingInteract1);
		global.controls.player1.special.wasReleased = get_released(1, mappingSpecial1);
		global.controls.player1.jump.wasReleased = get_released(1, mappingJump1);
		global.controls.player1.pause.wasReleased = get_released(1, mappingPause1);
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
	
	var obtaining = global.controls.player1.mapping.obtaining;

	if (obtaining != "" && obtaining != "waiting for button release") {
		var input = get_any_input(1);
		if (input != pointer_null) {
			if (obtaining == "up") {
				global.controls.player1.mapping.up = input;
				if (mappingDown1 == input) global.controls.player1.mapping.down = -1;
				if (mappingLeft1 == input) global.controls.player1.mapping.left = -1;
				if (mappingRight1 == input) global.controls.player1.mapping.right = -1;
				if (mappingAttack1 == input) global.controls.player1.mapping.attack = -1;
				if (mappingInteract1 == input) global.controls.player1.mapping.interact = -1;
				if (mappingJump1 == input) global.controls.player1.mapping.jump = -1;
				if (mappingPause1 == input) global.controls.player1.mapping.pause = -1;
				if (mappingSpecial1 == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "down") {
				global.controls.player1.mapping.down = input;
				if (mappingUp1 == input) global.controls.player1.mapping.up = -1;
				if (mappingLeft1 == input) global.controls.player1.mapping.left = -1;
				if (mappingRight1 == input) global.controls.player1.mapping.right = -1;
				if (mappingAttack1 == input) global.controls.player1.mapping.attack = -1;
				if (mappingInteract1 == input) global.controls.player1.mapping.interact = -1;
				if (mappingJump1 == input) global.controls.player1.mapping.jump = -1;
				if (mappingPause1 == input) global.controls.player1.mapping.pause = -1;
				if (mappingSpecial1 == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "left") {
				global.controls.player1.mapping.left = input;
				if (mappingDown1 == input) global.controls.player1.mapping.down = -1;
				if (mappingUp1 == input) global.controls.player1.mapping.up = -1;
				if (mappingRight1 == input) global.controls.player1.mapping.right = -1;
				if (mappingAttack1 == input) global.controls.player1.mapping.attack = -1;
				if (mappingInteract1 == input) global.controls.player1.mapping.interact = -1;
				if (mappingJump1 == input) global.controls.player1.mapping.jump = -1;
				if (mappingPause1 == input) global.controls.player1.mapping.pause = -1;
				if (mappingSpecial1 == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "right") {
				global.controls.player1.mapping.right = input;
				if (mappingDown1 == input) global.controls.player1.mapping.down = -1;
				if (mappingLeft1 == input) global.controls.player1.mapping.left = -1;
				if (mappingUp1 == input) global.controls.player1.mapping.up = -1;
				if (mappingAttack1 == input) global.controls.player1.mapping.attack = -1;
				if (mappingInteract1 == input) global.controls.player1.mapping.interact = -1;
				if (mappingJump1 == input) global.controls.player1.mapping.jump = -1;
				if (mappingPause1 == input) global.controls.player1.mapping.pause = -1;
				if (mappingSpecial1 == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "attack") {
				global.controls.player1.mapping.attack = input;
				if (mappingDown1 == input) global.controls.player1.mapping.down = -1;
				if (mappingLeft1 == input) global.controls.player1.mapping.left = -1;
				if (mappingRight1 == input) global.controls.player1.mapping.right = -1;
				if (mappingUp1 == input) global.controls.player1.mapping.up = -1;
				if (mappingInteract1 == input) global.controls.player1.mapping.interact = -1;
				if (mappingJump1 == input) global.controls.player1.mapping.jump = -1;
				if (mappingPause1 == input) global.controls.player1.mapping.pause = -1;
				if (mappingSpecial1 == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "interact") {
				global.controls.player1.mapping.interact = input;
				if (mappingDown1 == input) global.controls.player1.mapping.down = -1;
				if (mappingLeft1 == input) global.controls.player1.mapping.left = -1;
				if (mappingRight1 == input) global.controls.player1.mapping.right = -1;
				if (mappingAttack1 == input) global.controls.player1.mapping.attack = -1;
				if (mappingJump1 == input) global.controls.player1.mapping.jump = -1;
				if (mappingUp1 == input) global.controls.player1.mapping.up = -1;
				if (mappingPause1 == input) global.controls.player1.mapping.pause = -1;
				if (mappingSpecial1 == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "jump") {
				global.controls.player1.mapping.jump = input;
				if (mappingDown1 == input) global.controls.player1.mapping.down = -1;
				if (mappingLeft1 == input) global.controls.player1.mapping.left = -1;
				if (mappingRight1 == input) global.controls.player1.mapping.right = -1;
				if (mappingAttack1 == input) global.controls.player1.mapping.attack = -1;
				if (mappingInteract1 == input) global.controls.player1.mapping.interact = -1;
				if (mappingUp1 == input) global.controls.player1.mapping.up = -1;
				if (mappingPause1 == input) global.controls.player1.mapping.pause = -1;
				if (mappingSpecial1 == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "pause") {
				global.controls.player1.mapping.pause = input;
				if (mappingDown1 == input) global.controls.player1.mapping.down = -1;
				if (mappingLeft1 == input) global.controls.player1.mapping.left = -1;
				if (mappingRight1 == input) global.controls.player1.mapping.right = -1;
				if (mappingAttack1 == input) global.controls.player1.mapping.attack = -1;
				if (mappingInteract1 == input) global.controls.player1.mapping.interact = -1;
				if (mappingJump1 == input) global.controls.player1.mapping.jump = -1;
				if (mappingUp1 == input) global.controls.player1.mapping.up = -1;
				if (mappingSpecial1 == input) global.controls.player1.mapping.special = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "special") {
				global.controls.player1.mapping.special = input;
				if (mappingDown1 == input) global.controls.player1.mapping.down = -1;
				if (mappingLeft1 == input) global.controls.player1.mapping.left = -1;
				if (mappingRight1 == input) global.controls.player1.mapping.right = -1;
				if (mappingAttack1 == input) global.controls.player1.mapping.attack = -1;
				if (mappingInteract1 == input) global.controls.player1.mapping.interact = -1;
				if (mappingJump1 == input) global.controls.player1.mapping.jump = -1;
				if (mappingUp1 == input) global.controls.player1.mapping.up = -1;
				if (mappingPause1 == input) global.controls.player1.mapping.pause = -1;
				global.controls.player1.mapping.obtaining = "waiting for button release";
			}
		}
	} else if (obtaining == "waiting for button release") {	
		if (input == pointer_null) {
			if (inputBlocked) global.controls.inputBlocked = false;
			global.controls.player1.mapping.obtaining = "";
		}
	}

#endregion

#region get control inputs for mapped controls for player 2

	if (!inputBlocked) {
		global.controls.player2.up.isHeld = get_held(2, mappingUp2);
		global.controls.player2.down.isHeld = get_held(2, mappingDown2);
		global.controls.player2.left.isHeld = get_held(2, mappingLeft2);
		global.controls.player2.right.isHeld = get_held(2, mappingRight2);
		global.controls.player2.attack.isHeld = get_held(2, mappingAttack2);
		global.controls.player2.interact.isHeld = get_held(2, mappingInteract2);
		global.controls.player2.special.isHeld = get_held(2, mappingSpecial2);
		global.controls.player2.jump.isHeld = get_held(2, mappingJump2);
		global.controls.player2.pause.isHeld = get_held(2, mappingPause2);

		global.controls.player2.up.wasPressed = get_pressed(2, mappingUp2);
		global.controls.player2.down.wasPressed = get_pressed(2, mappingDown2);
		global.controls.player2.left.wasPressed = get_pressed(2, mappingLeft2);
		global.controls.player2.right.wasPressed = get_pressed(2, mappingRight2);
		global.controls.player2.attack.wasPressed = get_pressed(2, mappingAttack2);
		global.controls.player2.interact.wasPressed = get_pressed(2, mappingInteract2);
		global.controls.player2.special.wasPressed = get_pressed(2, mappingSpecial2);
		global.controls.player2.jump.wasPressed = get_pressed(2, mappingJump2);
		global.controls.player2.pause.wasPressed = get_pressed(2, mappingPause2);

		global.controls.player2.up.wasReleased = get_released(2, mappingUp2);
		global.controls.player2.down.wasReleased = get_released(2, mappingDown2);
		global.controls.player2.left.wasReleased = get_released(2, mappingLeft2);
		global.controls.player2.right.wasReleased = get_released(2, mappingRight2);
		global.controls.player2.attack.wasReleased = get_released(2, mappingAttack2);
		global.controls.player2.interact.wasReleased = get_released(2, mappingInteract2);
		global.controls.player2.special.wasReleased = get_released(2, mappingSpecial2);
		global.controls.player2.jump.wasReleased = get_released(2, mappingJump2);
		global.controls.player2.pause.wasReleased = get_released(2, mappingPause2);
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
	
	obtaining = global.controls.player2.mapping.obtaining;

	if (obtaining != "" && obtaining != "waiting for button release") {
		var input = get_any_input(2);
		if (input != pointer_null) {
			if (obtaining == "up") {
				global.controls.player2.mapping.up = input;
				if (mappingDown2 == input) global.controls.player2.mapping.down = -1;
				if (mappingLeft2 == input) global.controls.player2.mapping.left = -1;
				if (mappingRight2 == input) global.controls.player2.mapping.right = -1;
				if (mappingAttack2 == input) global.controls.player2.mapping.attack = -1;
				if (mappingInteract2 == input) global.controls.player2.mapping.interact = -1;
				if (mappingJump2 == input) global.controls.player2.mapping.jump = -1;
				if (mappingPause2 == input) global.controls.player2.mapping.pause = -1;
				if (mappingSpecial2 == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "down") {
				global.controls.player2.mapping.down = input;
				if (mappingUp2 == input) global.controls.player2.mapping.up = -1;
				if (mappingLeft2 == input) global.controls.player2.mapping.left = -1;
				if (mappingRight2 == input) global.controls.player2.mapping.right = -1;
				if (mappingAttack2 == input) global.controls.player2.mapping.attack = -1;
				if (mappingInteract2 == input) global.controls.player2.mapping.interact = -1;
				if (mappingJump2 == input) global.controls.player2.mapping.jump = -1;
				if (mappingPause2 == input) global.controls.player2.mapping.pause = -1;
				if (mappingSpecial2 == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "left") {
				global.controls.player2.mapping.left = input;
				if (mappingDown2 == input) global.controls.player2.mapping.down = -1;
				if (mappingUp2 == input) global.controls.player2.mapping.up = -1;
				if (mappingRight2 == input) global.controls.player2.mapping.right = -1;
				if (mappingAttack2 == input) global.controls.player2.mapping.attack = -1;
				if (mappingInteract2 == input) global.controls.player2.mapping.interact = -1;
				if (mappingJump2 == input) global.controls.player2.mapping.jump = -1;
				if (mappingPause2 == input) global.controls.player2.mapping.pause = -1;
				if (mappingSpecial2 == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "right") {
				global.controls.player2.mapping.right = input;
				if (mappingDown2 == input) global.controls.player2.mapping.down = -1;
				if (mappingLeft2 == input) global.controls.player2.mapping.left = -1;
				if (mappingUp2 == input) global.controls.player2.mapping.up = -1;
				if (mappingAttack2 == input) global.controls.player2.mapping.attack = -1;
				if (mappingInteract2 == input) global.controls.player2.mapping.interact = -1;
				if (mappingJump2 == input) global.controls.player2.mapping.jump = -1;
				if (mappingPause2 == input) global.controls.player2.mapping.pause = -1;
				if (mappingSpecial2 == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "attack") {
				global.controls.player2.mapping.attack = input;
				if (mappingDown2 == input) global.controls.player2.mapping.down = -1;
				if (mappingLeft2 == input) global.controls.player2.mapping.left = -1;
				if (mappingRight2 == input) global.controls.player2.mapping.right = -1;
				if (mappingUp2 == input) global.controls.player2.mapping.up = -1;
				if (mappingInteract2 == input) global.controls.player2.mapping.interact = -1;
				if (mappingJump2 == input) global.controls.player2.mapping.jump = -1;
				if (mappingPause2 == input) global.controls.player2.mapping.pause = -1;
				if (mappingSpecial2 == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "interact") {
				global.controls.player2.mapping.interact = input;
				if (mappingDown2 == input) global.controls.player2.mapping.down = -1;
				if (mappingLeft2 == input) global.controls.player2.mapping.left = -1;
				if (mappingRight2 == input) global.controls.player2.mapping.right = -1;
				if (mappingAttack2 == input) global.controls.player2.mapping.attack = -1;
				if (mappingJump2 == input) global.controls.player2.mapping.jump = -1;
				if (mappingUp2 == input) global.controls.player2.mapping.up = -1;
				if (mappingPause2 == input) global.controls.player2.mapping.pause = -1;
				if (mappingSpecial2 == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "jump") {
				global.controls.player2.mapping.jump = input;
				if (mappingDown2 == input) global.controls.player2.mapping.down = -1;
				if (mappingLeft2 == input) global.controls.player2.mapping.left = -1;
				if (mappingRight2 == input) global.controls.player2.mapping.right = -1;
				if (mappingAttack2 == input) global.controls.player2.mapping.attack = -1;
				if (mappingInteract2 == input) global.controls.player2.mapping.interact = -1;
				if (mappingUp2 == input) global.controls.player2.mapping.up = -1;
				if (mappingPause2 == input) global.controls.player2.mapping.pause = -1;
				if (mappingSpecial2 == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "pause") {
				global.controls.player2.mapping.pause = input;
				if (mappingDown2 == input) global.controls.player2.mapping.down = -1;
				if (mappingLeft2 == input) global.controls.player2.mapping.left = -1;
				if (mappingRight2 == input) global.controls.player2.mapping.right = -1;
				if (mappingAttack2 == input) global.controls.player2.mapping.attack = -1;
				if (mappingInteract2 == input) global.controls.player2.mapping.interact = -1;
				if (mappingJump2 == input) global.controls.player2.mapping.jump = -1;
				if (mappingUp2 == input) global.controls.player2.mapping.up = -1;
				if (mappingSpecial2 == input) global.controls.player2.mapping.special = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "special") {
				global.controls.player2.mapping.special = input;
				if (mappingDown2 == input) global.controls.player2.mapping.down = -1;
				if (mappingLeft2 == input) global.controls.player2.mapping.left = -1;
				if (mappingRight2 == input) global.controls.player2.mapping.right = -1;
				if (mappingAttack2 == input) global.controls.player2.mapping.attack = -1;
				if (mappingInteract2 == input) global.controls.player2.mapping.interact = -1;
				if (mappingJump2 == input) global.controls.player2.mapping.jump = -1;
				if (mappingUp2 == input) global.controls.player2.mapping.up = -1;
				if (mappingPause2 == input) global.controls.player2.mapping.pause = -1;
				global.controls.player2.mapping.obtaining = "waiting for button release";
			}
		}
	} else if (obtaining == "waiting for button release") {	
		if (input == pointer_null) {
			if (inputBlocked) global.controls.inputBlocked = false;
			global.controls.player2.mapping.obtaining = "";
		}
	}

#endregion

#region get control inputs for mapped controls for player 3

	if (!inputBlocked) {
		global.controls.player3.up.isHeld = get_held(3, mappingUp3);
		global.controls.player3.down.isHeld = get_held(3, mappingDown3);
		global.controls.player3.left.isHeld = get_held(3, mappingLeft3);
		global.controls.player3.right.isHeld = get_held(3, mappingRight3);
		global.controls.player3.attack.isHeld = get_held(3, mappingAttack3);
		global.controls.player3.interact.isHeld = get_held(3, mappingInteract3);
		global.controls.player3.special.isHeld = get_held(3, mappingSpecial3);
		global.controls.player3.jump.isHeld = get_held(3, mappingJump3);
		global.controls.player3.pause.isHeld = get_held(3, mappingPause3);

		global.controls.player3.up.wasPressed = get_pressed(3, mappingUp3);
		global.controls.player3.down.wasPressed = get_pressed(3, mappingDown3);
		global.controls.player3.left.wasPressed = get_pressed(3, mappingLeft3);
		global.controls.player3.right.wasPressed = get_pressed(3, mappingRight3);
		global.controls.player3.attack.wasPressed = get_pressed(3, mappingAttack3);
		global.controls.player3.interact.wasPressed = get_pressed(3, mappingInteract3);
		global.controls.player3.special.wasPressed = get_pressed(3, mappingSpecial3);
		global.controls.player3.jump.wasPressed = get_pressed(3, mappingJump3);
		global.controls.player3.pause.wasPressed = get_pressed(3, mappingPause3);

		global.controls.player3.up.wasReleased = get_released(3, mappingUp3);
		global.controls.player3.down.wasReleased = get_released(3, mappingDown3);
		global.controls.player3.left.wasReleased = get_released(3, mappingLeft3);
		global.controls.player3.right.wasReleased = get_released(3, mappingRight3);
		global.controls.player3.attack.wasReleased = get_released(3, mappingAttack3);
		global.controls.player3.interact.wasReleased = get_released(3, mappingInteract3);
		global.controls.player3.special.wasReleased = get_released(3, mappingSpecial3);
		global.controls.player3.jump.wasReleased = get_released(3, mappingJump3);
		global.controls.player3.pause.wasReleased = get_released(3, mappingPause3);
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
	
	obtaining = global.controls.player3.mapping.obtaining;

	if (obtaining != "" && obtaining != "waiting for button release") {
		var input = get_any_input(3);
		if (input != pointer_null) {
			if (obtaining == "up") {
				global.controls.player3.mapping.up = input;
				if (mappingDown3 == input) global.controls.player3.mapping.down = -1;
				if (mappingLeft3 == input) global.controls.player3.mapping.left = -1;
				if (mappingRight3 == input) global.controls.player3.mapping.right = -1;
				if (mappingAttack3 == input) global.controls.player3.mapping.attack = -1;
				if (mappingInteract3 == input) global.controls.player3.mapping.interact = -1;
				if (mappingJump3 == input) global.controls.player3.mapping.jump = -1;
				if (mappingPause3 == input) global.controls.player3.mapping.pause = -1;
				if (mappingSpecial3 == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "down") {
				global.controls.player3.mapping.down = input;
				if (mappingUp3 == input) global.controls.player3.mapping.up = -1;
				if (mappingLeft3 == input) global.controls.player3.mapping.left = -1;
				if (mappingRight3 == input) global.controls.player3.mapping.right = -1;
				if (mappingAttack3 == input) global.controls.player3.mapping.attack = -1;
				if (mappingInteract3 == input) global.controls.player3.mapping.interact = -1;
				if (mappingJump3 == input) global.controls.player3.mapping.jump = -1;
				if (mappingPause3 == input) global.controls.player3.mapping.pause = -1;
				if (mappingSpecial3 == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "left") {
				global.controls.player3.mapping.left = input;
				if (mappingDown3 == input) global.controls.player3.mapping.down = -1;
				if (mappingUp3 == input) global.controls.player3.mapping.up = -1;
				if (mappingRight3 == input) global.controls.player3.mapping.right = -1;
				if (mappingAttack3 == input) global.controls.player3.mapping.attack = -1;
				if (mappingInteract3 == input) global.controls.player3.mapping.interact = -1;
				if (mappingJump3 == input) global.controls.player3.mapping.jump = -1;
				if (mappingPause3 == input) global.controls.player3.mapping.pause = -1;
				if (mappingSpecial3 == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "right") {
				global.controls.player3.mapping.right = input;
				if (mappingDown3 == input) global.controls.player3.mapping.down = -1;
				if (mappingLeft3 == input) global.controls.player3.mapping.left = -1;
				if (mappingUp3 == input) global.controls.player3.mapping.up = -1;
				if (mappingAttack3 == input) global.controls.player3.mapping.attack = -1;
				if (mappingInteract3 == input) global.controls.player3.mapping.interact = -1;
				if (mappingJump3 == input) global.controls.player3.mapping.jump = -1;
				if (mappingPause3 == input) global.controls.player3.mapping.pause = -1;
				if (mappingSpecial3 == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "attack") {
				global.controls.player3.mapping.attack = input;
				if (mappingDown3 == input) global.controls.player3.mapping.down = -1;
				if (mappingLeft3 == input) global.controls.player3.mapping.left = -1;
				if (mappingRight3 == input) global.controls.player3.mapping.right = -1;
				if (mappingUp3 == input) global.controls.player3.mapping.up = -1;
				if (mappingInteract3 == input) global.controls.player3.mapping.interact = -1;
				if (mappingJump3 == input) global.controls.player3.mapping.jump = -1;
				if (mappingPause3 == input) global.controls.player3.mapping.pause = -1;
				if (mappingSpecial3 == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "interact") {
				global.controls.player3.mapping.interact = input;
				if (mappingDown3 == input) global.controls.player3.mapping.down = -1;
				if (mappingLeft3 == input) global.controls.player3.mapping.left = -1;
				if (mappingRight3 == input) global.controls.player3.mapping.right = -1;
				if (mappingAttack3 == input) global.controls.player3.mapping.attack = -1;
				if (mappingJump3 == input) global.controls.player3.mapping.jump = -1;
				if (mappingUp3 == input) global.controls.player3.mapping.up = -1;
				if (mappingPause3 == input) global.controls.player3.mapping.pause = -1;
				if (mappingSpecial3 == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "jump") {
				global.controls.player3.mapping.jump = input;
				if (mappingDown3 == input) global.controls.player3.mapping.down = -1;
				if (mappingLeft3 == input) global.controls.player3.mapping.left = -1;
				if (mappingRight3 == input) global.controls.player3.mapping.right = -1;
				if (mappingAttack3 == input) global.controls.player3.mapping.attack = -1;
				if (mappingInteract3 == input) global.controls.player3.mapping.interact = -1;
				if (mappingUp3 == input) global.controls.player3.mapping.up = -1;
				if (mappingPause3 == input) global.controls.player3.mapping.pause = -1;
				if (mappingSpecial3 == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "pause") {
				global.controls.player3.mapping.pause = input;
				if (mappingDown3 == input) global.controls.player3.mapping.down = -1;
				if (mappingLeft3 == input) global.controls.player3.mapping.left = -1;
				if (mappingRight3 == input) global.controls.player3.mapping.right = -1;
				if (mappingAttack3 == input) global.controls.player3.mapping.attack = -1;
				if (mappingInteract3 == input) global.controls.player3.mapping.interact = -1;
				if (mappingJump3 == input) global.controls.player3.mapping.jump = -1;
				if (mappingUp3 == input) global.controls.player3.mapping.up = -1;
				if (mappingSpecial3 == input) global.controls.player3.mapping.special = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "special") {
				global.controls.player3.mapping.special = input;
				if (mappingDown3 == input) global.controls.player3.mapping.down = -1;
				if (mappingLeft3 == input) global.controls.player3.mapping.left = -1;
				if (mappingRight3 == input) global.controls.player3.mapping.right = -1;
				if (mappingAttack3 == input) global.controls.player3.mapping.attack = -1;
				if (mappingInteract3 == input) global.controls.player3.mapping.interact = -1;
				if (mappingJump3 == input) global.controls.player3.mapping.jump = -1;
				if (mappingUp3 == input) global.controls.player3.mapping.up = -1;
				if (mappingPause3 == input) global.controls.player3.mapping.pause = -1;
				global.controls.player3.mapping.obtaining = "waiting for button release";
			}
		}
	} else if (obtaining == "waiting for button release") {	
		if (input == pointer_null) {
			if (inputBlocked) global.controls.inputBlocked = false;
			global.controls.player3.mapping.obtaining = "";
		}
	}

#endregion

#region get control inputs for mapped controls for player 4

	if (!inputBlocked) {
		global.controls.player4.up.isHeld = get_held(4, mappingUp4);
		global.controls.player4.down.isHeld = get_held(4, mappingDown4);
		global.controls.player4.left.isHeld = get_held(4, mappingLeft4);
		global.controls.player4.right.isHeld = get_held(4, mappingRight4);
		global.controls.player4.attack.isHeld = get_held(4, mappingAttack4);
		global.controls.player4.interact.isHeld = get_held(4, mappingInteract4);
		global.controls.player4.special.isHeld = get_held(4, mappingSpecial4);
		global.controls.player4.jump.isHeld = get_held(4, mappingJump4);
		global.controls.player4.pause.isHeld = get_held(4, mappingPause4);

		global.controls.player4.up.wasPressed = get_pressed(4, mappingUp4);
		global.controls.player4.down.wasPressed = get_pressed(4, mappingDown4);
		global.controls.player4.left.wasPressed = get_pressed(4, mappingLeft4);
		global.controls.player4.right.wasPressed = get_pressed(4, mappingRight4);
		global.controls.player4.attack.wasPressed = get_pressed(4, mappingAttack4);
		global.controls.player4.interact.wasPressed = get_pressed(4, mappingInteract4);
		global.controls.player4.special.wasPressed = get_pressed(4, mappingSpecial4);
		global.controls.player4.jump.wasPressed = get_pressed(4, mappingJump4);
		global.controls.player4.pause.wasPressed = get_pressed(4, mappingPause4);

		global.controls.player4.up.wasReleased = get_released(4, mappingUp4);
		global.controls.player4.down.wasReleased = get_released(4, mappingDown4);
		global.controls.player4.left.wasReleased = get_released(4, mappingLeft4);
		global.controls.player4.right.wasReleased = get_released(4, mappingRight4);
		global.controls.player4.attack.wasReleased = get_released(4, mappingAttack4);
		global.controls.player4.interact.wasReleased = get_released(4, mappingInteract4);
		global.controls.player4.special.wasReleased = get_released(4, mappingSpecial4);
		global.controls.player4.jump.wasReleased = get_released(4, mappingJump4);
		global.controls.player4.pause.wasReleased = get_released(4, mappingPause4);
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
	
	obtaining = global.controls.player4.mapping.obtaining;

	if (obtaining != "" && obtaining != "waiting for button release") {
		var input = get_any_input(4);
		if (input != pointer_null) {
			if (obtaining == "up") {
				global.controls.player4.mapping.up = input;
				if (mappingDown4 == input) global.controls.player4.mapping.down = -1;
				if (mappingLeft4 == input) global.controls.player4.mapping.left = -1;
				if (mappingRight4 == input) global.controls.player4.mapping.right = -1;
				if (mappingAttack4 == input) global.controls.player4.mapping.attack = -1;
				if (mappingInteract4 == input) global.controls.player4.mapping.interact = -1;
				if (mappingJump4 == input) global.controls.player4.mapping.jump = -1;
				if (mappingPause4 == input) global.controls.player4.mapping.pause = -1;
				if (mappingSpecial4 == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "down") {
				global.controls.player4.mapping.down = input;
				if (mappingUp4 == input) global.controls.player4.mapping.up = -1;
				if (mappingLeft4 == input) global.controls.player4.mapping.left = -1;
				if (mappingRight4 == input) global.controls.player4.mapping.right = -1;
				if (mappingAttack4 == input) global.controls.player4.mapping.attack = -1;
				if (mappingInteract4 == input) global.controls.player4.mapping.interact = -1;
				if (mappingJump4 == input) global.controls.player4.mapping.jump = -1;
				if (mappingPause4 == input) global.controls.player4.mapping.pause = -1;
				if (mappingSpecial4 == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "left") {
				global.controls.player4.mapping.left = input;
				if (mappingDown4 == input) global.controls.player4.mapping.down = -1;
				if (mappingUp4 == input) global.controls.player4.mapping.up = -1;
				if (mappingRight4 == input) global.controls.player4.mapping.right = -1;
				if (mappingAttack4 == input) global.controls.player4.mapping.attack = -1;
				if (mappingInteract4 == input) global.controls.player4.mapping.interact = -1;
				if (mappingJump4 == input) global.controls.player4.mapping.jump = -1;
				if (mappingPause4 == input) global.controls.player4.mapping.pause = -1;
				if (mappingSpecial4 == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "right") {
				global.controls.player4.mapping.right = input;
				if (mappingDown4 == input) global.controls.player4.mapping.down = -1;
				if (mappingLeft4 == input) global.controls.player4.mapping.left = -1;
				if (mappingUp4 == input) global.controls.player4.mapping.up = -1;
				if (mappingAttack4 == input) global.controls.player4.mapping.attack = -1;
				if (mappingInteract4 == input) global.controls.player4.mapping.interact = -1;
				if (mappingJump4 == input) global.controls.player4.mapping.jump = -1;
				if (mappingPause4 == input) global.controls.player4.mapping.pause = -1;
				if (mappingSpecial4 == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "attack") {
				global.controls.player4.mapping.attack = input;
				if (mappingDown4 == input) global.controls.player4.mapping.down = -1;
				if (mappingLeft4 == input) global.controls.player4.mapping.left = -1;
				if (mappingRight4 == input) global.controls.player4.mapping.right = -1;
				if (mappingUp4 == input) global.controls.player4.mapping.up = -1;
				if (mappingInteract4 == input) global.controls.player4.mapping.interact = -1;
				if (mappingJump4 == input) global.controls.player4.mapping.jump = -1;
				if (mappingPause4 == input) global.controls.player4.mapping.pause = -1;
				if (mappingSpecial4 == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "interact") {
				global.controls.player4.mapping.interact = input;
				if (mappingDown4 == input) global.controls.player4.mapping.down = -1;
				if (mappingLeft4 == input) global.controls.player4.mapping.left = -1;
				if (mappingRight4 == input) global.controls.player4.mapping.right = -1;
				if (mappingAttack4 == input) global.controls.player4.mapping.attack = -1;
				if (mappingJump4 == input) global.controls.player4.mapping.jump = -1;
				if (mappingUp4 == input) global.controls.player4.mapping.up = -1;
				if (mappingPause4 == input) global.controls.player4.mapping.pause = -1;
				if (mappingSpecial4 == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "jump") {
				global.controls.player4.mapping.jump = input;
				if (mappingDown4 == input) global.controls.player4.mapping.down = -1;
				if (mappingLeft4 == input) global.controls.player4.mapping.left = -1;
				if (mappingRight4 == input) global.controls.player4.mapping.right = -1;
				if (mappingAttack4 == input) global.controls.player4.mapping.attack = -1;
				if (mappingInteract4 == input) global.controls.player4.mapping.interact = -1;
				if (mappingUp4 == input) global.controls.player4.mapping.up = -1;
				if (mappingPause4 == input) global.controls.player4.mapping.pause = -1;
				if (mappingSpecial4 == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "pause") {
				global.controls.player4.mapping.pause = input;
				if (mappingDown4 == input) global.controls.player4.mapping.down = -1;
				if (mappingLeft4 == input) global.controls.player4.mapping.left = -1;
				if (mappingRight4 == input) global.controls.player4.mapping.right = -1;
				if (mappingAttack4 == input) global.controls.player4.mapping.attack = -1;
				if (mappingInteract4 == input) global.controls.player4.mapping.interact = -1;
				if (mappingJump4 == input) global.controls.player4.mapping.jump = -1;
				if (mappingUp4 == input) global.controls.player4.mapping.up = -1;
				if (mappingSpecial4 == input) global.controls.player4.mapping.special = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			} else if (obtaining == "special") {
				global.controls.player4.mapping.special = input;
				if (mappingDown4 == input) global.controls.player4.mapping.down = -1;
				if (mappingLeft4 == input) global.controls.player4.mapping.left = -1;
				if (mappingRight4 == input) global.controls.player4.mapping.right = -1;
				if (mappingAttack4 == input) global.controls.player4.mapping.attack = -1;
				if (mappingInteract4 == input) global.controls.player4.mapping.interact = -1;
				if (mappingJump4 == input) global.controls.player4.mapping.jump = -1;
				if (mappingUp4 == input) global.controls.player4.mapping.up = -1;
				if (mappingPause4 == input) global.controls.player4.mapping.pause = -1;
				global.controls.player4.mapping.obtaining = "waiting for button release";
			}
		}
	} else if (obtaining == "waiting for button release") {	
		if (input == pointer_null) {
			if (inputBlocked) global.controls.inputBlocked = false;
			global.controls.player4.mapping.obtaining = "";
		}
	}

#endregion