/// @description Death

var _clone_amount = obj_boss_larry_controller.clone_amount;
var _clone;
var _xscale = image_xscale;
var _yscale = image_yscale;
var _i;

if (_xscale > 0.5)
{
	global.boss_phase++;
	for (_i = -ceil(_clone_amount / 2); _i <= ceil(_clone_amount / 2); _i += 2)
	{
		_clone = instance_create_layer(x + (16 * _i), y, "layer_instances", obj_boss_larry,
		{
			image_xscale: _xscale * 0.5,
			image_yscale: _yscale * 0.5,
			hurt_timer: 20,
		});
		with (_clone)
		{
			speed_h = _i;
			if (_i == 0)
				speed_h = 1;
			speed_v = -6;
			hp_init(4);
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