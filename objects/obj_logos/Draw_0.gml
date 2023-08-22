/// @description 

var _center_x = room_width / 2;
var _center_y = room_height / 2;


if (timer > 2)
{
	draw_set_font(global.font_12);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text_ext(_center_x, _center_y, "This is a Release Candidate build for Super Freaks 1 Ultimate Edition. This game is feature complete but some polish and songs are still being worked on. Check back soon for the whole thing!", -1, 424);
}