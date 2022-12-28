/// @description Step

var _back_width = sprite_get_width(spr_background_hippie_clouds);

scroll_previous = scroll;
scroll += 0.5;

if (scroll >= _back_width)
{
	scroll -= _back_width;
	scroll_previous -= _back_width;
}