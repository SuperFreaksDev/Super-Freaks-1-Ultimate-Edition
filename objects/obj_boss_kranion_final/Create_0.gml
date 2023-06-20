/// @description 
var _radius = 64;

// Inherit the parent event
event_inherited();

enum boss_kranion_final_states
{
	intro_1 = 0,
	intro_2,
	idle,
	spikes_expand,
	spikes_retract,
	bounce,
	suction,
	death_1,
	death_2,
}

boss_name = "Kranion Ultimate Edition";
hp_init(24);

with (obj_player)
	jetpack = true;
	
hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.heavy,, _radius);
collider_detector_up_set(-_radius + 4, 0, _radius - 4, 0, -_radius);
collider_detector_down_set(-_radius + 4, 0, _radius - 4, 0, _radius);
collider_detector_sides_set(-_radius + 4, 0, _radius - 4, 0, _radius);

depth = 3;
state_next_set(boss_kranion_final_states.intro_1);

face_angle = 0;
face_angle_previous = 0;
face_rotate_speed = 0;
aura_size = 1;
aura_angle = 0;
aura_angle_previous = 0;
spike_size = 0;
spike_angle = 0;
spike_angle_previous = 0;
spike_speed = 0;
animate_speed = 0.25;