#region Left
	/// @function collision_tile_slope_left
	/// @param _x = x
	/// @param _y = y
	/// @param {boolean} _slope_only = false
	/// @param {boolean} _collide = true
	/// @param _tilemap
	/// @param _tile_data_array = global.tile_data_array_level
	function collision_tile_slope_left(_x = x, _y = y, _slope_only = false, _collide = true, _tilemap, _tile_data_array = global.tile_data_array_level)
	{
		var _cell_x = _x >> TILE_SIZE_DIV;
		var _cell_y = _y >> TILE_SIZE_DIV;
	
		var _tilemap_width_cells = tilemap_get_width(_tilemap);
		var _tile_data, _solid_type, _solid, _tile_slope, _y_intercept, _behavior;
		var _tile_x, _tile_y, _tile_x1, _tile_y1, _tile_x2, _tile_y2;
		var _collision = false, _new_pos, _angle;
		var _collider_collision;
	
		_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
		_solid = _tile_data[tile_data.solid_x2];
		
		if (_solid == false)
			return false;
			
		_solid_type = _tile_data[tile_data.solid_type];
		switch (_solid_type)
		{
			case tile_solidity.solid_support:
				while (_cell_x < _tilemap_width_cells && _solid_type == tile_solidity.solid_support)
				{
					_cell_x++;
					_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
					_solid_type = _tile_data[tile_data.solid_type];
					_solid = _tile_data[tile_data.solid_x2];
				
					if (_solid == false)
						return false;
					break;
				}
				break;
			case tile_solidity.solid_flat:
				if (_slope_only)
					return false;
				break;
			default:
				break;
		}
	
		_tile_x = _cell_x << TILE_SIZE_DIV;
		_tile_y = _cell_y << TILE_SIZE_DIV;
		_behavior = _tile_data[tile_data.behavior];
		_angle = _tile_data[tile_data.angle];
		if (_angle == ANGLE_FLAT)
			_angle = 270;
		
		switch (_tile_data[tile_data.shape])
		{
			case tile_shapes.full:
				if (_collide)
				{
					_new_pos = _tile_x + TILE_SIZE - 1;
					_collision = true;
				}
				else
					return true;
				break;
			case tile_shapes.AABB:
				_tile_x1 = _tile_x;
				_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
				_tile_x2 = _tile_x + _tile_data[tile_data.shape_x2];
				_tile_y2 = _tile_y + _tile_data[tile_data.shape_y2];
			
				if (point_in_rectangle(_x, _y, _tile_x1, _tile_y1, _tile_x2, _tile_y2))
				{
					if (_collide)
					{
						_new_pos = _tile_x2;
						_collision = true;
					}
					else
						return true;
				}
				break;
			case tile_shapes.line:
				switch sign(_tile_data[tile_data.shape_y1] - _tile_data[tile_data.shape_y2])
				{
					case -1: //Normal
						_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
						_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
						_tile_slope = _tile_data[tile_data.slope];
						_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
						_new_pos = (_y - _y_intercept) / _tile_slope;
						break;
					case 0:
						_new_pos = _tile_x + max(_tile_data[tile_data.shape_x1], _tile_data[tile_data.shape_x2]);
						break;
					case 1: //Inverted
						_tile_x1 = _tile_x + _tile_data[tile_data.shape_x2];
						_tile_y1 = _tile_y + _tile_data[tile_data.shape_y2];
						_tile_slope = -_tile_data[tile_data.slope];
						_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
						_new_pos = (_y - _y_intercept) / _tile_slope;
						break;
				}
			
				if (_x <= _new_pos)
				{
					if (_collide)
						_collision = true;
					else
						return true;
				}
				break;
		}
		
		if (_collision)
		{
			_collider_collision = global.collider_collision;
			_collider_collision[collider_collision.collider] = undefined;
			_collider_collision[collider_collision.x] = max(_new_pos, _collider_collision[collider_collision.x]);
			_collider_collision[collider_collision.y] = _y;
			_collider_collision[collider_collision.angle] = _angle;
			_collider_collision[collider_collision.behavior] = _behavior;
			_collider_collision[collider_collision.is_tilemap] = true;
			_collider_collision[collider_collision.cell_x] = _cell_x;
			_collider_collision[collider_collision.cell_y] = _cell_y;
			return true;
		}

	    return false;
	}

	/// @function collision_tile_flat_left
	/// @param _x = x
	/// @param _y1 = y
	/// @param _y2 = y
	/// @param {boolean} _collide = true
	/// @param _tilemap
	/// @param _tile_data_array = global.tile_data_array_level
	function collision_tile_flat_left(_x = x, _y1 = y, _y2 = y, _collide = true, _tilemap, _tile_data_array = global.tile_data_array_level)
	{
		var _cell_x = _x >> TILE_SIZE_DIV;
		var _cell_y;
		var _cell_y1 = _y1 >> TILE_SIZE_DIV;
		var _cell_y2 = _y2 >> TILE_SIZE_DIV;
	
		var _tile_data, _solid_type, _solid, _tile_slope, _y_intercept, _behavior;
		var _tile_x, _tile_y, _tile_x1, _tile_y1, _tile_x2, _tile_y2;
		var _collision = false, _new_pos, _angle;
		var _collider_collision;
	
		_tile_x = _cell_x << TILE_SIZE_DIV;
	
		for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
		{
			_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
			_solid = _tile_data[tile_data.solid_x2];
		
			if (_solid == false)
				continue;
			
			_solid_type = _tile_data[tile_data.solid_type];
			switch (_solid_type)
			{
				case tile_solidity.solid_support:
				case tile_solidity.solid_slope:
					continue;
					break;
				default:
					break;
			}
	
			_tile_y = _cell_y << TILE_SIZE_DIV;
			_behavior = _tile_data[tile_data.behavior];
			_angle = _tile_data[tile_data.angle];
			if (_angle == ANGLE_FLAT)
				_angle = 270;
		
			switch (_tile_data[tile_data.shape])
			{
				case tile_shapes.full:
					if (_collide)
					{
						_new_pos = _tile_x + TILE_SIZE - 1;
						_collision = true;
					}
					else
						return true;
					break;
				case tile_shapes.AABB:
					_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
					_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
					_tile_x2 = _tile_x + _tile_data[tile_data.shape_x2];
					_tile_y2 = _tile_y + _tile_data[tile_data.shape_y2];
			
					if (rectangle_in_rectangle(_x, _y1, _x, _y2, _tile_x1, _tile_y1, _tile_x2, _tile_y2))
					{
						if (_collide)
						{
							_new_pos = _tile_x2;
							_collision = true;
						}
						else
							return true;
					}
					break;
				case tile_shapes.line:
					switch sign(_tile_data[tile_data.shape_y1] - _tile_data[tile_data.shape_y2])
					{
						case -1: //Normal
							_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
							_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
							_tile_slope = _tile_data[tile_data.slope];
							_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
							_new_pos = max(_y1 - _y_intercept, _y2 - _y_intercept) / _tile_slope;
							break;
						case 0:
							_new_pos = _tile_x + max(_tile_data[tile_data.shape_x1], _tile_data[tile_data.shape_x2]);
							break;
						case 1: //Inverted
							_tile_x1 = _tile_x + _tile_data[tile_data.shape_x2];
							_tile_y1 = _tile_y + _tile_data[tile_data.shape_y2];
							_tile_slope = -_tile_data[tile_data.slope];
							_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
							_new_pos = max(_y1 - _y_intercept, _y2 - _y_intercept) / _tile_slope;
							break;
					}
			
					if (_x <= _new_pos)
					{
						if (_collide)
							_collision = true;
						else
							return true;
					}
					break;
			}
		
			if (_collision)
			{
				_collider_collision = global.collider_collision;
				_collider_collision[collider_collision.collider] = undefined;
				_collider_collision[collider_collision.x] = max(_new_pos, _collider_collision[collider_collision.x]);
				_collider_collision[collider_collision.y] = _y1;
				_collider_collision[collider_collision.angle] = _angle;
				_collider_collision[collider_collision.behavior] = _behavior;
				_collider_collision[collider_collision.is_tilemap] = true;
				_collider_collision[collider_collision.cell_x] = _cell_x;
				_collider_collision[collider_collision.cell_y] = _cell_y;
				return true;
			}
		}

	    return false;
	}
