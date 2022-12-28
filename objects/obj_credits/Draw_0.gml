/// @description 

var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _y = _screen_height - (text_height * pos);

draw_set_font(global.font_16);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

draw_text(_screen_width / 2, _y, text);