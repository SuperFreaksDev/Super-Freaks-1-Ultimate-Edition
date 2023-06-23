/// @description Init

var _i;

enum boss_dino_ship_states
{
	intro = 0,
	normal,
	death,
}

// Inherit the parent event
event_inherited();

hp_init(12);

hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.heavy,, 48);

hitbox_saber = array_create(4);
for (_i = 0; _i < 4; ++_i)
{
	hitbox_saber[_i] = new comp_hitbox_capsule(,, hitbox_active.inactive, enemy_hitbox_behaviors.hazard,,,,,, 8);
}
saber_angle = 0;
saber_angle_previous = 0;

movement = 0;

switch (global.difficulty)
{
	case difficulty_levels.hard:
		hitbox_saber[1].active = hitbox_active.passive;
		hitbox_saber[3].active = hitbox_active.passive;
	case difficulty_levels.normal:
		hitbox_saber[2].active = hitbox_active.passive;
	case difficulty_levels.easy:
		hitbox_saber[0].active = hitbox_active.passive;
		break;
}

state_next_set(boss_dino_ship_states.intro);