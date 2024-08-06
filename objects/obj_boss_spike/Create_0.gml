/// @description Init

enum boss_spike_states
{
	intro = 0,
	normal,
	prepare,
	spike,
	shoot,
	death,
}

chain_segments = 9;
chain_multiplier = 0.70;
chain_multiplier_max = 0.70;
swing_speed = 0;
animate_speed = 0;
spike_size = 0;
yorb_amount = 5;

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.heavy,, 64);
boss_name = "Spike";
hp_init(20);

angle = 270;
angle_previous = 270;

thing_x = 0;
thing_y = 0;
thing_x_previous = thing_x;
thing_y_previous = thing_y;

switch (global.boss_phase)
{
	case 0:
		state_next_set(boss_spike_states.intro);
		chain_multiplier = 0.75;
		chain_multiplier_max = 0.75;
		break;
	case 1:
		hp = 10;
		state_next_set(boss_spike_states.normal);
		chain_multiplier = 1;
		chain_multiplier_max = 1;
		swing_speed = 2;
		break;
	case 2:
		hp = 0;
		state_next_set(boss_spike_states.death);
		chain_multiplier = 1;
		chain_multiplier_max = 1;
		swing_speed = 0;
		break;
}
