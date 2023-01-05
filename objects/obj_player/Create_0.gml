/// @description Init

// Inherit the parent event
event_inherited();

player_number = 0;
character_index = 0;

#region Controls
	button_left = controls_action_states.NA;
	button_right = controls_action_states.NA;
	button_up = controls_action_states.NA;
	button_down = controls_action_states.NA;
	button_pause = controls_action_states.NA;
	button_drop_out = controls_action_states.NA;
	button_jump = controls_action_states.NA;
	button_bubble = controls_action_states.NA;
	button_rubberband = controls_action_states.NA;

	lock_controls_horizontal = 0;
	lock_controls_vertical = 0;
	lock_friction = 0;
	lock_gravity = 0;
#endregion

#region Physics
	player_physics_set_normal();

	face = 1;
	angle = 0;
	angle_ground = 0;
#endregion

#region Abilities
	ball = false;
	skid = false;
	walljump_auto = 0;
	#macro WALLJUMP_AUTO_MAX 32
	rubber_band = false;
	rubber_band_can_slingshot = false;
	underwater = false;
	water_meter = 100;
	hang_on = false;
	invincible = false;
	flashlight_radius = 72;

	ground_on = false;
	platform_jump_off = false;
	coyote_time = 0;
	#macro COYOTE_TIME_MAX 8
	jump_buffer = 0;
	#macro JUMP_BUFFER_MAX 8
	etc_buffer = 0;
#endregion

#region Collision
	hitbox = new comp_hitbox_AABB(,,hitbox_active.active,,, -8, -12, 8, 20);
	hurt_timer_set(0);
	
	collider_detector_up_set(-6, 0, 6, 0, -16);
	collider_detector_sides_set(-8, 0, 16, 0, 14);
	collider_detector_down_set(-8, 0, 8, 0, 24);
	
	behavior_ceiling = 0;
	behavior_floor = 0;
	behavior_wall = 0;
	behavior_wall_left = 0;
	behavior_wall_right = 0;
	
	crush_flags = 0;
#endregion

camera = new comp_camera();
timer_death = new comp_timer(, function()
{
	var _transition_effect;
	
	if (!players_alive())
	{
		switch (global.game_mode)
		{
			case game_modes.randomizer:
			case game_modes.boss_rush:
				if (global.hearts == 0)
				{
					if (!room_transition_active_get())
						instance_create(obj_gameover);
				}
				else
				{
					if (!room_transition_active_get())
					{
						_transition_effect = instance_create(obj_room_transition_death);
						_transition_effect.color = c_red;
						global.hearts = max(global.hearts - 1, 0);
					}
				}
				break;
			default:
				if (!room_transition_active_get())
				{
					_transition_effect = instance_create(obj_room_transition_death);
					_transition_effect.color = c_red;
				}
				break;
		}
	}
	else
		state_next_set(player_states.bubble);
});

depth = 0;
