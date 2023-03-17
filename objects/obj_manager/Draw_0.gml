/// @description 

var _zones = global.zones;
var _list_thing, _list_pos;
var _x1, _y1, _x2, _y2;
var _hashmap = global.hashmap_collision;
var _cell, _cell_x, _cell_y, _cell_x1, _cell_y1, _cell_x2, _cell_y2;

var _view_width = camera_get_view_width(view_camera[view_current]);
var _view_height = camera_get_view_height(view_camera[view_current]);
var _view_x1 = camera_get_view_x(view_camera[view_current]);
var _view_y1 = camera_get_view_y(view_camera[view_current]);
var _view_x2 = _view_x1 + _view_width;
var _view_y2 = _view_y1 + _view_height;

#region Debug
	if (global.debug)
	{
		draw_set_alpha(1);
		draw_set_halign(fa_left);
		draw_set_valign(fa_top);
		draw_set_font(global.font_16);
			
		if (global.debug_viewer[debug_viewer_types.collision_hashmap] == true)
		{
			draw_set_color(c_purple);
	
			_cell_x1 = clamp(_view_x1, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
			_cell_y1 = clamp(_view_y1, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
			_cell_x2 = clamp(_view_x2, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
			_cell_y2 = clamp(_view_y2, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
	
			_y1 = _cell_y1 * HASHMAP_BUCKET_SIZE;
			_y2 = (_cell_y2 * HASHMAP_BUCKET_SIZE) + HASHMAP_BUCKET_SIZE;
			for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
			{
				_x1 = _cell_x * HASHMAP_BUCKET_SIZE;
				draw_line(_x1, _y1, _x1, _y2);
			}
	
			_x1 = _cell_x1 * HASHMAP_BUCKET_SIZE;
			_x2 = (_cell_x2 * HASHMAP_BUCKET_SIZE) + HASHMAP_BUCKET_SIZE;
			for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
			{
				_y1 = _cell_y * HASHMAP_BUCKET_SIZE;
				draw_line(_x1, _y1, _x2, _y1);
			}
	
			for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
			{
				for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
				{
					_cell = _cell_x + (_cell_y * global.hashmap_collision_width);
			
					_x1 = _cell_x * HASHMAP_BUCKET_SIZE;
					_y1 = _cell_y * HASHMAP_BUCKET_SIZE;
					draw_text(_x1, _y1, string(array_length(_hashmap[_cell][hashmap_cell_data.hitbox])) + "\n" + string(array_length(_hashmap[_cell][hashmap_cell_data.collider])));
				}
			}
		}
		if (global.debug_viewer[debug_viewer_types.spawn_zones] == true)
		{
			draw_set_color(c_blue);

			for (_list_pos = 0; _list_pos < array_length(_zones); ++_list_pos)
			{
				if !is_array(_zones[_list_pos])
					continue;
			
				_x1 = _zones[_list_pos][zone_data.pos][0];
				_y1 = _zones[_list_pos][zone_data.pos][1];
				_x2 = _zones[_list_pos][zone_data.pos][2];
				_y2 = _zones[_list_pos][zone_data.pos][3];
		
				if rectangle_in_rectangle(_x1, _y1, _x2, _y2, _view_x1, _view_y1, _view_x2, _view_y2)
				{
					draw_text(_x1, _y1, "Zone " + string(_list_pos));
					draw_rectangle(_x1, _y1, _x2, _y2, true);
				}
			}
		}
		if (global.debug_viewer[debug_viewer_types.hitboxes] == true)
		{
			draw_set_color(c_red);
			draw_set_alpha(0.5);
			with (obj_master)
				comp_list_hitbox_draw();	
			draw_set_alpha(1);
		}
		if (global.debug_viewer[debug_viewer_types.colliders] == true)
		{
			draw_set_color(c_lime);
			with (obj_master)
				comp_list_collider_draw();
		}
	}
#endregion
