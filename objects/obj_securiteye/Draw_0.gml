/// @description 

var _frame_delta = frame_delta_level_get();
var _x = lerp(x_start_frame, x, _frame_delta);
var _y = lerp(y_start_frame, y, _frame_delta);
var _angle = lerp(angle_previous, angle, _frame_delta);
var _triangle_x1 = _x + searchlight.shape_x1;
var _triangle_y1 = _y + searchlight.shape_y1;
var _triangle_x2 = _x + searchlight.shape_x2;
var _triangle_y2 = _y + searchlight.shape_y2;
var _triangle_x3 = _x + searchlight.shape_x3;
var _triangle_y3 = _y + searchlight.shape_y3;

if (!trigger_get(trigger_id))
{
	draw_sprite_ext(spr_securiteye, image_index, _x, _y, 1, 1, _angle, c_white, 1);
	draw_set_color(c_blue);
	draw_set_alpha(0.5);
	draw_triangle(_triangle_x1, _triangle_y1, _triangle_x2, _triangle_y2, _triangle_x3, _triangle_y3, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}
else
	draw_sprite_ext(spr_securiteye_shut, image_index, _x, _y, 1, 1, _angle, c_white, 1);