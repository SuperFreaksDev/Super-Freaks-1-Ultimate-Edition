/// @description Step

var _back_width = sprite_get_height(spr_castle_background_pillar);

scroll_previous = scroll;
scroll++;

if (scroll >= _back_width)
{
	scroll -= _back_width;
	scroll_previous -= _back_width;
}