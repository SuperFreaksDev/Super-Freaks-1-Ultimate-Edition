/// @description Init

enum boss_megaklaw_states
{
	intro,
	float,
	punch_1,
	punch_2,
	punch_3,
	punch_4,
	death,
}

// Inherit the parent event
event_inherited();

face = -1;
timer = 0;
counter = 0;
shoot = false;

arm_length_previous = 0;
arm_length = 0;
arm_length_max = 184;

speed_h = 0;
speed_v = 0;
speed_acc = 0.125;

boss_name = "Mega Klaw";
hp_init(15);

hitbox.shape_x1 = -40;
hitbox.shape_y1 = -56;
hitbox.shape_x2 = 40;
hitbox.shape_y2 = 56;
hitbox.behavior = enemy_hitbox_behaviors.heavy;

arm_platform = new comp_collider_line();
with (arm_platform)
	collision_flags_set_all();

switch (global.boss_phase)
{
	case 0:
		break;
	case 1:
		hp = 7;
		break;
}