/// @description Init

var _boss_instance;

// Inherit the parent event
event_inherited();

can_despawn = false;
visible = false;
boss_name = "Apex";
hitbox.active = hitbox_active.inactive;
hp_init(75);

switch (global.boss_phase)
{
	case 0:
		_boss_instance = instance_create_layer(800, 240, "layer_instances", obj_apex_intro);
		break;
	case 1:
		break;
}