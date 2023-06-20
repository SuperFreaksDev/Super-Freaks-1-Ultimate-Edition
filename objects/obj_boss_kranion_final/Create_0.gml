/// @description 

// Inherit the parent event
event_inherited();

enum boss_kranion_final_states
{
	intro_1 = 0,
	intro_2,
	bounce,
	death_1,
	death_2,
}

boss_name = "Kranion Ultimate Edition";
hp_init(24);

with (obj_player)
	jetpack = true;
	
hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.heavy,, 64);

depth = 3;
state_next_set(boss_kranion_final_states.intro_1);