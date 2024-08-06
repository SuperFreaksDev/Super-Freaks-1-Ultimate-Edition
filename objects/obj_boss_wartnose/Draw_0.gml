var _y = y;

var _cup,
	_cup_list = cups,
	_cup_list_length = array_length(_cup_list);
	
if (wartnose_visuals.y_offset > -128)
	draw_sprite_ext(sprite_index, 0, cups[0].x, _y + wartnose_visuals.y_offset, wartnose_visuals.flip, 1, 0, c_white, 1);
for (_cup = 0; _cup < _cup_list_length; ++_cup)
{
	with (cups[_cup])
		draw_sprite(spr_boss_wartnose_cup, 0, x, _y);
}