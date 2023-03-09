/// @description Init

// Inherit the parent event
event_inherited();

enum enemy_mortar_states
{
	ready,
	shoot_1,
	shoot_2,
}

hitbox = new comp_hitbox_AABB(,,, enemy_hitbox_behaviors.heavy,, -30, -40, 30, 40);
timer = 0;
shoot_counter = 0;
hp_init(2);
state_next_set(enemy_mortar_states.ready);

speed_walk = 0;
collider_detector_up_set(0, 0, 0, 0, -36);
collider_detector_down_set(0, 0, 0, 0, 48);
collider_detector_sides_set(-16, 0, 16, 0, 30);