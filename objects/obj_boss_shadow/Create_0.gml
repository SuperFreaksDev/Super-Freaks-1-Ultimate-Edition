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
hp_init(36);
hitbox = new comp_hitbox_AABB(,, hitbox_active.inactive, enemy_hitbox_behaviors.heavy,, -48, -48, 48, 64);

locations = 
[
	[608, 608],
	[864, 608],
	[1120, 608],
	
	[480, 704],
	[736, 704],
	[992, 704],
	[1248, 704],
	
	[864, 800]
];
locations = array_shuffle(locations);
location_current = 0;