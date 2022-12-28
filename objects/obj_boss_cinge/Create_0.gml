/// @description Init

enum boss_cinge_states
{
	intro = 0,
	normal,
	shoot,
	fireball,
	stun,
	stun_ground,
	get_up,
	death,
}

// Inherit the parent event
event_inherited();

timer = 0;
counter = 0;
shoot = false;

speed_h = 0;
speed_v = 0;
speed_acc = 0.125;
speed_grv = 0.25;

boss_name = "Cinge";
hp_init(12);

hitbox.shape_x1 = -40;
hitbox.shape_y1 = -40;
hitbox.shape_x2 = 40;
hitbox.shape_y2 = 80;

collider_detector_sides_set(-40,, 40,, 80);
collider_detector_up_set(-40,, 40,, -60);
collider_detector_down_set(-40,, 40,, 80);

if (global.boss_phase == 1)
{
	hp = 6;
	instance_create_layer(0, 0, "layer_instances", obj_boss_cinge_heat_haze);
}
	
state_next_set(boss_cinge_states.normal);