/// @function							player_state_free();
/// @desc								allows movement and jumping from player
function player_state_free() {
	var controls = pointer_null;
	if (self.player.isPlayer1) controls = global.controls.player1;
	else if (self.player.isPlayer2) controls = global.controls.player2;
	else if (self.player.isPlayer3) controls = global.controls.player3;
	else if (self.player.isPlayer4) controls = global.controls.player4;
	
	if (self.status.isGrounded) {
		self.hspeed = 0;
		self.vspeed = 0;
	}

	if (snap_direction(self.physics.grav.dir) == 90 || snap_direction(self.physics.grav.dir) == 270) {
		if (controls.right.isHeld) {
			self.hspeed = 3;
		}

		if (controls.left.isHeld) {
			self.hspeed = -3;
		}
	}

	if (snap_direction(self.physics.grav.dir) == 0 || snap_direction(self.physics.grav.dir) == 180) {
		if (controls.up.isHeld) {
			self.vspeed = -3;
		}

		if (controls.down.isHeld) {
			self.vspeed = 3;
		}
	}

	if (self.status.isGrounded && controls.jump.wasPressed) {
		self.status.isGrounded = false;
		self.x += lengthdir_x(6,snap_direction(wrap(self.physics.grav.dir-180, 0, 360)));
		self.y += lengthdir_y(6,snap_direction(wrap(self.physics.grav.dir-180, 0, 360)));
		self.hspeed = lengthdir_x(6,snap_direction(wrap(self.physics.grav.dir-180, 0, 360)));
		self.vspeed = lengthdir_y(6,snap_direction(wrap(self.physics.grav.dir-180, 0, 360)));
	}
}