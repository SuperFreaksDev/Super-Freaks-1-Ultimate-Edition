enum collider_collision
{
	collider = 0,
	x,
	y,
	angle,
	behavior,
	is_tilemap,
	cell_x,
	cell_y,
}

/// @function collider_collision_global_init
function collider_collision_global_init()
{
	global.collider_collision = array_create(8, undefined);
}

/// @function collider_collision_global_clear
function collider_collision_global_clear()
{
	var _collider_collision = global.collider_collision;
	
	gml_pragma("forceinline");
	
	_collider_collision[collider_collision.collider] = undefined;
	_collider_collision[collider_collision.x] = undefined;
	_collider_collision[collider_collision.y] = undefined;
	_collider_collision[collider_collision.angle] = 0;
	_collider_collision[collider_collision.behavior] = 0;
	_collider_collision[collider_collision.is_tilemap] = false;
	_collider_collision[collider_collision.cell_x] = 0;
	_collider_collision[collider_collision.cell_y] = 0;
}

#region Collision Checks
	#region Left
		/// @function collision_left
		/// @param _x2 = x - collider_detector_sides_width_get()
		/// @param _x1 = _x2
		/// @param _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1]
		/// @param _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2]
		/// @param _y_slope = y
		/// @param _push_out_by = -collider_detector_sides_width_get()
		/// @param _attach = false
		/// @param {Boolean} _check_semi_solid = true
		/// @param {Boolean} _collide_do = true
		function collision_left(_x2 = x - collider_detector_sides_width_get(), _x1 = _x2, _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1], _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2], _y_slope = y, _push_out_by = -collider_detector_sides_width_get(), _attach = false, _check_semi_solid = true, _collide_do = true)
		{
			var _collider_collision;
			var _collision = false;
			var _tilemap, _tile_data_array;
			var _hashmap = global.hashmap_collision;
			var _hashmap_width = global.hashmap_collision_width;
			var _cell_x, _cell_y, _cell_x1, _cell_y1, _cell_x2, _cell_y2;
			var _instance, _instance_list, _instance_list_pos, _instance_x, _instance_y;
			var _comp, _comp_list, _comp_list_pos, _comp_x, _comp_y, _comp_callback;
			var _shape_x1, _shape_y1, _shape_x2, _shape_y2, _y_intercept, _slope, _behavior;
			var _new_pos;
			var _blacklist = [];
	
			collider_collision_global_clear();
			_collider_collision = global.collider_collision;
			_collider_collision[collider_collision.x] = -infinity;
	
			#region Tilemap Collisions
				_tilemap = layer_tilemap_get_id("layer_tiles_normal");
				_tile_data_array = global.tile_data_array_level;
	
				if (_y1_flat != _y_slope || _y2_flat != _y_slope)
				{
					if (collision_tile_flat_left(_x1, _x2, _y1_flat, _y2_flat, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
					if (collision_tile_slope_left(_x1, _x2, _y_slope, true, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
				}
				else
				{
					if (collision_tile_slope_left(_x1, _x2, _y_slope, false, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
				}
			#endregion
	
			#region Collider Collisions
				_cell_x1 = clamp(_x1, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y1 = clamp(_y1_flat, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
				_cell_x2 = clamp(_x2, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y2 = clamp(_y2_flat, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
		
				for (_cell_x = _cell_x2; _cell_x >= _cell_x1; --_cell_x)
				{
					for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
					{
						_instance_list = _hashmap[_cell_x + (_cell_y * _hashmap_width)][hashmap_cell_data.collider];
			
						for (_instance_list_pos = 0; _instance_list_pos < array_length(_instance_list); ++_instance_list_pos)
						{
							_instance = _instance_list[_instance_list_pos];
				
							if (!instance_exists(_instance) || _instance == id || array_contains(_blacklist, _instance))
								continue;
				
							array_push(_blacklist, _instance);
							with (_instance)
							{
								_comp_list = comp_list_collider;
								_instance_x = x;
								_instance_y = y;
					
								for (_comp_list_pos = 0; _comp_list_pos < array_length(_comp_list); ++_comp_list_pos)
								{
									_comp = _comp_list[_comp_list_pos];
						
									if (!weak_ref_alive(_comp))
										continue;
							
									_comp = _comp.ref;
									
									switch (_comp.solid_x2)
									{
										case collider_solidity.solid:
											break;
										case collider_solidity.semi_solid:
											if (!_check_semi_solid)
												continue;
											break;
										default:
											continue;
											break;
									}
						
									with (_comp)
									{
										_comp_x = _instance_x + x_offset;
										_comp_y = _instance_y + y_offset;
										_behavior = behavior[2];
										switch (instanceof(_comp))
										{
											case "comp_collider_AABB":
												_shape_x1 = _comp_x + shape_x1;
												_shape_y1 = _comp_y + shape_y1;
												_shape_x2 = _comp_x + shape_x2;
												_shape_y2 = _comp_y + shape_y2;
												if (rectangle_in_rectangle(_x1, _y1_flat, _x2, _y2_flat, _shape_x2 - 16, _shape_y1, _shape_x2, _shape_y2))
												{
													if (_collider_collision[collider_collision.x] <= _shape_x2)
													{
														_collision = true;
														_collider_collision[collider_collision.collider] = self;
														_collider_collision[collider_collision.x] = _shape_x2;
														_collider_collision[collider_collision.y] = _y1_flat;
														_collider_collision[collider_collision.angle] = 270;
														_collider_collision[collider_collision.behavior] = _behavior;
														_collider_collision[collider_collision.is_tilemap] = false;
													}
												}
												break;
											case "comp_collider_line":
												switch (sign(shape_y1 - shape_y2))
												{
													case -1: //Normal
														_shape_x1 = _comp_x + shape_x1;
														_shape_y1 = _comp_y + shape_y1;
														_shape_x2 = _comp_x + shape_x2;
														_shape_y2 = _comp_y + shape_y2;
														break;
													case 0: //Completely Vertical
														continue;
														break;
													case 1: //Inverted
														_shape_x1 = _comp_x + shape_x2;
														_shape_y1 = _comp_y + shape_y2;
														_shape_x2 = _comp_x + shape_x1;
														_shape_y2 = _comp_y + shape_y1;
														break;
												}
												
												if (_y_slope != clamp(_y_slope, _shape_y1, _shape_y2))
													continue;
												
												if (_shape_x1 == _shape_x2)
													_new_pos = _shape_x2;
												else
												{
													_slope = (_shape_y2 - _shape_y1) / (_shape_x2 - _shape_x1);
													_y_intercept = _shape_y1 - _slope * _shape_x1;
													_new_pos = (_y_slope - _y_intercept) / _slope;
												}
										
												if (_new_pos >= _collider_collision[collider_collision.x] && rectangle_in_rectangle(_x1, 0, _x2, 0, _new_pos - 16, 0, _new_pos, 0))
												{
													_collision = true;
													_collider_collision[collider_collision.collider] = self;
													_collider_collision[collider_collision.x] = _new_pos;
													_collider_collision[collider_collision.y] = _y_slope;
													_collider_collision[collider_collision.angle] = angle;
													_collider_collision[collider_collision.behavior] = _behavior;
													_collider_collision[collider_collision.is_tilemap] = false;
												}
												break;
											case "comp_collider_circle":
												break;
										}
									}
								}
							}
						}
					}
				}
			#endregion
	
			if (_collision && _collide_do)
			{
				x = _collider_collision[collider_collision.x] - _push_out_by;
				collision_flag_set_left();
		
				if (_collider_collision[collider_collision.collider] != undefined)
				{
					//do callback
					_comp_callback = method(self, _collider_collision[collider_collision.collider].callback[2]);
					_comp_callback();
				}
		
				if (_attach && _collider_collision[collider_collision.collider] != undefined)
					collider_attach_set(_collider_collision[collider_collision.collider], _collider_collision[collider_collision.x], _collider_collision[collider_collision.y]);
				else
					collider_attach_clear();
			}
	
			return _collision;
		}

		/// @function collision_left_simple
		/// @param _x = x - collider_detector_sides_width_get()
		/// @param _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1]
		/// @param _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2]
		/// @param _y_slope = y
		/// @param _extend = 0
		/// @param _push_out_by = -collider_detector_sides_width_get()
		/// @param _attach = false
		/// @param {Boolean} _check_semi_solid = true
		/// @param {Boolean} _collide_do = true
		/// @description An easier to use collision method that extends leftward by a certain amount. This is useful for simple wall collision checks!
		function collision_left_simple(_x = x - collider_detector_sides_width_get(), _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1], _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2], _y_slope = y, _extend = 0, _push_out_by = -collider_detector_sides_width_get(), _attach = false, _check_semi_solid = true, _collide_do = true)
		{
			return collision_left(_x, _x - _extend, _y1_flat, _y2_flat, _y_slope, _push_out_by, _attach, _check_semi_solid, _collide_do);
			
			gml_pragma("forceinline");
		}

		/// @function collision_exists_left
		/// @param _x2 = x - collider_detector_sides_width_get()
		/// @param _x1 = _x2
		/// @param _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1]
		/// @param _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2]
		/// @param _y_slope = y
		/// @param {Boolean} _check_semi_solid = true
		function collision_exists_left(_x2 = x - collider_detector_sides_width_get(), _x1 = _x2, _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1], _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2], _y_slope = y, _check_semi_solid = true)
		{
			var _tilemap, _tile_data_array;
			var _hashmap = global.hashmap_collision;
			var _hashmap_width = global.hashmap_collision_width;
			var _cell_x, _cell_y, _cell_x1, _cell_y1, _cell_x2, _cell_y2;
			var _instance, _instance_list, _instance_list_pos, _instance_x, _instance_y;
			var _comp, _comp_list, _comp_list_pos, _comp_x, _comp_y;
			var _shape_x1, _shape_y1, _shape_x2, _shape_y2, _y_intercept, _slope;
			var _new_pos;
			var _blacklist = [];
	
			collider_collision_global_clear();
			global.collider_collision[collider_collision.x] = -infinity;
	
			#region Tilemap Collisions
				_tilemap = layer_tilemap_get_id("layer_tiles_normal");
				_tile_data_array = global.tile_data_array_level;
	
				if (_y1_flat != _y_slope || _y2_flat != _y_slope)
				{
					if (collision_tile_flat_left(_x1, _x2, _y1_flat, _y2_flat, true, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
					if (collision_tile_slope_left(_x1, _x2, _y_slope, true, true, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
				}
				else
				{
					if (collision_tile_slope_left(_x1, _x2, _y_slope, false, true, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
				}
			#endregion
	
			#region Collider Collisions
				_cell_x1 = clamp(_x1, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y1 = clamp(_y1_flat, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
				_cell_x2 = clamp(_x2, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y2 = clamp(_y2_flat, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
		
				for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
				{
					for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
					{
						_instance_list = _hashmap[_cell_x + (_cell_y * _hashmap_width)][hashmap_cell_data.collider];
			
						for (_instance_list_pos = 0; _instance_list_pos < array_length(_instance_list); ++_instance_list_pos)
						{
							_instance = _instance_list[_instance_list_pos];
				
							if (!instance_exists(_instance) || _instance == id || array_contains(_blacklist, _instance))
								continue;
				
							array_push(_blacklist, _instance);
							with (_instance)
							{
								_comp_list = comp_list_collider;
								_instance_x = x;
								_instance_y = y;
					
								for (_comp_list_pos = 0; _comp_list_pos < array_length(_comp_list); ++_comp_list_pos)
								{
									_comp = _comp_list[_comp_list_pos];
						
									if (!weak_ref_alive(_comp))
										continue;
							
									_comp = _comp.ref;
									
									switch (_comp.solid_x2)
									{
										case collider_solidity.solid:
											break;
										case collider_solidity.semi_solid:
											if (!_check_semi_solid)
												continue;
											break;
										default:
											continue;
											break;
									}
						
									with (_comp)
									{
										_comp_x = _instance_x + x_offset;
										_comp_y = _instance_y + y_offset;
										switch (instanceof(_comp))
										{
											case "comp_collider_AABB":
												_shape_x1 = _comp_x + shape_x1;
												_shape_y1 = _comp_y + shape_y1;
												_shape_x2 = _comp_x + shape_x2;
												_shape_y2 = _comp_y + shape_y2;
												if (rectangle_in_rectangle(_x1, _y1_flat, _x2, _y2_flat, _shape_x2 - 16, _shape_y1, _shape_x2, _shape_y2))
													return true;
												break;
											case "comp_collider_line":
												switch (sign(shape_y1 - shape_y2))
												{
													case -1: //Normal
														_shape_x1 = _comp_x + shape_x1;
														_shape_y1 = _comp_y + shape_y1;
														_shape_x2 = _comp_x + shape_x2;
														_shape_y2 = _comp_y + shape_y2;
														break;
													case 0: //Completely Vertical
														continue;
														break;
													case 1: //Inverted
														_shape_x1 = _comp_x + shape_x2;
														_shape_y1 = _comp_y + shape_y2;
														_shape_x2 = _comp_x + shape_x1;
														_shape_y2 = _comp_y + shape_y1;
														break;
												}
												
												if (_y_slope != clamp(_y_slope, _shape_y1, _shape_y2))
													continue;
												
												if (_shape_x1 == _shape_x2)
													_new_pos = _shape_x1;
												else
												{
													_slope = (_shape_y2 - _shape_y1) / (_shape_x2 - _shape_x1);
													_y_intercept = _shape_y1 - _slope * _shape_x1;
													_new_pos = (_y_slope - _y_intercept) / _slope;
												}
												
												if (rectangle_in_rectangle(_x1, _y_slope, _x2, _y_slope, _new_pos - 16, _shape_y1, _new_pos, _shape_x2))
													return true;
												break;
											case "comp_collider_circle":
												break;
										}
									}
								}
							}
						}
					}
				}
			#endregion
	
			return false;
		}
	
		/// @function collision_exists_left_simple
		/// @param _x = x - collider_detector_sides_width_get()
		/// @param _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1]
		/// @param _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2]
		/// @param _y_slope = y
		/// @param _extend = 0
		/// @param {Boolean} _check_semi_solid = true
		/// @description An easier to use collision method that extends rightward by a certain amount. This is useful for simple wall collision checks!
		function collision_exists_left_simple(_x = x - collider_detector_sides_width_get(), _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1], _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2], _y_slope = y, _extend = 0, _check_semi_solid = true)
		{
			return collision_exists_left(_x - _extend, _x, _y1_flat, _y2_flat, _y_slope, _check_semi_solid);
			
			gml_pragma("forceinline");
		}
	#endregion

	#region Up
		/// @function collision_up
		/// @param _x1_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x1]
		/// @param _x2_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x2]
		/// @param _x_slope = x
		/// @param _y2 = y + collider_detector_up_y_get()
		/// @param _y1 = _y2
		/// @param _push_out_by = collider_detector_up_y_get()
		/// @param _attach = false
		/// @param {Boolean} _check_semi_solid = true
		/// @param {Boolean} _collide_do = true
		function collision_up(_x1_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x1], _x2_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x2], _x_slope = x, _y2 = y + collider_detector_up_y_get(), _y1 = _y2, _push_out_by = collider_detector_up_y_get(), _attach = false, _check_semi_solid = true, _collide_do = true)
		{
			var _collider_collision;
			var _collision = false;
			var _tilemap, _tile_data_array;
			var _hashmap = global.hashmap_collision;
			var _hashmap_width = global.hashmap_collision_width;
			var _cell_x, _cell_y, _cell_x1, _cell_y1, _cell_x2, _cell_y2;
			var _instance, _instance_list, _instance_list_pos, _instance_x, _instance_y;
			var _comp, _comp_list, _comp_list_pos, _comp_x, _comp_y, _comp_callback;
			var _shape_x1, _shape_y1, _shape_x2, _shape_y2, _y_intercept, _slope, _behavior;
			var _new_pos;
			var _blacklist = [];
	
			collider_collision_global_clear();
			_collider_collision = global.collider_collision;
			_collider_collision[collider_collision.y] = -infinity;
	
			#region Tilemap Collisions
				_tilemap = layer_tilemap_get_id("layer_tiles_normal");
				_tile_data_array = global.tile_data_array_level;
	
				if (_x1_flat != _x_slope || _x2_flat != _x_slope)
				{
					if (collision_tile_flat_up(_x1_flat, _x2_flat, _y1, _y2, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
					if (collision_tile_slope_up(_x_slope, _y1, _y2, true, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
				}
				else
				{
					if (collision_tile_slope_up(_x_slope, _y1, _y2, false, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
				}
			#endregion
	
			#region Collider Collisions
				_cell_x1 = clamp(_x1_flat, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y1 = clamp(min(_y1, _collider_collision[collider_collision.y]), 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
				_cell_x2 = clamp(_x2_flat, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y2 = clamp(max(_y2, _collider_collision[collider_collision.y]), 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
		
				for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
				{
					for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
					{
						_instance_list = _hashmap[_cell_x + (_cell_y * _hashmap_width)][hashmap_cell_data.collider];
			
						for (_instance_list_pos = 0; _instance_list_pos < array_length(_instance_list); ++_instance_list_pos)
						{
							_instance = _instance_list[_instance_list_pos];
				
							if (!instance_exists(_instance) || _instance == id || array_contains(_blacklist, _instance))
								continue;
				
							array_push(_blacklist, _instance);
							with (_instance)
							{
								_comp_list = comp_list_collider;
								_instance_x = x;
								_instance_y = y;
					
								for (_comp_list_pos = 0; _comp_list_pos < array_length(_comp_list); ++_comp_list_pos)
								{
									_comp = _comp_list[_comp_list_pos];
						
									if (!weak_ref_alive(_comp))
										continue;
							
									_comp = _comp.ref;
									
									switch (_comp.solid_y2)
									{
										case collider_solidity.solid:
											break;
										case collider_solidity.semi_solid:
											if (!_check_semi_solid)
												continue;
											break;
										default:
											continue;
											break;
									}
						
									with (_comp)
									{
										_comp_x = _instance_x + x_offset;
										_comp_y = _instance_y + y_offset;
										_behavior = behavior[3];
										switch (instanceof(_comp))
										{
											case "comp_collider_AABB":
												_shape_x1 = _comp_x + shape_x1;
												_shape_y1 = _comp_y + shape_y1;
												_shape_x2 = _comp_x + shape_x2;
												_shape_y2 = _comp_y + shape_y2;
												if (rectangle_in_rectangle(_x1_flat, _y1, _x2_flat, _y2, _shape_x1, _shape_y2 - 16, _shape_x2, _shape_y2))
												{
													if (_collider_collision[collider_collision.y] <= _shape_y2)
													{
														_collision = true;
														_collider_collision[collider_collision.collider] = self;
														_collider_collision[collider_collision.x] = _x1_flat;
														_collider_collision[collider_collision.y] = _shape_y2;
														_collider_collision[collider_collision.angle] = 0;
														_collider_collision[collider_collision.behavior] = _behavior;
														_collider_collision[collider_collision.is_tilemap] = false;
													}
												}
												break;
											case "comp_collider_line":
												switch (sign(shape_x1 - shape_x2))
												{
													case -1: //Normal
														_shape_x1 = _comp_x + shape_x1;
														_shape_y1 = _comp_y + shape_y1;
														_shape_x2 = _comp_x + shape_x2;
														_shape_y2 = _comp_y + shape_y2;
														break;
													case 0: //Completely Vertical
														continue;
														break;
													case 1: //Inverted
														_shape_x1 = _comp_x + shape_x2;
														_shape_y1 = _comp_y + shape_y2;
														_shape_x2 = _comp_x + shape_x1;
														_shape_y2 = _comp_y + shape_y1;
														break;
												}
												
												if (_shape_x1 == _shape_x2)
													continue;
										
												if (_x_slope != clamp(_x_slope, _shape_x1, _shape_x2))
													continue;
											
												_slope = (_shape_y2 - _shape_y1) / (_shape_x2 - _shape_x1);
												_y_intercept = _shape_y1 - _slope * _shape_x1;
												_new_pos = (_slope * _x_slope) + _y_intercept;
										
												if (_new_pos >= _collider_collision[collider_collision.y] && rectangle_in_rectangle(0, _y1, 0, _y2, 0, _new_pos - 16, 0, _new_pos))
												{
													_collision = true;
													_collider_collision[collider_collision.collider] = self;
													_collider_collision[collider_collision.x] = _x_slope;
													_collider_collision[collider_collision.y] = _new_pos;
													_collider_collision[collider_collision.angle] = angle;
													_collider_collision[collider_collision.behavior] = _behavior;
													_collider_collision[collider_collision.is_tilemap] = false;
												}
												break;
											case "comp_collider_circle":
												break;
										}
									}
								}
							}
						}
					}
				}
			#endregion
	
			if (_collision && _collide_do)
			{
				y = _collider_collision[collider_collision.y] - _push_out_by;
				collision_flag_set_up();
		
				if (_collider_collision[collider_collision.collider] != undefined)
				{
					//do callback
					_comp_callback = method(self, _collider_collision[collider_collision.collider].callback[3]);
					_comp_callback();
				}
		
				if (_attach && _collider_collision[collider_collision.collider] != undefined)
					collider_attach_set(_collider_collision[collider_collision.collider], _collider_collision[collider_collision.x], _collider_collision[collider_collision.y]);
				else
					collider_attach_clear();
			}
	
			return _collision;
		}
		
		/// @function collision_up_simple
		/// @param _x1_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x1]
		/// @param _x2_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x2]
		/// @param _x_slope = x
		/// @param _y = y + collider_detector_up_y_get()
		/// @param _extend = 0
		/// @param _push_out_by = collider_detector_up_y_get()
		/// @param _attach = false
		/// @param {Boolean} _check_semi_solid = true
		/// @param {Boolean} _collide_do = true
		/// @description An easier to use collision method that extends upward by a certain amount. This is useful for simple ground collision checks!
		function collision_up_simple(_x1_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x1], _x2_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x2], _x_slope = x, _y = y + collider_detector_up_y_get(), _extend = 0, _push_out_by = collider_detector_up_y_get(), _attach = false, _check_semi_solid = true, _collide_do = true)
		{
			return collision_up(_x1_flat, _x2_flat, _x_slope, _y, _y - _extend, _push_out_by, _attach, _check_semi_solid, _collide_do);
			
			gml_pragma("forceinline");
		}

		/// @function collision_exists_up
		/// @param _x1_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x1]
		/// @param _x2_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x2]
		/// @param _x_slope = x
		/// @param _y2 = y + collider_detector_up_y_get()
		/// @param _y1 = _y2
		/// @param {Boolean} _check_semi_solid = true
		function collision_exists_up(_x1_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x1], _x2_flat = x + collider_detector_up[collider_detector_vertical_data.flat_x2], _x_slope = x, _y2 = y + collider_detector_up_y_get(), _y1 = _y2, _check_semi_solid = true)
		{
			var _tilemap, _tile_data_array;
			var _hashmap = global.hashmap_collision;
			var _hashmap_width = global.hashmap_collision_width;
			var _cell_x, _cell_y, _cell_x1, _cell_y1, _cell_x2, _cell_y2;
			var _instance, _instance_list, _instance_list_pos, _instance_x, _instance_y;
			var _comp, _comp_list, _comp_list_pos, _comp_x, _comp_y;
			var _shape_x1, _shape_y1, _shape_x2, _shape_y2, _y_intercept, _slope;
			var _new_pos;
			var _blacklist = [];
	
			collider_collision_global_clear();
			global.collider_collision[collider_collision.y] = _y1;
	
			_x1_flat = clamp(_x1_flat, 0, room_width - 1);
			_x2_flat = clamp(_x2_flat, 0, room_width - 1);
			_x_slope = clamp(_x_slope, 0, room_width - 1);
	
			#region Tilemap Collisions
				_tilemap = layer_tilemap_get_id("layer_tiles_normal");
				_tile_data_array = global.tile_data_array_level;
			
				if (_x1_flat != _x_slope || _x2_flat != _x_slope)
				{
					if (collision_tile_flat_up(_x1_flat, _x2_flat, _y1, _y2, false, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
					if (collision_tile_slope_up(_x_slope, _y1, _y2, true, false, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
				}
				else
				{
					if (collision_tile_slope_up(_x_slope, _y1, _y2, false, false, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
				}
			#endregion
	
			#region Collider Collisions
				_cell_x1 = clamp(_x1_flat, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y1 = clamp(_y1, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
				_cell_x2 = clamp(_x2_flat, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y2 = clamp(_y2, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
		
				for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
				{
					for (_cell_y = _cell_y2; _cell_y >= _cell_y1; --_cell_y)
					{
						_instance_list = _hashmap[_cell_x + (_cell_y * _hashmap_width)][hashmap_cell_data.collider];
			
						for (_instance_list_pos = 0; _instance_list_pos < array_length(_instance_list); ++_instance_list_pos)
						{
							_instance = _instance_list[_instance_list_pos];
				
							if (!instance_exists(_instance) || _instance == id || array_contains(_blacklist, _instance))
								continue;
				
							array_push(_blacklist, _instance);
							with (_instance)
							{
								_comp_list = comp_list_collider;
								_instance_x = x;
								_instance_y = y;
					
								for (_comp_list_pos = 0; _comp_list_pos < array_length(_comp_list); ++_comp_list_pos)
								{
									_comp = _comp_list[_comp_list_pos];
						
									if (!weak_ref_alive(_comp))
										continue;
							
									_comp = _comp.ref;
									
									switch (_comp.solid_y2)
									{
										case collider_solidity.solid:
											break;
										case collider_solidity.semi_solid:
											if (!_check_semi_solid)
												continue;
											break;
										default:
											continue;
											break;
									}
						
									with (_comp)
									{
										_comp_x = _instance_x + x_offset;
										_comp_y = _instance_y + y_offset;
										switch (instanceof(_comp))
										{
											case "comp_collider_AABB":
												_shape_x1 = _comp_x + shape_x1;
												_shape_y1 = _comp_y + shape_y1;
												_shape_x2 = _comp_x + shape_x2;
												_shape_y2 = _comp_y + shape_y2;
												if (rectangle_in_rectangle(_x1_flat, _y1, _x2_flat, _y2, _shape_x1, _shape_y2 - 16, _shape_x2, _shape_y2))
													return true;
												break;
											case "comp_collider_line":
												switch (sign(shape_x1 - shape_x2))
												{
													case -1: //Normal
														_shape_x1 = _comp_x + shape_x1;
														_shape_y1 = _comp_y + shape_y1;
														_shape_x2 = _comp_x + shape_x2;
														_shape_y2 = _comp_y + shape_y2;
														break;
													case 0: //Completely Vertical
														continue;
														break;
													case 1: //Inverted
														_shape_x1 = _comp_x + shape_x2;
														_shape_y1 = _comp_y + shape_y2;
														_shape_x2 = _comp_x + shape_x1;
														_shape_y2 = _comp_y + shape_y1;
														break;
												}
												
												if (_shape_x1 == _shape_x2)
													continue;
												
												_slope = (_shape_y2 - _shape_y1) / (_shape_x2 - _shape_x1);
												_y_intercept = _shape_y1 - _slope * _shape_x1;
												_new_pos = (_slope * _x_slope) + _y_intercept;
										
												if (rectangle_in_rectangle(_x_slope, _y1, _x_slope, _y2, _shape_x1, _new_pos - 16, _shape_x2, _new_pos))
													return true;
												break;
											case "comp_collider_circle":
												break;
										}
									}
								}
							}
						}
					}
				}
			#endregion
	
			return false;
		}
	
		/// @function collision_exists_up_simple
		/// @param _x1_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x1]
		/// @param _x2_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x2]
		/// @param _x_slope = x
		/// @param _y = y + collider_detector_up_y_get()
		/// @param _extend = 0
		/// @param {Boolean} _check_semi_solid = true
		/// @description An easier to use collision method that extends downward by a certain amount. This is useful for simple ground collision checks!
		function collision_exists_up_simple(_x1_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x1], _x2_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x2], _x_slope = x, _y = y + collider_detector_up_y_get(), _extend = 0, _check_semi_solid = true)
		{
			return collision_exists_up(_x1_flat, _x2_flat, _x_slope, _y - _extend, _y, _check_semi_solid);
			
			gml_pragma("forceinline");
		}
	#endregion
	
	#region Right
		/// @function collision_right
		/// @param _x1 = x + collider_detector_sides_width_get()
		/// @param _x2 = _x1
		/// @param _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1]
		/// @param _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2]
		/// @param _y_slope = y
		/// @param _push_out_by = collider_detector_sides_width_get()
		/// @param _attach = false
		/// @param {Boolean} _check_semi_solid = true
		/// @param {Boolean} _collide_do = true
		function collision_right(_x1 = x + collider_detector_sides_width_get(), _x2 = _x1, _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1], _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2], _y_slope = y, _push_out_by = collider_detector_sides_width_get(), _attach = false, _check_semi_solid = true, _collide_do = true)
		{
			var _collider_collision;
			var _collision = false;
			var _tilemap, _tile_data_array;
			var _hashmap = global.hashmap_collision;
			var _hashmap_width = global.hashmap_collision_width;
			var _cell_x, _cell_y, _cell_x1, _cell_y1, _cell_x2, _cell_y2;
			var _instance, _instance_list, _instance_list_pos, _instance_x, _instance_y;
			var _comp, _comp_list, _comp_list_pos, _comp_x, _comp_y, _comp_callback;
			var _shape_x1, _shape_y1, _shape_x2, _shape_y2, _y_intercept, _slope, _behavior;
			var _new_pos;
			var _blacklist = [];
	
			collider_collision_global_clear();
			_collider_collision = global.collider_collision;
			_collider_collision[collider_collision.x] = infinity;
	
			#region Tilemap Collisions
				_tilemap = layer_tilemap_get_id("layer_tiles_normal");
				_tile_data_array = global.tile_data_array_level;
	
				if (_y1_flat != _y_slope || _y2_flat != _y_slope)
				{
					if (collision_tile_flat_right(_x1, _x2, _y1_flat, _y2_flat, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
					if (collision_tile_slope_right(_x1, _x2, _y_slope, true, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
				}
				else
				{
					if (collision_tile_slope_right(_x1, _x2, _y_slope, false, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
				}
			#endregion
	
			#region Collider Collisions
				_cell_x1 = clamp(min(_x1, _collider_collision[collider_collision.x]), 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y1 = clamp(_y1_flat, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
				_cell_x2 = clamp(max(_x2, _collider_collision[collider_collision.x]), 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y2 = clamp(_y2_flat, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
		
				for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
				{
					for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
					{
						_instance_list = _hashmap[_cell_x + (_cell_y * _hashmap_width)][hashmap_cell_data.collider];
			
						for (_instance_list_pos = 0; _instance_list_pos < array_length(_instance_list); ++_instance_list_pos)
						{
							_instance = _instance_list[_instance_list_pos];
				
							if (!instance_exists(_instance) || _instance == id || array_contains(_blacklist, _instance))
								continue;
				
							array_push(_blacklist, _instance);
							with (_instance)
							{
								_comp_list = comp_list_collider;
								_instance_x = x;
								_instance_y = y;
					
								for (_comp_list_pos = 0; _comp_list_pos < array_length(_comp_list); ++_comp_list_pos)
								{
									_comp = _comp_list[_comp_list_pos];
						
									if (!weak_ref_alive(_comp))
										continue;
							
									_comp = _comp.ref;
									
									switch (_comp.solid_x1)
									{
										case collider_solidity.solid:
											break;
										case collider_solidity.semi_solid:
											if (!_check_semi_solid)
												continue;
											break;
										default:
											continue;
											break;
									}
						
									with (_comp)
									{
										_comp_x = _instance_x + x_offset;
										_comp_y = _instance_y + y_offset;
										_behavior = behavior[0];
										switch (instanceof(_comp))
										{
											case "comp_collider_AABB":
												_shape_x1 = _comp_x + shape_x1;
												_shape_y1 = _comp_y + shape_y1;
												_shape_x2 = _comp_x + shape_x2;
												_shape_y2 = _comp_y + shape_y2;
												if (rectangle_in_rectangle(_x1, _y1_flat, _x2, _y2_flat, _shape_x1, _shape_y1, _shape_x1 + 16, _shape_y2))
												{
													if (_collider_collision[collider_collision.x] >= _shape_x1)
													{
														_collision = true;
														_collider_collision[collider_collision.collider] = self;
														_collider_collision[collider_collision.x] = _shape_x1;
														_collider_collision[collider_collision.y] = _y1_flat;
														_collider_collision[collider_collision.angle] = 90;
														_collider_collision[collider_collision.behavior] = _behavior;
														_collider_collision[collider_collision.is_tilemap] = false;
													}
												}
												break;
											case "comp_collider_line":
												switch (sign(shape_y1 - shape_y2))
												{
													case -1: //Normal
														_shape_x1 = _comp_x + shape_x1;
														_shape_y1 = _comp_y + shape_y1;
														_shape_x2 = _comp_x + shape_x2;
														_shape_y2 = _comp_y + shape_y2;
														break;
													case 0: //Completely Vertical
														continue;
														break;
													case 1: //Inverted
														_shape_x1 = _comp_x + shape_x2;
														_shape_y1 = _comp_y + shape_y2;
														_shape_x2 = _comp_x + shape_x1;
														_shape_y2 = _comp_y + shape_y1;
														break;
												}
												
												if (_y_slope != clamp(_y_slope, _shape_y1, _shape_y2))
													continue;
												
												if (_shape_x1 == _shape_x2)
													_new_pos = _shape_x1;
												else
												{
													_slope = (_shape_y2 - _shape_y1) / (_shape_x2 - _shape_x1);
													_y_intercept = _shape_y1 - _slope * _shape_x1;
													_new_pos = (_y_slope - _y_intercept) / _slope;
												}
										
												if (_new_pos <= _collider_collision[collider_collision.x] && rectangle_in_rectangle(_x1, 0, _x2, 0, _new_pos, 0, _new_pos + 16, 0))
												{
													_collision = true;
													_collider_collision[collider_collision.collider] = self;
													_collider_collision[collider_collision.x] = _new_pos;
													_collider_collision[collider_collision.y] = _y_slope;
													_collider_collision[collider_collision.angle] = angle;
													_collider_collision[collider_collision.behavior] = _behavior;
													_collider_collision[collider_collision.is_tilemap] = false;
												}
												break;
											case "comp_collider_circle":
												break;
										}
									}
								}
							}
						}
					}
				}
			#endregion
	
			if (_collision && _collide_do)
			{
				x = _collider_collision[collider_collision.x] - _push_out_by;
				collision_flag_set_right();
		
				if (!is_undefined(_collider_collision[collider_collision.collider]))
				{
					//do callback
					_comp_callback = method(self, _collider_collision[collider_collision.collider].callback[0]);
					_comp_callback();
				}
		
				if (_attach && !is_undefined(_collider_collision[collider_collision.collider]))
					collider_attach_set(_collider_collision[collider_collision.collider], _collider_collision[collider_collision.x], _collider_collision[collider_collision.y]);
				else
					collider_attach_clear();
			}
	
			return _collision;
		}
		
		/// @function collision_right_simple
		/// @param _x = x + collider_detector_sides_width_get()
		/// @param _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1]
		/// @param _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2]
		/// @param _y_slope = y
		/// @param _extend = 0
		/// @param _push_out_by = collider_detector_down_y_get()
		/// @param _attach = false
		/// @param {Boolean} _check_semi_solid = true
		/// @param {Boolean} _collide_do = true
		/// @description An easier to use collision method that extends rightward by a certain amount. This is useful for simple wall collision checks!
		function collision_right_simple(_x = x + collider_detector_sides_width_get(), _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1], _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2], _y_slope = y, _extend = 0, _push_out_by = collider_detector_sides_width_get(), _attach = false, _check_semi_solid = true, _collide_do = true)
		{
			return collision_right(_x, _x + _extend, _y1_flat, _y2_flat, _y_slope, _push_out_by, _attach, _check_semi_solid, _collide_do);
			
			gml_pragma("forceinline");
		}

		/// @function collision_exists_right
		/// @param _x1 = x + collider_detector_sides_width_get()
		/// @param _x2 = _x1
		/// @param _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1]
		/// @param _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2]
		/// @param _y_slope = y
		/// @param {Boolean} _check_semi_solid = true
		function collision_exists_right(_x1 = x + collider_detector_sides_width_get(), _x2 = _x1, _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1], _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2], _y_slope = y, _check_semi_solid = true)
		{
			var _tilemap, _tile_data_array;
			var _hashmap = global.hashmap_collision;
			var _hashmap_width = global.hashmap_collision_width;
			var _cell_x, _cell_y, _cell_x1, _cell_y1, _cell_x2, _cell_y2;
			var _instance, _instance_list, _instance_list_pos, _instance_x, _instance_y;
			var _comp, _comp_list, _comp_list_pos, _comp_x, _comp_y;
			var _shape_x1, _shape_y1, _shape_x2, _shape_y2, _y_intercept, _slope;
			var _new_pos;
			var _blacklist = [];
	
			collider_collision_global_clear();
			global.collider_collision[collider_collision.x] = infinity;
	
			#region Tilemap Collisions
				_tilemap = layer_tilemap_get_id("layer_tiles_normal");
				_tile_data_array = global.tile_data_array_level;
	
				if (_y1_flat != _y_slope || _y2_flat != _y_slope)
				{
					if (collision_tile_flat_right(_x1, _x2, _y1_flat, _y2_flat, false, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
					if (collision_tile_slope_right(_x1, _x2, _y_slope, true, false, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
				}
				else
				{
					if (collision_tile_slope_right(_x1, _x2, _y_slope, false, false, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
				}
			#endregion
	
			#region Collider Collisions
				_cell_x1 = clamp(_x1, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y1 = clamp(_y1_flat, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
				_cell_x2 = clamp(_x2, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y2 = clamp(_y2_flat, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
		
				for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
				{
					for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
					{
						_instance_list = _hashmap[_cell_x + (_cell_y * _hashmap_width)][hashmap_cell_data.collider];
			
						for (_instance_list_pos = 0; _instance_list_pos < array_length(_instance_list); ++_instance_list_pos)
						{
							_instance = _instance_list[_instance_list_pos];
				
							if (!instance_exists(_instance) || _instance == id || array_contains(_blacklist, _instance))
								continue;
				
							array_push(_blacklist, _instance);
							with (_instance)
							{
								_comp_list = comp_list_collider;
								_instance_x = x;
								_instance_y = y;
					
								for (_comp_list_pos = 0; _comp_list_pos < array_length(_comp_list); ++_comp_list_pos)
								{
									_comp = _comp_list[_comp_list_pos];
						
									if (!weak_ref_alive(_comp))
										continue;
							
									_comp = _comp.ref;
									
									switch (_comp.solid_x1)
									{
										case collider_solidity.solid:
											break;
										case collider_solidity.semi_solid:
											if (!_check_semi_solid)
												continue;
											break;
										default:
											continue;
											break;
									}
						
									with (_comp)
									{
										_comp_x = _instance_x + x_offset;
										_comp_y = _instance_y + y_offset;
										switch (instanceof(_comp))
										{
											case "comp_collider_AABB":
												_shape_x1 = _comp_x + shape_x1;
												_shape_y1 = _comp_y + shape_y1;
												_shape_x2 = _comp_x + shape_x2;
												_shape_y2 = _comp_y + shape_y2;
												if (rectangle_in_rectangle(_x1, _y1_flat, _x2, _y2_flat, _shape_x1, _shape_y1, _shape_x1 + 16, _shape_y2))
													return true;
												break;
											case "comp_collider_line":
												switch (sign(shape_y1 - shape_y2))
												{
													case -1: //Normal
														_shape_x1 = _comp_x + shape_x1;
														_shape_y1 = _comp_y + shape_y1;
														_shape_x2 = _comp_x + shape_x2;
														_shape_y2 = _comp_y + shape_y2;
														break;
													case 0: //Completely Vertical
														continue;
														break;
													case 1: //Inverted
														_shape_x1 = _comp_x + shape_x2;
														_shape_y1 = _comp_y + shape_y2;
														_shape_x2 = _comp_x + shape_x1;
														_shape_y2 = _comp_y + shape_y1;
														break;
												}
												
												if (_y_slope != clamp(_y_slope, _shape_y1, _shape_y2))
													continue;
												
												if (_shape_x1 == _shape_x2)
													_new_pos = _shape_x1;
												else
												{
													_slope = (_shape_y2 - _shape_y1) / (_shape_x2 - _shape_x1);
													_y_intercept = _shape_y1 - _slope * _shape_x1;
													_new_pos = (_y_slope - _y_intercept) / _slope;
												}
												
												if (rectangle_in_rectangle(_x1, _y_slope, _x2, _y_slope, _new_pos, _shape_y1, _new_pos + 16, _shape_x2))
													return true;
												break;
											case "comp_collider_circle":
												break;
										}
									}
								}
							}
						}
					}
				}
			#endregion
	
			return false;
		}
	
		/// @function collision_exists_right_simple
		/// @param _x = x + collider_detector_sides_width_get()
		/// @param _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1]
		/// @param _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2]
		/// @param _y_slope = y
		/// @param _extend = 0
		/// @param {Boolean} _check_semi_solid = true
		/// @description An easier to use collision method that extends rightward by a certain amount. This is useful for simple wall collision checks!
		function collision_exists_right_simple(_x = x + collider_detector_sides_width_get(), _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1], _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2], _y_slope = y, _extend = 0, _check_semi_solid = true)
		{
			return collision_exists_right(_x, _x + _extend, _y1_flat, _y2_flat, _y_slope, _check_semi_solid);
			
			gml_pragma("forceinline");
		}
	#endregion

	#region Down
		/// @function collision_down
		/// @param _x1 = x + collider_detector_sides_width_get()
		/// @param _x2 = _x1
		/// @param _y1_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y1]
		/// @param _y2_flat = y + collider_detector_sides[collider_detector_sides_data.flat_y2]
		/// @param _y_slope = y
		/// @param _push_out_by = collider_detector_sides_width_get()
		/// @param _attach = false
		/// @param {Boolean} _check_semi_solid = true
		/// @param {Boolean} _collide_do = true
		function collision_down(_x1_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x1], _x2_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x2], _x_slope = x, _y1 = y + collider_detector_down_y_get(), _y2 = _y1, _push_out_by = collider_detector_down_y_get(), _attach = false, _check_semi_solid = true, _collide_do = true)
		{
			var _collider_collision;
			var _collision = false;
			var _tilemap, _tile_data_array;
			var _hashmap = global.hashmap_collision;
			var _hashmap_width = global.hashmap_collision_width;
			var _cell_x, _cell_y, _cell_x1, _cell_y1, _cell_x2, _cell_y2;
			var _instance, _instance_list, _instance_list_pos, _instance_x, _instance_y;
			var _comp, _comp_list, _comp_list_pos, _comp_x, _comp_y, _comp_callback;
			var _shape_x1, _shape_y1, _shape_x2, _shape_y2, _y_intercept, _slope, _behavior;
			var _new_pos;
			var _blacklist = [];
	
			collider_collision_global_clear();
			_collider_collision = global.collider_collision;
			_collider_collision[collider_collision.y] = infinity;
	
			#region Tilemap Collisions
				_tilemap = layer_tilemap_get_id("layer_tiles_normal");
				_tile_data_array = global.tile_data_array_level;
	
				if (_x1_flat != _x_slope || _x2_flat != _x_slope)
				{
					if (collision_tile_flat_down(_x1_flat, _x2_flat, _y1, _y2, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
					if (collision_tile_slope_down(_x_slope, _y1, _y2, true, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
				}
				else
				{
					if (collision_tile_slope_down(_x_slope, _y1, _y2, false, true, _tilemap, _tile_data_array, _check_semi_solid))
						_collision = true;
				}
			#endregion
	
			#region Collider Collisions
				_cell_x1 = clamp(_x1_flat, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y1 = clamp(min(_y1, _collider_collision[collider_collision.y]), 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
				_cell_x2 = clamp(_x2_flat, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y2 = clamp(max(_y2, _collider_collision[collider_collision.y]), 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
		
				for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
				{
					for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
					{
						_instance_list = _hashmap[_cell_x + (_cell_y * _hashmap_width)][hashmap_cell_data.collider];
			
						for (_instance_list_pos = 0; _instance_list_pos < array_length(_instance_list); ++_instance_list_pos)
						{
							_instance = _instance_list[_instance_list_pos];
				
							if (!instance_exists(_instance) || _instance == id || array_contains(_blacklist, _instance))
								continue;
				
							array_push(_blacklist, _instance);
							with (_instance)
							{
								_comp_list = comp_list_collider;
								_instance_x = x;
								_instance_y = y;
					
								for (_comp_list_pos = 0; _comp_list_pos < array_length(_comp_list); ++_comp_list_pos)
								{
									_comp = _comp_list[_comp_list_pos];
						
									if (!weak_ref_alive(_comp))
										continue;
							
									_comp = _comp.ref;
									
									switch (_comp.solid_y1)
									{
										case collider_solidity.solid:
											break;
										case collider_solidity.semi_solid:
											if (!_check_semi_solid)
												continue;
											break;
										default:
											continue;
											break;
									}
						
									with (_comp)
									{
										_comp_x = _instance_x + x_offset;
										_comp_y = _instance_y + y_offset;
										_behavior = behavior[1];
										switch (instanceof(_comp))
										{
											case "comp_collider_AABB":
												_shape_x1 = _comp_x + shape_x1;
												_shape_y1 = _comp_y + shape_y1;
												_shape_x2 = _comp_x + shape_x2;
												_shape_y2 = _comp_y + shape_y2;
												if (rectangle_in_rectangle(_x1_flat, _y1, _x2_flat, _y2, _shape_x1, _shape_y1, _shape_x2, _shape_y1 + 16))
												{
													if (_collider_collision[collider_collision.y] >= _shape_y1)
													{
														_collision = true;
														_collider_collision[collider_collision.collider] = self;
														_collider_collision[collider_collision.x] = _x1_flat;
														_collider_collision[collider_collision.y] = _shape_y1;
														_collider_collision[collider_collision.angle] = 0;
														_collider_collision[collider_collision.behavior] = _behavior;
														_collider_collision[collider_collision.is_tilemap] = false;
													}
												}
												break;
											case "comp_collider_line":
												switch (sign(shape_x1 - shape_x2))
												{
													case -1: //Normal
														_shape_x1 = _comp_x + shape_x1;
														_shape_y1 = _comp_y + shape_y1;
														_shape_x2 = _comp_x + shape_x2;
														_shape_y2 = _comp_y + shape_y2;
														break;
													case 0: //Completely Vertical
														continue;
														break;
													case 1: //Inverted
														_shape_x1 = _comp_x + shape_x2;
														_shape_y1 = _comp_y + shape_y2;
														_shape_x2 = _comp_x + shape_x1;
														_shape_y2 = _comp_y + shape_y1;
														break;
												}
												
												if (_shape_x1 == _shape_x2)
													continue;
										
												if (_x_slope != clamp(_x_slope, _shape_x1, _shape_x2))
													continue;
											
												_slope = (_shape_y2 - _shape_y1) / (_shape_x2 - _shape_x1);
												_y_intercept = _shape_y1 - _slope * _shape_x1;
												_new_pos = (_slope * _x_slope) + _y_intercept;
												
												if (_new_pos <= _collider_collision[collider_collision.y] && rectangle_in_rectangle(0, _y1, 0, _y2, 0, _new_pos, 0, _new_pos + 16))
												{
													_collision = true;
													_collider_collision[collider_collision.collider] = self;
													_collider_collision[collider_collision.x] = _x_slope;
													_collider_collision[collider_collision.y] = _new_pos;
													_collider_collision[collider_collision.angle] = angle;
													_collider_collision[collider_collision.behavior] = _behavior;
													_collider_collision[collider_collision.is_tilemap] = false;
												}
												break;
											case "comp_collider_circle":
												break;
										}
									}
								}
							}
						}
					}
				}
			#endregion
	
			if (_collision && _collide_do)
			{
				y = _collider_collision[collider_collision.y] - _push_out_by;
				collision_flag_set_down();
		
				if (_collider_collision[collider_collision.collider] != undefined)
				{
					//do callback
					_comp_callback = method(self, _collider_collision[collider_collision.collider].callback[1]);
					_comp_callback();
				}
		
				if (_attach && _collider_collision[collider_collision.collider] != undefined)
					collider_attach_set(_collider_collision[collider_collision.collider], _collider_collision[collider_collision.x], _collider_collision[collider_collision.y]);
				else
					collider_attach_clear();
			}
	
			return _collision;
		}
		
		/// @function collision_down_simple
		/// @param _x1_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x1]
		/// @param _x2_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x2]
		/// @param _x_slope = x
		/// @param _y = y + collider_detector_down_y_get()
		/// @param _extend = 0
		/// @param _push_out_by = collider_detector_down_y_get()
		/// @param _attach = false
		/// @param {Boolean} _check_semi_solid = true
		/// @param {Boolean} _collide_do = true
		/// @description An easier to use collision method that extends downward by a certain amount. This is useful for simple ground collision checks!
		function collision_down_simple(_x1_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x1], _x2_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x2], _x_slope = x, _y = y + collider_detector_down_y_get(), _extend = 0, _push_out_by = collider_detector_down_y_get(), _attach = false, _check_semi_solid = true, _collide_do = true)
		{
			return collision_down(_x1_flat, _x2_flat, _x_slope, _y, _y + _extend, _push_out_by, _attach, _check_semi_solid, _collide_do);
			
			gml_pragma("forceinline");
		}
		
		/// @function collision_exists_down
		/// @param _x1_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x1]
		/// @param _x2_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x2]
		/// @param _x_slope = x
		/// @param _y1 = y + collider_detector_down_y_get()
		/// @param _y2 = _y1
		/// @param {Boolean} _check_semi_solid = true
		function collision_exists_down(_x1_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x1], _x2_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x2], _x_slope = x, _y1 = y + collider_detector_down_y_get(), _y2 = _y1, _check_semi_solid = true)
		{
			var _tilemap, _tile_data_array;
			var _hashmap = global.hashmap_collision;
			var _hashmap_width = global.hashmap_collision_width;
			var _cell_x, _cell_y, _cell_x1, _cell_y1, _cell_x2, _cell_y2;
			var _instance, _instance_list, _instance_list_pos, _instance_x, _instance_y;
			var _comp, _comp_list, _comp_list_pos, _comp_x, _comp_y;
			var _shape_x1, _shape_y1, _shape_x2, _shape_y2, _y_intercept, _slope;
			var _new_pos;
			var _blacklist = [];
	
			collider_collision_global_clear();
			global.collider_collision[collider_collision.y] = _y2;
	
			_x1_flat = clamp(_x1_flat, 0, room_width - 1);
			_x2_flat = clamp(_x2_flat, 0, room_width - 1);
			_x_slope = clamp(_x_slope, 0, room_width - 1);
	
			#region Tilemap Collisions
				_tilemap = layer_tilemap_get_id("layer_tiles_normal");
				_tile_data_array = global.tile_data_array_level;
			
				if (_x1_flat != _x_slope || _x2_flat != _x_slope)
				{
					if (collision_tile_flat_down(_x1_flat, _x2_flat, _y1, _y2, false, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
					if (collision_tile_slope_down(_x_slope, _y1, _y2, true, false, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
				}
				else
				{
					if (collision_tile_slope_down(_x_slope, _y1, _y2, false, false, _tilemap, _tile_data_array, _check_semi_solid))
						return true;
				}
			#endregion
	
			#region Collider Collisions
				_cell_x1 = clamp(_x1_flat, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y1 = clamp(_y1, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
				_cell_x2 = clamp(_x2_flat, 0, room_width - 1) div HASHMAP_BUCKET_SIZE;
				_cell_y2 = clamp(_y2, 0, room_height - 1) div HASHMAP_BUCKET_SIZE;
		
				for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
				{
					for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
					{
						_instance_list = _hashmap[_cell_x + (_cell_y * _hashmap_width)][hashmap_cell_data.collider];
			
						for (_instance_list_pos = 0; _instance_list_pos < array_length(_instance_list); ++_instance_list_pos)
						{
							_instance = _instance_list[_instance_list_pos];
				
							if (!instance_exists(_instance) || _instance == id || array_contains(_blacklist, _instance))
								continue;
				
							array_push(_blacklist, _instance);
							with (_instance)
							{
								_comp_list = comp_list_collider;
								_instance_x = x;
								_instance_y = y;
					
								for (_comp_list_pos = 0; _comp_list_pos < array_length(_comp_list); ++_comp_list_pos)
								{
									_comp = _comp_list[_comp_list_pos];
						
									if (!weak_ref_alive(_comp))
										continue;
							
									_comp = _comp.ref;
									
									switch (_comp.solid_y1)
									{
										case collider_solidity.solid:
											break;
										case collider_solidity.semi_solid:
											if (!_check_semi_solid)
												continue;
											break;
										default:
											continue;
											break;
									}
						
									with (_comp)
									{
										_comp_x = _instance_x + x_offset;
										_comp_y = _instance_y + y_offset;
										switch (instanceof(_comp))
										{
											case "comp_collider_AABB":
												_shape_x1 = _comp_x + shape_x1;
												_shape_y1 = _comp_y + shape_y1;
												_shape_x2 = _comp_x + shape_x2;
												_shape_y2 = _comp_y + shape_y2;
												if (rectangle_in_rectangle(_x1_flat, _y1, _x2_flat, _y2, _shape_x1, _shape_y1, _shape_x2, _shape_y1 + 16))
													return true;
												break;
											case "comp_collider_line":
												switch (sign(shape_x1 - shape_x2))
												{
													case -1: //Normal
														_shape_x1 = _comp_x + shape_x1;
														_shape_y1 = _comp_y + shape_y1;
														_shape_x2 = _comp_x + shape_x2;
														_shape_y2 = _comp_y + shape_y2;
														break;
													case 0: //Completely Vertical
														continue;
														break;
													case 1: //Inverted
														_shape_x1 = _comp_x + shape_x2;
														_shape_y1 = _comp_y + shape_y2;
														_shape_x2 = _comp_x + shape_x1;
														_shape_y2 = _comp_y + shape_y1;
														break;
												}
												
												if (_shape_x1 == _shape_x2)
													continue;
												
												_slope = (_shape_y2 - _shape_y1) / (_shape_x2 - _shape_x1);
												_y_intercept = _shape_y1 - _slope * _shape_x1;
												_new_pos = (_slope * _x_slope) + _y_intercept;
										
												if (rectangle_in_rectangle(_x_slope, _y1, _x_slope, _y2, _shape_x1, _new_pos, _shape_x2, _new_pos + 16))
													return true;
												break;
											case "comp_collider_circle":
												break;
										}
									}
								}
							}
						}
					}
				}
			#endregion
	
			return false;
		}
	
		/// @function collision_exists_down_simple
		/// @param _x1_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x1]
		/// @param _x2_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x2]
		/// @param _x_slope = x
		/// @param _y = y + collider_detector_down_y_get()
		/// @param _extend = 0
		/// @param {Boolean} _check_semi_solid = true
		/// @description An easier to use collision method that extends downward by a certain amount. This is useful for simple ground collision checks!
		function collision_exists_down_simple(_x1_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x1], _x2_flat = x + collider_detector_down[collider_detector_vertical_data.flat_x2], _x_slope = x, _y = y + collider_detector_down_y_get(), _extend = 0, _check_semi_solid = true)
		{
			return collision_exists_down(_x1_flat, _x2_flat, _x_slope, _y, _y + _extend, _check_semi_solid);
			
			gml_pragma("forceinline");
		}
	#endregion
#endregion