#endregion

#region Up
	/// @function collision_tile_slope_up
	/// @param _x = x
	/// @param _y = y
	/// @param {boolean} _slope_only = false
	/// @param {boolean} _collide = true
	/// @param _tilemap
	/// @param _tile_data_array = global.tile_data_array_level
	function collision_tile_slope_up(_x = x, _y = y, _slope_only = false, _collide = true, _tilemap, _tile_data_array = global.tile_data_array_level)
	{
		var _cell_x = _x >> TILE_SIZE_DIV;
		var _cell_y = _y >> TILE_SIZE_DIV;
	
		var _tilemap_height_cells = tilemap_get_height(_tilemap);
		var _tile_data, _solid_type, _solid, _tile_slope, _y_intercept, _behavior;
		var _tile_x, _tile_y, _tile_x1, _tile_y1, _tile_x2, _tile_y2;
		var _collision = false, _new_pos, _angle;
		var _collider_collision;
	
		_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
		_solid = _tile_data[tile_data.solid_y2];
		
		if (_solid == false)
			return false;
			
		_solid_type = _tile_data[tile_data.solid_type];
		switch (_solid_type)
		{
			case tile_solidity.solid_support:
				while (_cell_y < _tilemap_height_cells && _solid_type == tile_solidity.solid_support)
				{
					_cell_y++;
					_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
					_solid_type = _tile_data[tile_data.solid_type];
					_solid = _tile_data[tile_data.solid_y2];
				
					if (_solid == false)
						return false;
					break;
				}
				break;
			case tile_solidity.solid_flat:
				if (_slope_only)
					return false;
				break;
			default:
				break;
		}
	
		_tile_x = _cell_x << TILE_SIZE_DIV;
		_tile_y = _cell_y << TILE_SIZE_DIV;
		_behavior = _tile_data[tile_data.behavior];
		_angle = _tile_data[tile_data.angle];
		if (_angle == ANGLE_FLAT)
			_angle = 180;
		
		switch (_tile_data[tile_data.shape])
		{
			case tile_shapes.full:
				if (_collide)
				{
					_new_pos = _tile_y + TILE_SIZE - 1;
					_collision = true;
				}
				else
					return true;
				break;
			case tile_shapes.AABB:
				_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
				_tile_y1 = _tile_y;
				_tile_x2 = _tile_x + _tile_data[tile_data.shape_x2];
				_tile_y2 = _tile_y + _tile_data[tile_data.shape_y2];
			
				if (point_in_rectangle(_x, _y, _tile_x1, _tile_y1, _tile_x2, _tile_y2))
				{
					if (_collide)
					{
						_new_pos = _tile_y2;
						_collision = true;
					}
					else
						return true;
				}
				break;
			case tile_shapes.line:
				switch sign(_tile_data[tile_data.shape_x1] - _tile_data[tile_data.shape_x2])
				{
					case -1: //Normal
						_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
						_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
						_tile_slope = _tile_data[tile_data.slope];
						_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
						_new_pos = (_tile_slope * _x) + _y_intercept;
						break;
					case 0:
						_new_pos = _tile_y + max(_tile_data[tile_data.shape_y1], _tile_data[tile_data.shape_y2]);
						break;
					case 1: //Inverted
						_tile_x1 = _tile_x + _tile_data[tile_data.shape_x2];
						_tile_y1 = _tile_y + _tile_data[tile_data.shape_y2];
						_tile_slope = -_tile_data[tile_data.slope];
						_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
						_new_pos = (_tile_slope * _x) + _y_intercept;
						break;
				}
			
				if (_y <= _new_pos)
				{
					if (_collide)
						_collision = true;
					else
						return true;
				}
				break;
		}
		
		if (_collision)
		{
			_collider_collision = global.collider_collision;
			_collider_collision[collider_collision.collider] = undefined;
			_collider_collision[collider_collision.x] = _x;
			_collider_collision[collider_collision.y] = max(_new_pos, _collider_collision[collider_collision.y]);
			_collider_collision[collider_collision.angle] = _angle;
			_collider_collision[collider_collision.behavior] = _behavior;
			_collider_collision[collider_collision.is_tilemap] = true;
			_collider_collision[collider_collision.cell_x] = _cell_x;
			_collider_collision[collider_collision.cell_y] = _cell_y;
			return true;
		}

	    return false;
	}

	/// @function collision_tile_flat_up
	/// @param _x1 = x
	/// @param _x2 = x
	/// @param _y = y
	/// @param {boolean} _collide = true
	/// @param _tilemap
	/// @param _tile_data_array = global.tile_data_array_level
	function collision_tile_flat_up(_x1 = x, _x2 = x, _y, _collide = true, _tilemap, _tile_data_array = global.tile_data_array_level)
	{
		var _cell_x;
		var _cell_x1 = _x1 >> TILE_SIZE_DIV;
		var _cell_x2 = _x2 >> TILE_SIZE_DIV;
		var _cell_y = _y >> TILE_SIZE_DIV;
	
		var _tile_data, _solid_type, _solid, _tile_slope, _y_intercept, _behavior;
		var _tile_x, _tile_y, _tile_x1, _tile_y1, _tile_x2, _tile_y2;
		var _collision = false, _new_pos, _angle;
		var _collider_collision;
	
		_tile_y = _cell_y << TILE_SIZE_DIV;
	
		for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
		{
			_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
			_solid = _tile_data[tile_data.solid_y2];
		
			if (_solid == false)
				continue;
			
			_solid_type = _tile_data[tile_data.solid_type];
			switch (_solid_type)
			{
				case tile_solidity.solid_support:
				case tile_solidity.solid_slope:
					continue;
					break;
				default:
					break;
			}
	
			_tile_x = _cell_x << TILE_SIZE_DIV;
			_behavior = _tile_data[tile_data.behavior];
			_angle = _tile_data[tile_data.angle];
			if (_angle == ANGLE_FLAT)
				_angle = 180;
		
			switch (_tile_data[tile_data.shape])
			{
				case tile_shapes.full:
					if (_collide)
					{
						_new_pos = _tile_y + TILE_SIZE - 1;
						_collision = true;
					}
					else
						return true;
					break;
				case tile_shapes.AABB:
					_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
					_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
					_tile_x2 = _tile_x + _tile_data[tile_data.shape_x2];
					_tile_y2 = _tile_y + _tile_data[tile_data.shape_y2];
			
					if (rectangle_in_rectangle(_x1, _y, _x2, _y, _tile_x1, _tile_y1, _tile_x2, _tile_y2))
					{
						if (_collide)
						{
							_new_pos = _tile_y2;
							_collision = true;
						}
						else
							return true;
					}
					break;
				case tile_shapes.line:
					switch sign(_tile_data[tile_data.shape_x1] - _tile_data[tile_data.shape_x2])
					{
						case -1: //Normal
							_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
							_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
							_tile_slope = _tile_data[tile_data.slope];
							_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
							_new_pos = max(_tile_slope * _x1, _tile_slope * _x2) + _y_intercept;
							break;
						case 0:
							_new_pos = _tile_y + max(_tile_data[tile_data.shape_y1], _tile_data[tile_data.shape_y2]);
							break;
						case 1: //Inverted
							_tile_x1 = _tile_x + _tile_data[tile_data.shape_x2];
							_tile_y1 = _tile_y + _tile_data[tile_data.shape_y2];
							_tile_slope = -_tile_data[tile_data.slope];
							_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
							_new_pos = max(_tile_slope * _x1, _tile_slope * _x2) + _y_intercept;
							break;
					}
			
					if (_y <= _new_pos)
					{
						if (_collide)
							_collision = true;
						else
							return true;
					}
					break;
			}
		
			if (_collision)
			{
				_collider_collision = global.collider_collision;
				_collider_collision[collider_collision.collider] = undefined;
				_collider_collision[collider_collision.x] = _x1;
				_collider_collision[collider_collision.y] = max(_new_pos, _collider_collision[collider_collision.y]);
				_collider_collision[collider_collision.angle] = _angle;
				_collider_collision[collider_collision.behavior] = _behavior;
				_collider_collision[collider_collision.is_tilemap] = true;
				_collider_collision[collider_collision.cell_x] = _cell_x;
				_collider_collision[collider_collision.cell_y] = _cell_y;
				return true;
			}
		}

	    return false;
	}
