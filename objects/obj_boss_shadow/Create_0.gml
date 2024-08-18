/// @description Init

enum boss_shadow_states
{
	intro = 0,
	idle,
	teleport_1,
	teleport_2,
	attack_prepare,
	attack_shurikens,
	attack_dragon,
	attack_bombs,
	death,
}

// Inherit the parent event
event_inherited();

boss_name = "The Shadow";
hp_init(20);
hitbox = new comp_hitbox_AABB(,, hitbox_active.inactive, enemy_hitbox_behaviors.heavy,, -48, -48, 48, 64);
yorb_amount = 20;

locations = 
[
	[608, 608],
	[864, 608],
	[1120, 608],
	
	[480, 704],
	[736, 704],
	[992, 704],
	[1248, 704]
];
locations = array_shuffle(locations);
location_current = 0;
depth = 5;
toughness = 0;
toughness_max = 3;
fast_forward = false;

switch (global.difficulty)
{
	case difficulty_levels.easy:
		toughness = 0;
		break;
	case difficulty_levels.normal:
		toughness = 1;
		break;
	case difficulty_levels.hard:
		toughness = 2;
		break;
}

if (global.boss_phase == 1)
	toughness++;
	
switch (global.boss_phase)
{
	case 0:
		break;
	case 1:
		hp = 10;
		toughness++;
		break;
	case 2:
		hp = 0;
		state_next_set(boss_shadow_states.death, 99999);
		break;
}