/// @description 

var _destroy = false;

with (other)
{
	if (player_is_alive())
	{
		water_meter = 100;
		_destroy = true;
		sfx_play_global(sfx_bubble_air);
	}
}

if (_destroy)
	instance_destroy();