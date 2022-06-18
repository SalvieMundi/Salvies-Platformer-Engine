/// @description Debug Info

draw_self();

if (global.debug.isOn) {
	draw_text(self.x, self.y, string(self.status.isGrounded) + "\n" + string(self.status.justLanded) + "\n" + string(self.status.groundingBlock) + "\n" + string(self.spd.h) + "\n" + string(self.spd.v));
}