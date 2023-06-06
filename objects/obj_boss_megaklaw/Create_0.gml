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
shoot_timer = 0;
shoot_amount = 0;

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
shoot_timer = 96;

arm_platform = new comp_collider_line();

switch (global.difficulty)
{
	case difficulty_levels.easy:
		shoot_timer = 128;
		shoot_amount = 3;
		break;
	case difficulty_levels.normal:
		shoot_timer = 112;
		shoot_amount = 4;
		break;
	case difficulty_levels.hard:
		shoot_timer = 96;
		shoot_amount = 4;
		break;
}

switch (global.boss_phase)
{
	case 0:
		break;
	case 1:
		hp = 7;
		break;
}