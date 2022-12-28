/// @description Init

var _i;
var _clone;

// Inherit the parent event
event_inherited();

get_total_hp = function()
{
	var _hp = 0;
	var _total = 0;
	
	if (instance_exists(obj_boss_larry))
	{
		with (obj_boss_larry)
		{
			_total++;
			_hp += hp;
		}

		hp_init(_total * 8);
		hp = _hp;
	}
}

boss_name = "Larry McPeel";
hitbox.active = hitbox_active.inactive;

switch (global.boss_phase)
{
	case 0:
		instance_create_layer(x, y, "layer_instances", obj_boss_larry_intro);
		hp_init(1);
		break;
	case 1:
		_clone = instance_create_layer(x, y, "layer_instances", obj_boss_larry);
		break;
	case 2:
		for (_i = -1; _i <= 1; _i += 2)
		{
			_clone = instance_create_layer(x + (32 * _i), y, "layer_instances", obj_boss_larry,
			{
				image_xscale: 0.5,
				image_yscale: 0.5,
			});
			with (_clone)
			{
				speed_h = 2 * _i;
				speed_v = -4;
			}
		}
		break;
}

get_total_hp();