/// @description Init

enum boss_kranion_states
{
	intro = 0,
	normal,
	charge,
	bounce,
	stun,
	death,
}

// Inherit the parent event
event_inherited();

timer = 0;
counter = 0;
counter_max = 0;
shoot = false;
shoot_speed = 0;
shoot_timer = 0;

speed_h = 0;
speed_v = 0;
speed_acc = 0.125;
speed_grv = 0.25;

boss_name = "Kranion";
hp_init(24);

hitbox.shape_x1 = -40;
hitbox.shape_y1 = -40;
hitbox.shape_x2 = 40;
hitbox.shape_y2 = 64;

collider_detector_sides_set(-40,, 40,, 80);
collider_detector_up_set(-40,, 40,, -60);
collider_detector_down_set(-40,, 40,, 64);
	
state_next_set(boss_kranion_states.normal);