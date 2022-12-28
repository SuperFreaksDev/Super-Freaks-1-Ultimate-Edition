/// @description Init

// Inherit the parent event
event_inherited();

enum enemy_buckler_states
{
	shield = 0,
	ready,
	shoot_1,
	shoot_2,
}

hitbox = new comp_hitbox_circle();
timer = 0;
shoot_counter = 0;
state_next_set(enemy_buckler_states.ready);

speed_walk = 0;
collider_detector_up_set(0, 0, 0, 0, -10);
collider_detector_down_set(0, 0, 0, 0, 26);
collider_detector_sides_set(-8, 0, 8, 0, 12);