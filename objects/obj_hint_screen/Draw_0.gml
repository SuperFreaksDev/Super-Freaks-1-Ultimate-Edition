/// @description 

var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _view_x1 = view_x1_get();
var _view_y1 = view_y1_get();
var _view_width = view_width_get();
var _view_height = view_height_get();
var _x = _view_x1 + (_screen_width / 2);
var _y = _view_y1 + (_screen_height / 2);

var _font_size;
var _animate = animation;
var _animate_previous = animation_previous;

draw_set_alpha(1);
draw_set_color(c_white);
draw_set_projection_2D(_view_x1, _view_y1, _screen_width, _screen_height);
draw_sprite_interpolated(spr_menu, 0, _x, _y, _x, _y, 12 * _animate, 6 * _animate, 12 * _animate_previous, 6 * _animate_previous);
	
draw_set_halign(fa_center);
draw_set_font(global.font_16);
_font_size = sprite_get_height(spr_font_16);
	
if (_animate == 1)
{
	draw_set_valign(fa_middle);
			
	draw_text_ext(_x, _y, hint, -1, 424);
}
draw_set_projection_2D(_view_x1, _view_y1, _view_width, _view_height);