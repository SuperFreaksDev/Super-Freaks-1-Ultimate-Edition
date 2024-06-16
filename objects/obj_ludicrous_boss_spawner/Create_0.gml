/// @description Init

var _boss_instance;

// Inherit the parent event
event_inherited();

can_despawn = false;
visible = false;

switch (global.story_mode)
{
	case story_modes.swordsman: //Spike
		_boss_instance = instance_create_layer(800, 592, "layer_instances", obj_boss_spike);
		break;
	default: //Mega Klaw
		_boss_instance = instance_create_layer(960, 880, "layer_instances", obj_boss_megaklaw);
		break;
}