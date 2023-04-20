/// @description Init

// Inherit the parent event
event_inherited();

enum enemy_gunnery_states
{
	walk,
	shoot_1,
	shoot_2,
	shoot_3,
	reload,
}

hitbox = new comp_hitbox_AABB(,,, enemy_hitbox_behaviors.heavy,, -30, -40, 30, 40);
timer = 0;
ammo = 8;
shoot_spread = 0;
yorb_amount = 10;
hp_init(2);
state_next_set(enemy_gunnery_states.walk);

speed_walk = walk_speed;
animate_speed = speed_walk * 0.25;
collider_detector_up_set(0, 0, 0, 0, -36);
collider_detector_down_set(0, 0, 0, 0, 48);
collider_detector_sides_set(-16, 0, 16, 0, 30);