#endregion

#region Right
	/// @function collision_tile_slope_right
	/// @param _x = x
	/// @param _y = y
	/// @param {boolean} _slope_only = false
	/// @param {boolean} _collide = true
	/// @param _tilemap
	/// @param _tile_data_array = global.tile_data_array_level
	function collision_tile_slope_right(_x = x, _y = y, _slope_only = false, _collide = true, _tilemap, _tile_data_array = global.tile_data_array_level)
	{
		var _cell_x = _x >> TILE_SIZE_DIV;
		var _cell_y = _y >> TILE_SIZE_DIV;
	
		var _tile_data, _solid_type, _solid, _tile_slope, _y_intercept, _behavior;
		var _tile_x, _tile_y, _tile_x1, _tile_y1, _tile_x2, _tile_y2;
		var _collision = false, _new_pos, _angle;
		var _collider_collision;
	
		_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
		_solid = _tile_data[tile_data.solid_x1];
		
		if (_solid == false)
			return false;
			
		_solid_type = _tile_data[tile_data.solid_type];
		switch (_solid_type)
		{
			case tile_solidity.solid_support:
				while (_cell_x > 0 && _solid_type == tile_solidity.solid_support)
				{
					_cell_x--;
					_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
					_solid_type = _tile_data[tile_data.solid_type];
					_solid = _tile_data[tile_data.solid_x1];
				
					if (_solid == false)
						return false;
					break;
				}
				break;
			case tile_solidity.solid_flat:
				if (_slope_only)
					return false;
				break;
			default:
				break;
		}
	
		_tile_x = _cell_x << TILE_SIZE_DIV;
		_tile_y = _cell_y << TILE_SIZE_DIV;
		_behavior = _tile_data[tile_data.behavior];
		_angle = _tile_data[tile_data.angle];
		if (_angle == ANGLE_FLAT)
			_angle = 90;
		
		switch (_tile_data[tile_data.shape])
		{
			case tile_shapes.full:
				if (_collide)
				{
					_new_pos = _tile_x;
					_collision = true;
				}
				else
					return true;
				break;
			case tile_shapes.AABB:
				_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
				_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
				_tile_x2 = _tile_x + TILE_SIZE - 1;
				_tile_y2 = _tile_y + _tile_data[tile_data.shape_y2];
			
				if (point_in_rectangle(_x, _y, _tile_x1, _tile_y1, _tile_x2, _tile_y2))
				{
					if (_collide)
					{
						_new_pos = _tile_x1;
						_collision = true;
					}
					else
						return true;
				}
				break;
			case tile_shapes.line:
				switch sign(_tile_data[tile_data.shape_y1] - _tile_data[tile_data.shape_y2])
				{
					case -1: //Normal
						_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
						_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
						_tile_slope = _tile_data[tile_data.slope];
						_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
						_new_pos = (_y - _y_intercept) / _tile_slope;
						break;
					case 0:
						_new_pos = _tile_x + min(_tile_data[tile_data.shape_x1], _tile_data[tile_data.shape_x2]);
						break;
					case 1: //Inverted
						_tile_x1 = _tile_x + _tile_data[tile_data.shape_x2];
						_tile_y1 = _tile_y + _tile_data[tile_data.shape_y2];
						_tile_slope = -_tile_data[tile_data.slope];
						_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
						_new_pos = (_y - _y_intercept) / _tile_slope;
						break;
				}
			
				if (_x >= _new_pos)
				{
					if (_collide)
						_collision = true;
					else
						return true;
				}
				break;
		}
		
		if (_collision)
		{
			_collider_collision = global.collider_collision;
			_collider_collision[collider_collision.collider] = undefined;
			_collider_collision[collider_collision.x] = min(_new_pos, _collider_collision[collider_collision.x]);
			_collider_collision[collider_collision.y] = _y;
			_collider_collision[collider_collision.angle] = _angle;
			_collider_collision[collider_collision.behavior] = _behavior;
			_collider_collision[collider_collision.is_tilemap] = true;
			_collider_collision[collider_collision.cell_x] = _cell_x;
			_collider_collision[collider_collision.cell_y] = _cell_y;
			return true;
		}

	    return false;
	}

	/// @function collision_tile_flat_right
	/// @param _x = x
	/// @param _y1 = y
	/// @param _y2 = y
	/// @param {boolean} _collide = true
	/// @param _tilemap
	/// @param _tile_data_array = global.tile_data_array_level
	function collision_tile_flat_right(_x = x, _y1 = y, _y2 = y, _collide = true, _tilemap, _tile_data_array = global.tile_data_array_level)
	{
		var _cell_x = _x >> TILE_SIZE_DIV;
		var _cell_y;
		var _cell_y1 = _y1 >> TILE_SIZE_DIV;
		var _cell_y2 = _y2 >> TILE_SIZE_DIV;
	
		var _tile_data, _solid_type, _solid, _tile_slope, _y_intercept, _behavior;
		var _tile_x, _tile_y, _tile_x1, _tile_y1, _tile_x2, _tile_y2;
		var _collision = false, _new_pos, _angle;
		var _collider_collision;
	
		_tile_x = _cell_x << TILE_SIZE_DIV;
	
		for (_cell_y = _cell_y1; _cell_y <= _cell_y2; ++_cell_y)
		{
			_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
			_solid = _tile_data[tile_data.solid_x1];
		
			if (_solid == false)
				continue;
			
			_solid_type = _tile_data[tile_data.solid_type];
			switch (_solid_type)
			{
				case tile_solidity.solid_support:
				case tile_solidity.solid_slope:
					continue;
					break;
				default:
					break;
			}
	
			_tile_y = _cell_y << TILE_SIZE_DIV;
			_behavior = _tile_data[tile_data.behavior];
			_angle = _tile_data[tile_data.angle];
			if (_angle == ANGLE_FLAT)
				_angle = 90;
		
			switch (_tile_data[tile_data.shape])
			{
				case tile_shapes.full:
					if (_collide)
					{
						_new_pos = _tile_x;
						_collision = true;
					}
					else
						return true;
					break;
				case tile_shapes.AABB:
					_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
					_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
					_tile_x2 = _tile_x + TILE_SIZE - 1;
					_tile_y2 = _tile_y + _tile_data[tile_data.shape_y2];
			
					if (rectangle_in_rectangle(_x, _y1, _x, _y2, _tile_x1, _tile_y1, _tile_x2, _tile_y2))
					{
						if (_collide)
						{
							_new_pos = _tile_x1;
							_collision = true;
						}
						else
							return true;
					}
					break;
				case tile_shapes.line:
					switch sign(_tile_data[tile_data.shape_y1] - _tile_data[tile_data.shape_y2])
					{
						case -1: //Normal
							_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
							_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
							_tile_slope = _tile_data[tile_data.slope];
							_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
							_new_pos = min(_y1 - _y_intercept, _y2 - _y_intercept) / _tile_slope;
							break;
						case 0:
							_new_pos = _tile_x + min(_tile_data[tile_data.shape_x1], _tile_data[tile_data.shape_x2]);
							break;
						case 1: //Inverted
							_tile_x1 = _tile_x + _tile_data[tile_data.shape_x2];
							_tile_y1 = _tile_y + _tile_data[tile_data.shape_y2];
							_tile_slope = -_tile_data[tile_data.slope];
							_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
							_new_pos = min(_y1 - _y_intercept, _y2 - _y_intercept) / _tile_slope;
							break;
					}
			
					if (_x >= _new_pos)
					{
						if (_collide)
							_collision = true;
						else
							return true;
					}
					break;
			}
		
			if (_collision)
			{
				_collider_collision = global.collider_collision;
				_collider_collision[collider_collision.collider] = undefined;
				_collider_collision[collider_collision.x] = min(_new_pos, _collider_collision[collider_collision.x]);
				_collider_collision[collider_collision.y] = _y1;
				_collider_collision[collider_collision.angle] = _angle;
				_collider_collision[collider_collision.behavior] = _behavior;
				_collider_collision[collider_collision.is_tilemap] = true;
				_collider_collision[collider_collision.cell_x] = _cell_x;
				_collider_collision[collider_collision.cell_y] = _cell_y;
				return true;
			}
		}

	    return false;
	}
