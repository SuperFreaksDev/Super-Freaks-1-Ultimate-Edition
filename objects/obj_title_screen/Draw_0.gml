/// @description 

var _center_x = room_width / 2;
var _center_y = room_height / 2;
var _view_x2 = view_x2_get();
var _view_y2 = view_y2_get();

draw_set_color(c_white);
draw_set_font(global.font_16);

draw_sprite(sprite_index, 0, x, y);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(_center_x, _center_y + 128, "Press Jump or Start");
draw_verb(global.player_lead, "confirm", _center_x - 16, _center_y + 160);
draw_verb(global.player_lead, "start", _center_x + 16, _center_y + 160);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_set_font(global.font_12);
draw_text(_view_x2, _view_y2, text);