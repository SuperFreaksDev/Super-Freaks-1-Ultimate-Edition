/// @description 

var _list, _list_pos, _list_thing;
var _draw_x, _draw_y;
var _player_list = global.player_list, _player_instance, _player_water_meter;
var _bubble_index = 0;
var _view_width = camera_get_view_width(view_camera[view_current]);
var _view_height = camera_get_view_height(view_camera[view_current]);
var _view_x1 = camera_get_view_x(view_camera[view_current]);
var _view_y1 = camera_get_view_y(view_camera[view_current]);
var _view_x2 = _view_x1 + _view_width;
var _view_y2 = _view_y1 + _view_height;
var _offset = 0;

#region Draw Water
	water_draw();
#endregion

#region Draw Player Numbers
	draw_set_color(c_white);
	draw_set_alpha(1);
	_list = global.player_list;
	for (_list_pos = 0; _list_pos < array_length(_list); ++_list_pos)
	{
		_list_thing = _list[_list_pos];
			
		if (_list_thing[player_data.active] == true)
		{
			_player_instance = _list_thing[player_data.instance];
			_draw_x = lerp(_player_instance.x_start_frame, _player_instance.x, frame_delta_player_get());
			_draw_y = lerp(_player_instance.y_start_frame, _player_instance.y, frame_delta_player_get());
			draw_sprite(spr_player_numbers_arrows, _player_instance.player_number, _draw_x, _draw_y - 32);
			
			if (_player_instance.water_meter < 100 || _player_instance.underwater)
			{
				_bubble_index = 0;
				if (_player_instance.water_meter < 40 && global.animate >= 4)
					_bubble_index = 1;
				_player_water_meter = _player_instance.water_meter;
		        draw_sprite(spr_HUD_water_meter, 2, _draw_x - 48, _draw_y - 64);
		        draw_sprite_part(spr_HUD_water_meter, _bubble_index, 0, 32 - (_player_water_meter * 0.32), 32, (_player_water_meter * 0.32), _draw_x - 48, _draw_y - 32 - (_player_water_meter * 0.32));
			}
		}
	}
#endregion

#region Draw HUD
	switch (global.game_state)
	{
		case game_states.NA:
			break;
		case game_states.gameplay:
			draw_set_font(global.font_16);
			draw_set_projection_2D(_view_x1, _view_y1, screen_width_get(), screen_height_get());
			#region Draw Boss Health
				with (obj_boss)
				{
					draw_set_color(c_white);
					draw_set_halign(fa_center);
					draw_set_valign(fa_bottom);
					draw_text(_view_x1 + screen_width_get() / 2, _view_y1 + 64, string(boss_name));
					draw_set_color(c_white);
					draw_rectangle(_view_x1 + screen_width_get() / 2 - 129, _view_y1 + 71, (_view_x1 + screen_width_get() / 2) + 129, _view_y1 + 74, false);
					draw_set_color(c_black);
					draw_rectangle(_view_x1 + screen_width_get() / 2 - 128, _view_y1 + 72, (_view_x1 + screen_width_get() / 2) + 128, _view_y1 + 73, false);
					draw_set_color(c_red);
					draw_rectangle(_view_x1 + screen_width_get() / 2 - 128, _view_y1 + 72, (_view_x1 + screen_width_get() / 2) - 128 + lerp(0, 256, (hp / hp_start)), _view_y1 + 73, false);
				}
			#endregion
			#region Draw Player Info
				draw_set_halign(fa_left);
				draw_set_valign(fa_middle);
				draw_set_color(c_white);
				for (_list_pos = 0; _list_pos < array_length(_player_list); ++_list_pos)
				{
					_offset = (_list_pos * (screen_width_get() / 4));
					_list_thing = _player_list[_list_pos];
					_player_instance = _list_thing[player_data.instance];
					draw_sprite(spr_player_numbers, _list_pos, _view_x1 + 16 + _offset, _view_y1 + 16);
				
					if (_list_thing[player_data.active] == true)
					{
						draw_sprite(player_animation_get(_player_instance.character_index, player_animations.hud_face), 0, _view_x1 + 48 + _offset, _view_y1 + 16);
						if (_player_instance.rubber_band == true)
							draw_sprite_ext(spr_HUD_elastiband, _player_instance.rubber_band_color, _view_x1 + 80 + _offset, _view_y1 + 16, 1, 1, 0, c_white, 1);
						else
							draw_sprite_ext(spr_HUD_elastiband, _player_instance.rubber_band_color, _view_x1 + 80 + _offset, _view_y1 + 16, 1, 1, 0, c_white, 0.5);
					}
					else
					{
						if (_player_instance.state == player_states.drop_in)
						{
							draw_sprite_ext(spr_menu_arrow_16, 0, _view_x1 + 48 + _offset, _view_y1 + 16, 1, 1, 180, c_white, 1);
							draw_sprite_ext(spr_menu_arrow_16, 0, _view_x1 + 112 + _offset, _view_y1 + 16, 1, 1, 0, c_white, 1);
							draw_sprite(player_animation_get(_player_instance.character_index, player_animations.hud_face), 0, _view_x1 + 80 + _offset, _view_y1 + 16);
						}
						else
							draw_action(_list_pos, controls_actions.jump, _view_x1 + 48 + _offset, _view_y1 + 16);
					}
				}
			#endregion
			#region Draw Hearts
				draw_set_halign(fa_center);
				draw_set_valign(fa_middle);
			    draw_sprite(spr_HUD_heart, 0, _view_x1, _view_y1 + screen_height_get() - 32 + yorb_effect);
			    draw_sprite_part(spr_HUD_heart, 1, 0, 32 - (global.heart_meter * 0.32), 32, (global.heart_meter * 0.32), _view_x1, _view_y1 + screen_height_get() - (global.heart_meter * 0.32) + yorb_effect);
				switch (global.game_mode)
				{
					case game_modes.randomizer:
						draw_text(_view_x1 + 20, _view_y1 + screen_height_get() - 16 + yorb_effect, string(global.hearts) + "/4");
						break;
					default:
						draw_text(_view_x1 + 16, _view_y1 + screen_height_get() - 16 + yorb_effect, string(global.hearts));
						break;
				}
			#endregion
			#region Draw Trophies
				switch (global.game_mode)
				{
					case game_modes.randomizer:
					case game_modes.speedrun:
						break;
					default:
						for (_list_pos = 0; _list_pos < global.trophies_max; ++_list_pos)
						{
							draw_sprite(spr_HUD_trophy, bit_get(global.trophies, _list_pos), _view_x1 - trophy_offset, _view_y1 + screen_height_get() - 48 - (global.trophies_max * 32) + (_list_pos * 32));
						}
						break;
				}
			#endregion
			#region Draw Score/Game Timer
				draw_set_halign(fa_left);
				draw_set_valign(fa_bottom);
				switch (global.game_mode)
				{
					case game_modes.randomizer:
						draw_text(_view_x1 + 32, _view_y1 + screen_height_get(), "Level " + string(global.score));
						break;
					default:
						game_timer_draw(_view_x1 + 32, _view_y1 + screen_height_get());
				}
			#endregion
			draw_set_projection_2D(_view_x1, _view_y1, _view_width, _view_height);
			break;
	}
#endregion