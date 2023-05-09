/// @description 

var _frame_delta = frame_delta_level_get();
var _x = lerp(x_previous, x, _frame_delta);
var _y = lerp(y_previous, y, _frame_delta);
var _angle = lerp(angle_previous, angle, _frame_delta);
var _laser_angle = lerp(laser_angle_previous, laser_angle, _frame_delta);
var _gun_left_x = _x + gun_left.x_offset;
var _gun_left_y = _y + gun_left.y_offset;
var _gun_right_x = _x + gun_right.x_offset;
var _gun_right_y = _y + gun_right.y_offset;
var _laser_left_x = _x + laser_left.x_offset;
var _laser_left_y = _y + laser_left.y_offset;
var _laser_left_x2 = _laser_left_x + laser_left.shape_x2;
var _laser_left_y2 = _laser_left_y + laser_left.shape_y2;
var _laser_right_x = _x + laser_right.x_offset;
var _laser_right_y = _y + laser_right.y_offset;
var _laser_right_x2 = _laser_right_x + laser_right.shape_x2;
var _laser_right_y2 = _laser_right_y + laser_right.shape_y2;
var _laser_color = 45 + lengthdir_x(45, laser_color);

draw_sprite_ext(spr_boss_skullmobile_gun, 0, _gun_left_x, _gun_left_y, 1, 1, _laser_angle + 180, c_white, 1);
draw_sprite_ext(spr_boss_skullmobile_gun, 0, _gun_right_x, _gun_right_y, 1, 1, _laser_angle, c_white, 1);
draw_set_color(make_color_rgb(255, _laser_color, _laser_color));
if (laser_left.active == hitbox_active.passive)
{
	draw_circle(_laser_left_x, _laser_left_y, 16, false);
	draw_line_width(_laser_left_x, _laser_left_y, _laser_left_x2, _laser_left_y2, 32);
}
if (laser_right.active == hitbox_active.passive)
{
	draw_circle(_laser_right_x, _laser_right_y, 16, false);
	draw_line_width(_laser_right_x, _laser_right_y, _laser_right_x2, _laser_right_y2, 32);
}
draw_set_color(c_white);
draw_sprite_ext(spr_boss_skullmobile, image_index, _x, _y, 1, 1, _angle, c_white, 1);