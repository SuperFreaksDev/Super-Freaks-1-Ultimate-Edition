/// @description 

var _frame = 0;
var _player_num, _character_index;
var _x = view_x_get();
var _y = view_y_get() + (screen_height_get() * (2 * y_offset));

if (global.animate > 4)
	_frame = 1;

draw_set_font(global.font_16);
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_sprite_interpolated(spr_menu, 0, _x, _y, _x, _y, 12, 5, 12, 5);

_player_num = 0;
_character_index = global.player_list[_player_num][player_data.character_index];
draw_sprite(spr_player_numbers, _player_num, _x - 192, _y - 72);
if (global.player_list[_player_num][player_data.active])
{
	draw_sprite_ext(spr_menu_arrow_32, _frame, _x - 248, _y - 32, 1, 1, 90, c_white, 1);
	draw_sprite_ext(spr_menu_arrow_32, _frame, _x - 248, _y + 8, 1, 1, 270, c_white, 1);
	draw_sprite(spr_character_select, global.player_list[_player_num][player_data.character_index], _x - 192, _y - 16);
	draw_text_ext(_x - 192, _y + 32, string(global.character_names[_character_index]), -1, 96);
}
else
{
	draw_action(_player_num, controls_actions.jump, _x - 192, _y);
}

_player_num = 1;
_character_index = global.player_list[_player_num][player_data.character_index];
draw_sprite(spr_player_numbers, _player_num, _x - 68, _y - 72);
if (global.player_list[_player_num][player_data.active])
{
	draw_sprite_ext(spr_menu_arrow_32, _frame, _x - 124, _y - 32, 1, 1, 90, c_white, 1);
	draw_sprite_ext(spr_menu_arrow_32, _frame, _x - 124, _y + 8, 1, 1, 270, c_white, 1);
	draw_sprite(spr_character_select, global.player_list[_player_num][player_data.character_index], _x - 68, _y - 16);
	draw_text_ext(_x - 68, _y + 32, string(global.character_names[_character_index]), -1, 96);
}
else
{
	draw_action(_player_num, controls_actions.jump, _x - 68, _y);
}

_player_num = 2;
_character_index = global.player_list[_player_num][player_data.character_index];
draw_sprite(spr_player_numbers, _player_num, _x + 68, _y - 72);
if (global.player_list[_player_num][player_data.active])
{
	draw_sprite_ext(spr_menu_arrow_32, _frame, _x + 124, _y - 32, 1, 1, 90, c_white, 1);
	draw_sprite_ext(spr_menu_arrow_32, _frame, _x + 124, _y + 8, 1, 1, 270, c_white, 1);
	draw_sprite(spr_character_select, global.player_list[_player_num][player_data.character_index], _x + 68, _y - 16);
	draw_text_ext(_x + 68, _y + 32, string(global.character_names[_character_index]), -1, 96);
}
else
{
	draw_action(_player_num, controls_actions.jump, _x + 68, _y);
}

_player_num = 3;
_character_index = global.player_list[_player_num][player_data.character_index];
draw_sprite(spr_player_numbers, _player_num, _x + 192, _y - 72);
if (global.player_list[_player_num][player_data.active])
{
	draw_sprite_ext(spr_menu_arrow_32, _frame, _x + 248, _y - 32, 1, 1, 90, c_white, 1);
	draw_sprite_ext(spr_menu_arrow_32, _frame, _x + 248, _y + 8, 1, 1, 270, c_white, 1);
	draw_sprite(spr_character_select, global.player_list[_player_num][player_data.character_index], _x + 192, _y - 16);
	draw_text(_x + 192, _y + 32, string(global.character_names[_character_index]));
}
else
{
	draw_action(_player_num, controls_actions.jump, _x + 192, _y);
}