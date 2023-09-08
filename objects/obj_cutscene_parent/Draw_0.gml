/// @description Draw

var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _view_width = view_width_get();
var _view_height = view_height_get();
var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();
var _view_x2 = view_x2_get();
var _view_y2 = view_y2_get();
var _screen_width_half = _screen_width / 2;
var _screen_height_half = _screen_height / 2;
var _text = string_copy(text, 0, text_draw);
var _text_height = string_height_ext(text, -1, _screen_width);
var _transition_type;
var _screen_shake = global.view.screen_shake_y;

if (segment_current >= 0)
	_transition_type = segment[segment_current][cutscene_segment.transition];
else
	_transition_type = cutscene_transitions.fade_black;

draw_set_projection_2D(_view_x1, _view_y1, _screen_width, _screen_height);
draw_set_alpha(1);

//Draw Back
switch (_transition_type)
{
	case cutscene_transitions.fade_white:
		draw_set_color(c_white);
		draw_rectangle(_view_x1, _view_y1, _view_x2, _view_y2, false);
		break;
	case cutscene_transitions.fade_black:
		draw_set_color(c_black);
		draw_rectangle(_view_x1, _view_y1, _view_x2, _view_y2, false);
		break;
	case cutscene_transitions.fade:
		draw_sprite_ext(sprite_next, 0, _view_x1 + _screen_width_half, _view_y1 + _screen_height_half, 1, 1, 0, c_white, 1);
		break;
	default:
		break;
}
if (sprite_index != -1)
	draw_sprite_ext(sprite_index, image_index, _view_x1 + _screen_width_half, _view_y1 + _screen_height_half + _screen_shake, 1, 1, 0, c_white, sprite_alpha);
	
draw_set_font(global.font_12);
_text_height = string_height_ext(text, -1, _screen_width);
//Draw Text Rectangle
draw_set_alpha(0.5);
draw_set_color(c_black);
draw_rectangle(_view_x1, _view_y2 - _text_height, _view_x1 + _screen_width, _view_y2, false);
//Draw Text
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_ext(_view_x1, _view_y2 - _text_height, _text, -1, _screen_width);

//Draw Button Prompts
draw_set_font(global.font_16);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_verb(0, "confirm", _view_x1 + _screen_width - 8, _view_y1 + 12);
draw_text(_view_x1 + _screen_width - 16, _view_y1 + 12, "Next / Fast Forward");
draw_verb(0, "start", _view_x1 + _screen_width - 8, _view_y1 + 28);
draw_text(_view_x1 + _screen_width - 16, _view_y1 + 28, "Skip");

draw_set_projection_2D(_view_x1, _view_y1, _view_width, _view_height);