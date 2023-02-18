/// @description 

var _start_x = 0, _start_y = 0;

physics_world_create(0);

draw_texture_flush();
view_enabled = true;
view_visible[0] = true;
camera_set_view_size(view_camera[0], screen_width_get(), screen_height_get());

global.redblueplatformswap = true;
global.redblueplatformtimer = 0;
global.lightbulb_timer = 0;

zones_fill();
hashmap_collision_create();

switch (global.game_state)
{
	case game_states.gameplay:
		input_source_mode_set(INPUT_SOURCE_MODE.JOIN);
		if (global.checkpoint[spawn_point_data.go_to_checkpoint] == true)
		{
			if (instance_exists(obj_start_pos))
			{
				_start_x = obj_start_pos.x;
				_start_y = obj_start_pos.y;
			}
			if (!is_undefined(global.checkpoint[spawn_point_data.x]))
				_start_x = global.checkpoint[spawn_point_data.x];
			if (!is_undefined(global.checkpoint[spawn_point_data.y]))
				_start_y = global.checkpoint[spawn_point_data.y];
			global.checkpoint[spawn_point_data.go_to_checkpoint] = false;
		}
		else
		{
			if (is_undefined(global.spawn_point[spawn_point_data.room]))
			{
				if (instance_exists(obj_start_pos))
				{
					spawn_point_set(room, obj_start_pos.x, obj_start_pos.y);
					checkpoint_set(room, obj_start_pos.x, obj_start_pos.y, -1);
				}
				else
				{
					spawn_point_set(room, 0, 0);
					checkpoint_set(room, 0, 0, -1);
				}
				
				_start_x = global.spawn_point[spawn_point_data.x];
				_start_y = global.spawn_point[spawn_point_data.y];
			}
			else
			{
				if (instance_exists(obj_start_pos))
				{
					_start_x = obj_start_pos.x;
					_start_y = obj_start_pos.y;
				}
				if (!is_undefined(global.spawn_point[spawn_point_data.x]))
					_start_x = global.spawn_point[spawn_point_data.x];
				if (!is_undefined(global.spawn_point[spawn_point_data.y]))
					_start_y = global.spawn_point[spawn_point_data.y];
			}
		}
		
		players_start(_start_x, _start_y);
		if (!instance_exists(obj_gameplay_manager))
			instance_create(obj_gameplay_manager);
		instance_destroy(obj_worldmap_manager);
		view_reset(_start_x, _start_y);
		with (global.view)
		{
			speed_x = 8;
			speed_y = 8;
		}
		break;
	case game_states.worldmap:
		input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
		spawn_point_set(undefined);
		checkpoint_set(undefined);
		players_end();
		if (!instance_exists(obj_worldmap_manager))
			instance_create(obj_worldmap_manager);
		instance_destroy(obj_gameplay_manager);
		with (global.view)
		{
			speed_x = 90;
			speed_y = 90;
		}
		break;
	default:
		input_source_mode_set(INPUT_SOURCE_MODE.FIXED);
		spawn_point_set(undefined);
		checkpoint_set(undefined);
		if (instance_exists(obj_start_pos))
		{
			_start_x = obj_start_pos.x;
			_start_y = obj_start_pos.y;
		}
		players_end();
		instance_destroy(obj_gameplay_manager);
		instance_destroy(obj_worldmap_manager);
		view_reset(_start_x, _start_y);
		with (global.view)
		{
			speed_x = 90;
			speed_y = 90;
		}
		break;
}

triggers_init();

game_pause_set(false);
with (obj_menu_pause)
	state_next_set(pause_menu_states.inactive);

music_resume();
gc_collect();