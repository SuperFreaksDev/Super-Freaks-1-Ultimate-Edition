/// @description 

switch (state)
{
	case player_states.debug:
	case player_states.inactive:
	case player_states.drop_in:
		break;
	case player_states.death:
		invincible = false;
	case player_states.bubble:
		state_next_set(player_states.normal);
		hitbox.active = hitbox_active.active;
		camera.active = true;
		state_machine_step();
		hurt_timer_set(120);
		music_resume();
		break;
	default:
		state_next_set(player_states.normal);
		hitbox.active = hitbox_active.active;
		camera.active = true;
		hurt_timer_set(0);
		break;
}

face = 1;
ball = false;
speed_h = 0;
speed_v = 0;
ground_on = false;
instance_attach = undefined;
water_meter = 100;

lock_controls_horizontal = 0;
lock_controls_vertical = 0;
lock_friction = 0;
lock_gravity = 0;

x_previous = x;
y_previous = y;
camera.x = x;
camera.y = y;
camera.xprevious = x;
camera.yprevious = y;

timer_death.frames = -1;
	
event_inherited();
