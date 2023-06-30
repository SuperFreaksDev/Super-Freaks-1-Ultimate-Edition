/// @description Init
// Inherit the parent event

var _i, _instance, _wait = 32;

enum boss_antifreak_states
{
	inactive = 0,
	intro,
	retreat,
	wait,
	attack_1,
	attack_2,
	attack_3,
	death,
}

event_inherited();

can_despawn = false;
visible = false;

get_total_hp = function()
{
	var _hp = 0;
	var _total = 0;
	
	with (obj_boss_superior)
	{
		_total++;
		_hp += hp;
	}
	
	with (obj_boss_negativequincy)
	{
		_total++;
		_hp += hp;
	}
	
	with (obj_boss_geyzer)
	{
		_total++;
		_hp += hp;
	}
	
	with (obj_boss_trashcanman)
	{
		_total++;
		_hp += hp;
	}

	hp_init(_total * 8);
	hp = _hp;
}

boss_name = "Anti Freaks";
antifreaks = array_create(4);

antifreaks[0] = instance_create_layer(x - 64, y + 8, "layer_instances", obj_boss_superior);
antifreaks[1] = instance_create_layer(x - 32, y + 8, "layer_instances", obj_boss_negativequincy);
antifreaks[2] = instance_create_layer(x, y + 8, "layer_instances", obj_boss_geyzer);
antifreaks[3] = instance_create_layer(x + 32, y + 8, "layer_instances", obj_boss_trashcanman);

for (_i = 0; _i < array_length(antifreaks); ++_i)
{
	_instance = antifreaks[_i];
	if (bit_get(global.boss_phase, _i))
	{
		with (_instance)
		{
			state_next_set(boss_antifreak_states.inactive, 99999);
			hp = 0;
		}
	}
	else
	{
		with (_instance)
		{
			state_next_set(boss_antifreak_states.intro, 99999);
			hp_init(8);
			timer = random_range(48, 64);
			wait = _wait;
			_wait += 72;
		}
	}
}

get_total_hp();
hitbox.active = hitbox_active.inactive;
active = true;
timer = 64;