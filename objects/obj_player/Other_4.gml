/// @description 

switch (state)
{
	case player_states.debug:
	case player_states.inactive:
	case player_states.drop_in:
		jetpack = false;
		break;
	case player_states.death:
	case player_states.death_fall:
		invincible = false;
		jetpack = false;
		if (global.story_mode = story_modes.kranion)
		{
			ego_invincible = 0;
			hp = min(hp, 25);
		}
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

timer_death = 0;
	
event_inherited();
