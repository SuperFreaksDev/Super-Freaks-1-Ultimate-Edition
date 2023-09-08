/// @description 

var _center_x = room_width / 2;
var _center_y = room_height / 2;


if (timer > 2)
{
	draw_set_font(global.font_12);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext(_center_x, _center_y, "Thanks for playing Super Freaks 1 Ultimate Edition! This is the first completed release of the game. New songs and features are being worked on, so check back every now and then for updates big and small!\n- SuperFreaksDev", -1, 424);
}