/// @description 

var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _screen_width_half = (_screen_width / 2);
var _y = lerp(-text_height, _screen_height, pos);

draw_set_color(c_black);
draw_set_alpha(0.5);
draw_rectangle(_screen_width_half - 240, 0, _screen_width_half + 240, room_height, false);

draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(global.font_16);
draw_set_valign(fa_top);
draw_set_halign(fa_center);

draw_text_ext(_screen_width_half, _y, text, -1, 424);