#endregion

#region Down
	/// @function collision_tile_slope_down
	/// @param _x = x
	/// @param _y = y
	/// @param {boolean} _slope_only = false
	/// @param {boolean} _collide = true
	/// @param _tilemap
	/// @param _tile_data_array = global.tile_data_array_level
	function collision_tile_slope_down(_x = x, _y = y, _slope_only = false, _collide = true, _tilemap, _tile_data_array = global.tile_data_array_level)
	{
		var _cell_x = _x >> TILE_SIZE_DIV;
		var _cell_y = _y >> TILE_SIZE_DIV;
	
		var _tile_data, _solid_type, _solid, _tile_slope, _y_intercept, _behavior;
		var _tile_x, _tile_y, _tile_x1, _tile_y1, _tile_x2, _tile_y2;
		var _collision = false, _new_pos, _angle;
		var _collider_collision;
	
		_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
		_solid = _tile_data[tile_data.solid_y1];
		
		if (_solid == false)
			return false;
			
		_solid_type = _tile_data[tile_data.solid_type];
		switch (_solid_type)
		{
			case tile_solidity.solid_support:
				while (_cell_y > 0 && _solid_type == tile_solidity.solid_support)
				{
					_cell_y--;
					_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
					_solid_type = _tile_data[tile_data.solid_type];
					_solid = _tile_data[tile_data.solid_y1];
				
					if (_solid == false)
						return false;
					break;
				}
				break;
			case tile_solidity.solid_flat:
				if (_slope_only)
					return false;
				break;
			default:
				break;
		}
	
		_tile_x = _cell_x << TILE_SIZE_DIV;
		_tile_y = _cell_y << TILE_SIZE_DIV;
		_behavior = _tile_data[tile_data.behavior];
		_angle = _tile_data[tile_data.angle];
		if (_angle == ANGLE_FLAT)
			_angle = 0;
		
		switch (_tile_data[tile_data.shape])
		{
			case tile_shapes.full:
				if (_collide)
				{
					_new_pos = _tile_y;
					_collision = true;
				}
				else
					return true;
				break;
			case tile_shapes.AABB:
				_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
				_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
				_tile_x2 = _tile_x + _tile_data[tile_data.shape_x2];
				_tile_y2 = _tile_y + TILE_SIZE;
			
				if (point_in_rectangle(_x, _y, _tile_x1, _tile_y1, _tile_x2, _tile_y2))
				{
					if (_collide)
					{
						_new_pos = _tile_y1;
						_collision = true;
					}
					else
						return true;
				}
				break;
			case tile_shapes.line:
				switch sign(_tile_data[tile_data.shape_x1] - _tile_data[tile_data.shape_x2])
				{
					case -1: //Normal
						_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
						_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
						_tile_slope = _tile_data[tile_data.slope];
						_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
						_new_pos = (_tile_slope * _x) + _y_intercept;
						break;
					case 0:
						_new_pos = _tile_y + min(_tile_data[tile_data.shape_y1], _tile_data[tile_data.shape_y2]);
						break;
					case 1: //Inverted
						_tile_x1 = _tile_x + _tile_data[tile_data.shape_x2];
						_tile_y1 = _tile_y + _tile_data[tile_data.shape_y2];
						_tile_slope = -_tile_data[tile_data.slope];
						_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
						_new_pos = (_tile_slope * _x) + _y_intercept;
						break;
				}
			
				if (_y >= _new_pos)
				{
					if (_collide)
						_collision = true;
					else
						return true;
				}
				break;
		}
		
		if (_collision)
		{
			_collider_collision = global.collider_collision;
			_collider_collision[collider_collision.collider] = undefined;
			_collider_collision[collider_collision.x] = _x;
			_collider_collision[collider_collision.y] = min(_new_pos, _collider_collision[collider_collision.y]);
			_collider_collision[collider_collision.angle] = _angle;
			_collider_collision[collider_collision.behavior] = _behavior;
			_collider_collision[collider_collision.is_tilemap] = true;
			_collider_collision[collider_collision.cell_x] = _cell_x;
			_collider_collision[collider_collision.cell_y] = _cell_y;
			return true;
		}

	    return false;
	}

	/// @function collision_tile_flat_down
	/// @param _x1 = x
	/// @param _x2 = x
	/// @param _y = y
	/// @param {boolean} _collide = true
	/// @param _tilemap
	/// @param _tile_data_array = global.tile_data_array_level
	function collision_tile_flat_down(_x1 = x, _x2 = x, _y, _collide = true, _tilemap, _tile_data_array = global.tile_data_array_level)
	{
		var _cell_x;
		var _cell_x1 = _x1 >> TILE_SIZE_DIV;
		var _cell_x2 = _x2 >> TILE_SIZE_DIV;
		var _cell_y = _y >> TILE_SIZE_DIV;
	
		var _tile_data, _solid_type, _solid, _tile_slope, _y_intercept, _behavior;
		var _tile_x, _tile_y, _tile_x1, _tile_y1, _tile_x2, _tile_y2;
		var _collision = false, _new_pos, _angle;
		var _collider_collision;
	
		_tile_y = _cell_y << TILE_SIZE_DIV;
	
		for (_cell_x = _cell_x1; _cell_x <= _cell_x2; ++_cell_x)
		{
			_tile_data = _tile_data_array[(tilemap_get(_tilemap, _cell_x, _cell_y) & tile_index_mask)];
			_solid = _tile_data[tile_data.solid_y1];
		
			if (_solid == false)
				continue;
			
			_solid_type = _tile_data[tile_data.solid_type];
			switch (_solid_type)
			{
				case tile_solidity.solid_support:
				case tile_solidity.solid_slope:
					continue;
					break;
				default:
					break;
			}
	
			_tile_x = _cell_x << TILE_SIZE_DIV;
			_behavior = _tile_data[tile_data.behavior];
			_angle = _tile_data[tile_data.angle];
			if (_angle == ANGLE_FLAT)
				_angle = 0;
		
			switch (_tile_data[tile_data.shape])
			{
				case tile_shapes.full:
					if (_collide)
					{
						_new_pos = _tile_y;
						_collision = true;
					}
					else
						return true;
					break;
				case tile_shapes.AABB:
					_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
					_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
					_tile_x2 = _tile_x + _tile_data[tile_data.shape_x2];
					_tile_y2 = _tile_y + _tile_data[tile_data.shape_y2];
			
					if (rectangle_in_rectangle(_x1, _y, _x2, _y, _tile_x1, _tile_y1, _tile_x2, _tile_y2))
					{
						if (_collide)
						{
							_new_pos = _tile_y1;
							_collision = true;
						}
						else
							return true;
					}
					break;
				case tile_shapes.line:
					switch sign(_tile_data[tile_data.shape_x1] - _tile_data[tile_data.shape_x2])
					{
						case -1: //Normal
							_tile_x1 = _tile_x + _tile_data[tile_data.shape_x1];
							_tile_y1 = _tile_y + _tile_data[tile_data.shape_y1];
							_tile_slope = _tile_data[tile_data.slope];
							_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
							_new_pos = min(_tile_slope * _x1, _tile_slope * _x2) + _y_intercept;
							break;
						case 0:
							_new_pos = _tile_y + min(_tile_data[tile_data.shape_y1], _tile_data[tile_data.shape_y2]);
							break;
						case 1: //Inverted
							_tile_x1 = _tile_x + _tile_data[tile_data.shape_x2];
							_tile_y1 = _tile_y + _tile_data[tile_data.shape_y2];
							_tile_slope = -_tile_data[tile_data.slope];
							_y_intercept = _tile_y1 - _tile_slope * _tile_x1;
							_new_pos = min(_tile_slope * _x1, _tile_slope * _x2) + _y_intercept;
							break;
					}
			
					if (_y >= _new_pos)
					{
						if (_collide)
							_collision = true;
						else
							return true;
					}
					break;
			}
		
			if (_collision)
			{
				_collider_collision = global.collider_collision;
				_collider_collision[collider_collision.collider] = undefined;
				_collider_collision[collider_collision.x] = _x1;
				_collider_collision[collider_collision.y] = min(_new_pos, _collider_collision[collider_collision.y]);
				_collider_collision[collider_collision.angle] = _angle;
				_collider_collision[collider_collision.behavior] = _behavior;
				_collider_collision[collider_collision.is_tilemap] = true;
				_collider_collision[collider_collision.cell_x] = _cell_x;
				_collider_collision[collider_collision.cell_y] = _cell_y;
				return true;
			}
		}

	    return false;
	}
#endregion
