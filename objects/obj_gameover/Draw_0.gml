/// @description 

var _i;

var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();
var _view_width = view_width_get();
var _view_height = view_height_get();
var _screen_width_half = _screen_width / 2;
var _screen_height_half = _screen_height / 2;
var _screen_width_fourth = _screen_width / 4;

var _rec_A_y1 = (animate * _screen_height) - _screen_height;
var _rec_A_y2 = _rec_A_y1 + _screen_height;

var _rec_B_y1 = _screen_height - (animate * _screen_height);
var _rec_B_y2 = _rec_B_y1 + _screen_height;

draw_set_projection_2D(_view_x1, _view_y1, _screen_width, _screen_height);
draw_set_alpha(1);

draw_set_color(c_gray);
draw_rectangle(_view_x1 + _screen_width_fourth * 0, _view_y1 +_rec_A_y1, _view_x1 + (_screen_width_fourth * 1), _view_y1 + _rec_A_y2, false);
draw_rectangle(_view_x1 + _screen_width_fourth * 1, _view_y1 +_rec_B_y1, _view_x1 + (_screen_width_fourth * 2), _view_y1 + _rec_B_y2, false);
draw_rectangle(_view_x1 + _screen_width_fourth * 2, _view_y1 +_rec_A_y1, _view_x1 + (_screen_width_fourth * 3), _view_y1 + _rec_A_y2, false);
draw_rectangle(_view_x1 + _screen_width_fourth * 3, _view_y1 +_rec_B_y1, _view_x1 + (_screen_width_fourth * 4), _view_y1 + _rec_B_y2, false);

draw_sprite(spr_gameover, 0, _view_x1 + (_screen_width_half * animate), _view_y1 + _screen_height_half);

switch (global.game_mode)
{
	case game_modes.randomizer:
		draw_set_color(c_white);
		draw_set_font(global.font_title);
		draw_set_halign(fa_center);
		draw_set_valign(fa_bottom);
		draw_text(_view_x1 + _screen_width - (_screen_width_half * animate), _view_y1 + _screen_height, "FINAL SCORE: " + string(global.score - 1));
		break;
	default:
		break;
}
draw_set_projection_2D(_view_x1, _view_y1, _view_width, _view_height);
