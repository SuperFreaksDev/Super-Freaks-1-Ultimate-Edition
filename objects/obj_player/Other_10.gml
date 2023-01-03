/// @description Step

controls_step(player_number);

button_left = controls_action_state_get(controls_actions.left, player_number);
button_right = controls_action_state_get(controls_actions.right, player_number);
button_up = controls_action_state_get(controls_actions.up, player_number);
button_down = controls_action_state_get(controls_actions.down, player_number);
button_pause = controls_action_state_get(controls_actions.start, player_number);
button_drop_out = controls_action_state_get(controls_actions.drop_out, player_number);
button_jump = controls_action_state_get(controls_actions.jump, player_number);
button_bubble = controls_action_state_get(controls_actions.bubble, player_number);
button_rubberband = controls_action_state_get(controls_actions.rubberband, player_number);

collision_flags = 0;
crush_flags = 0;
hang_on = false;

if (lock_controls_horizontal > 0)
	lock_controls_horizontal = max(lock_controls_horizontal - 1, 0);
if (lock_controls_vertical > 0)
	lock_controls_vertical = max(lock_controls_vertical - 1, 0);
if (lock_friction > 0)
	lock_friction = max(lock_friction - 1, 0);
if (lock_gravity > 0)
	lock_gravity = max(lock_gravity - 1, 0);
	
if (global.water_active && y > global.water_height)
{
	if (underwater == false)
	{
		sfx_play_global(sfx_splash);
		underwater = true;
	}
}
else 
{
	if (underwater == true)
	{
		sfx_play_global(sfx_splash);
		underwater = false;
		
		if (ground_on == false && speed_v < 0)
		{
			coyote_time = COYOTE_TIME_MAX;
			jump_buffer = JUMP_BUFFER_MAX;
		}
	}
	water_meter = 100;
}

switch (state)
{
	case player_states.inactive:
		player_state_inactive();
		break;
	case player_states.drop_in:
		player_state_dropin();
		break;
	case player_states.debug:
		player_state_debug();
		player_enter_bubble();
		player_view_boundaries();
		player_drop_out();
		break;
	case player_states.normal:
		player_rubberband_activate();
		player_state_normal();
		player_rubberband_physics();
		player_enter_bubble();
		player_view_boundaries();
		player_crush();
		player_drop_out();
		break;
	case player_states.wall_slide:
		player_rubberband_activate();
		player_state_wall_slide();
		player_enter_bubble();
		player_view_boundaries();
		player_crush();
		player_drop_out();
		break;
	case player_states.hurt:
		player_rubberband_activate();
		player_state_hurt();
		player_rubberband_physics();
		player_enter_bubble();
		player_view_boundaries();
		player_crush();
		player_drop_out();
		break;
	case player_states.death:
		player_state_death();
		break;
	case player_states.death_fall:
		player_state_death_fall();
		break;
	case player_states.bubble:
		player_state_bubble();
		player_drop_out();
		break;
	case player_states.climb:
		player_rubberband_activate();
		player_state_climb();
		player_rubberband_physics();
		player_drop_out();
		break;
	case player_states.pole_climb:
		player_rubberband_activate();
		player_state_climb_pole();
		player_rubberband_physics();
		player_drop_out();
		break;
	case player_states.hang:
		player_rubberband_activate();
		player_state_hang();
		player_rubberband_physics();
		player_drop_out();
		break;
	default:
		break;
}