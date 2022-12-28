/// @description Draw

var _arm_angle = 315;
if (face == -1)
	_arm_angle = 225;

draw_sprite_interpolated(sprite_index, image_index, x, y,,, face, 1,,, 0,, c_white, 1, frame_delta_level_get());

if (arm_length > 0)
{
	draw_sprite_ext(spr_megaklaw_arm, 0, x + -10 * face, y + 17, arm_length * 1.5, 1, _arm_angle, c_white, 1);
	draw_sprite_ext(spr_megaklaw_claw, 0, x + (arm_length - 10) * face, y + 17 + arm_length, face, 1, 0, c_white, 1);
}