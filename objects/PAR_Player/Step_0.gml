/// @description Handle movement

switch (self.status.state) {
	case playerState.free : player_state_free(); break;	
	case objectState.switchingGravity : break;
}

calculate_physics(true);
