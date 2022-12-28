/// @description Death

var _clone;
var _xscale = image_xscale;
var _yscale = image_yscale;
var _i;

if (_xscale > 0.5)
{
	global.boss_phase++;
	for (_i = -1; _i <= 1; _i += 2)
	{
		_clone = instance_create_layer(x + (32 * _i), y, "layer_instances", obj_boss_larry,
		{
			image_xscale: _xscale * 0.5,
			image_yscale: _yscale * 0.5,
			hurt_timer: 20,
		});
		with (_clone)
		{
			speed_h = 2 * _i;
			speed_v = -4;
		}
	}
	instance_create_layer(x, y, "layer_instances", obj_boss_explosion);
	instance_destroy();
}
else
{
	if (instance_number(object_index) > 1)
	{
		instance_create_layer(x, y, "layer_instances", obj_boss_explosion);
		instance_destroy();
	}
	else
	{
		state_next_set(2);
	}
}