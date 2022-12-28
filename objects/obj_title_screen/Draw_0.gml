/// @description 

var _view_x2 = view_x2_get();
var _view_y2 = view_y2_get();

draw_set_color(c_white);
draw_set_font(global.font_16);

draw_sprite(spr_cutscene_intro_3, 0, x, y);
draw_sprite(sprite_index, 0, x, y);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_text(x, y + 64, "Press Jump or Start");
draw_action(, controls_actions.jump, x - 16, y + 96);
draw_action(, controls_actions.start, x + 16, y + 96);

draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
draw_text(_view_x2, _view_y2, text);