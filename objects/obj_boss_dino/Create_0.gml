/// @description Init

enum boss_dino_states
{
	inactive = 0,
	normal,
	fall,
	jetpack,
	final_attack_1,
	final_attack_2,
	death,
}

// Inherit the parent event
event_inherited();

hp_init(1);
boss_name = "Dino";
hitbox = new comp_hitbox_AABB(,,, enemy_hitbox_behaviors.normal,, -8, -12, 8, 20);
animate_speed = 0.125;
face = -1;
depth = 0;