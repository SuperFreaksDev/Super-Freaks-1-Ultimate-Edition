/// @description Init

var _boss_instance;

// Inherit the parent event
event_inherited();

can_despawn = false;
visible = false;

switch (global.boss_phase)
{
	case 0:
		_boss_instance = instance_create_layer(x, y, "layer_instances", obj_boss_dino);
		with (_boss_instance)
			state_next_set(boss_dino_states.normal, 9999);
		break;
	case 1:
		instance_create_layer(800, 456, "layer_instances", obj_boss_dino_ship);
		
		break;
}