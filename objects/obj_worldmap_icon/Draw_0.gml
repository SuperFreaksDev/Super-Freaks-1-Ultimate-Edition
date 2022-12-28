/// @description 

var _x = x;
var _y = y;

draw_self();

if (pic_alpha > 0)
{
	switch (x > (room_width / 2))
	{
		case true:
			_x = x - 112;
			break;
		case false:
			_x = x + 112;
			break;
	}
	_x = clamp(_x, 64, room_width - 64);
	_y = clamp(_y, 98, room_height - 98);
	draw_sprite_ext(spr_worldmap_pictures, level_id, _x, _y, 1, 1, 0, c_white, pic_alpha);
}