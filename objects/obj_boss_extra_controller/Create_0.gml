/// @description 

switch (global.story_mode)
{
	case story_modes.swordsman:
		instance_create_layer(864, 608, "layer_instances", obj_boss_shadow);
		break;
	default:
		instance_create_layer(1120, 832, "layer_instances", obj_boss_controller_antifreaks);
		break;
}

instance_destroy();