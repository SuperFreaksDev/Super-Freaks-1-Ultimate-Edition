enum collider_flags
{
	player = 1 << 0,
	enemy = 1 << 1,
	attack = 1 << 2,
	misc = 1 << 3,
}

enum collider_behaviors_non_solid
{
	NA = 0,
	floor_top,
	gravity_low,
	gravity_high,
	quicksand,
	climb_all,
	climb_vertical,
}

enum collider_behaviors_solid
{
	NA = 0,
	breakable,
	ice,
	sticky,
	bouncy,
	hazard,
	rail,
	rail_left,
	rail_right,
}

/// @function comp_collider
/// @param _x_offset = 0
/// @param _y_offset = 0
function comp_collider(_x_offset = 0, _y_offset = 0) constructor
{
	owner = other;
	collision_flags_set_all();
	x_offset = _x_offset;
	y_offset = _y_offset;
	x_offset_previous = _x_offset;
	y_offset_previous = _y_offset;
	flags = 0;
	behavior = array_create(4, collider_behaviors_solid.NA);
	callback = array_create(4);
	callback[0] = function(){};
	callback[1] = function(){};
	callback[2] = function(){};
	callback[3] = function(){};
	attach_list = [];
	
	/// @function step
	static step = function()
	{
		x_offset_previous = x_offset;
		y_offset_previous = y_offset;
	}
	
	/// @function move
	static move = function()
	{
		var _self = self;
		var _attach_list = attach_list;
		var _i;
		var _x_delta, _y_delta;
		var _instance;
		
		_x_delta = (owner.x - owner.x_previous) + (x_offset - x_offset_previous);
		_y_delta = (owner.y - owner.y_previous) + (y_offset - y_offset_previous);
		
		for (_i = array_length(_attach_list) - 1; _i >= 0; --_i)
		{
			_instance = _attach_list[_i];
			
			if (!instance_exists(_instance) || (_instance.collider_attach[collider_attach_data.collider] != _self))
			{
				array_delete(_attach_list, _i, 1);
				continue;
			}
			
			with (_instance)
			{
				x += _x_delta;
				y += _y_delta;
				collider_attach[collider_attach_data.speed_x] = _x_delta;
				collider_attach[collider_attach_data.speed_y] = _y_delta;
			}
		}
	}
	
	array_push(other.comp_list_collider, weak_ref_create(self));
}

/// @function comp_collider_AABB
/// @param _x_offset = 0
/// @param _y_offset = 0
/// @param _shape_x1 = 0
/// @param _shape_y1 = 0
/// @param _shape_x2 = 0
/// @param _shape_y2 = 0
function comp_collider_AABB(_x_offset = 0, _y_offset = 0, _shape_x1 = 0, _shape_y1 = 0, _shape_x2 = 0, _shape_y2 = 0) : comp_collider(_x_offset, _y_offset) constructor
{
	shape_x1 = _shape_x1;
	shape_y1 = _shape_y1;
	shape_x2 = _shape_x2;
	shape_y2 = _shape_y2;
	shape_x1_previous = _shape_x1;
	shape_y1_previous = _shape_y1;
	shape_x2_previous = _shape_x2;
	shape_y2_previous = _shape_y2;
	
	/// @function step
	static step = function()
	{
		x_offset_previous = x_offset;
		y_offset_previous = y_offset;
		shape_x1_previous = shape_x1;
		shape_y1_previous = shape_y1;
		shape_x2_previous = shape_x2;
		shape_y2_previous = shape_y2;
	}
	
	/// @function move
	static move = function()
	{
		var _self = self;
		var _attach_list = attach_list;
		var _i;
		var _shape_x1 = shape_x1, _shape_y1 = shape_y1, _shape_x2 = shape_x2, _shape_y2 = shape_y2;
		var _x_delta, _y_delta, _shape_x1_delta, _shape_y1_delta, _shape_x2_delta, _shape_y2_delta;
		var _instance;
		
		_x_delta = (owner.x - owner.x_previous) + (x_offset - x_offset_previous);
		_y_delta = (owner.y - owner.y_previous) + (y_offset - y_offset_previous);
		_shape_x1_delta = _x_delta + (_shape_x1 - shape_x1_previous);
		_shape_y1_delta = _y_delta + (_shape_y1 - shape_y1_previous);
		_shape_x2_delta = _x_delta + (_shape_x2 - shape_x2_previous);
		_shape_y2_delta = _y_delta + (_shape_y2 - shape_y2_previous);
		
		for (_i = array_length(_attach_list) - 1; _i >= 0; --_i)
		{
			_instance = _attach_list[_i];
			
			if (!instance_exists(_instance) || (_instance.collider_attach[collider_attach_data.collider] != _self))
			{
				array_delete(_attach_list, _i, 1);
				continue;
			}
			
			with (_instance)
			{
				x += _x_delta;
				if (collider_attach[collider_attach_data.collision_y] < _y_delta)
				{
					y += _shape_y1_delta;
					collider_attach[collider_attach_data.collision_y] = _shape_y1;
				}
				else
				{
					y += _shape_y2_delta;
					collider_attach[collider_attach_data.collision_y] = _shape_y2;
				}
				collider_attach[collider_attach_data.speed_x] = _x_delta;
				collider_attach[collider_attach_data.speed_y] = _y_delta;
			}
		}
	}
}

/// @function comp_collider_line
/// @param _x_offset = 0
/// @param _y_offset = 0
/// @param _shape_x1 = 0
/// @param _shape_y1 = 0
/// @param _shape_x2 = 0
/// @param _shape_y2 = 0
function comp_collider_line(_x_offset = 0, _y_offset = 0, _shape_x1 = 0, _shape_y1 = 0, _shape_x2 = 0, _shape_y2 = 0) : comp_collider_AABB(_x_offset, _y_offset, _shape_x1, _shape_y1, _shape_x2, _shape_y2) constructor
{
	angle = point_direction(_shape_x1, _shape_y1, _shape_x2, _shape_y2);
	angle_previous = angle;
	
	/// @function step
	static step = function()
	{
		x_offset_previous = x_offset;
		y_offset_previous = y_offset;
		shape_x1_previous = shape_x1;
		shape_y1_previous = shape_y1;
		shape_x2_previous = shape_x2;
		shape_y2_previous = shape_y2;
		angle_previous = angle;
	}
	
	/// @function move
	static move = function()
	{
		var _self = self;
		var _comp_x, _comp_y, _comp_x_previous, _comp_y_previous, _comp_angle;
		var _attach_list = attach_list;
		var _i;
		var _x_delta, _y_delta;
		var _instance, _instance_x, _instance_y, _distance;
		var _collision_x, _collision_y;
		
		angle = point_direction(shape_x1, shape_y1, shape_x2, shape_y2);
		_comp_x = owner.x + x_offset + shape_x1;
		_comp_y = owner.y + y_offset + shape_y1;
		_comp_x_previous = owner.x_previous + x_offset_previous + shape_x1_previous;
		_comp_y_previous = owner.y_previous + y_offset_previous + shape_y1_previous;
		_comp_angle = angle;
		_x_delta = _comp_x - _comp_x_previous;
		_y_delta = _comp_y - _comp_y_previous;
		
		for (_i = array_length(_attach_list) - 1; _i >= 0; --_i)
		{
			_instance = _attach_list[_i];
			
			if (!instance_exists(_instance) || (_instance.collider_attach[collider_attach_data.collider] != _self))
			{
				array_delete(_attach_list, _i, 1);
				continue;
			}
			
			with (_instance)
			{
				_collision_x = collider_attach[collider_attach_data.collision_x];
				_collision_y = collider_attach[collider_attach_data.collision_y];
				_distance = point_distance(_comp_x_previous, _comp_y_previous, _collision_x, _collision_y);
				_instance_x = _comp_x + lengthdir_x(_distance, _comp_angle);
				_instance_y = _comp_y + lengthdir_y(_distance, _comp_angle);
				//collider_attach[collider_attach_data.speed_x] = _instance_x - _collision_x;
				//collider_attach[collider_attach_data.speed_y] = _instance_y - _collision_y;
				//show_debug_message("Distance: " + string(_distance));
				//show_debug_message("Old X: " + string(collider_attach[collider_attach_data.collision_x]) + ", Old Y: " + string(collider_attach[collider_attach_data.collision_y]));
				//show_debug_message("New X: " + string(_instance_x) + ", New Y: " + string(_instance_y));
				//show_debug_message("Speed X: " + string(collider_attach[collider_attach_data.speed_x]) + ", Speed Y: " + string(collider_attach[collider_attach_data.speed_y]));
				x += _instance_x - _collision_x;
				y += _instance_y - _collision_y;
				collider_attach[collider_attach_data.collision_x] = _instance_x;
				collider_attach[collider_attach_data.collision_y] = _instance_y;
			}
		}
	}
}

/// @function comp_collider_line_horizontal
/// @param _x_offset = 0
/// @param _y_offset = 0
/// @param _shape_x1 = 0
/// @param _shape_x2 = 0
function comp_collider_line_horizontal(_x_offset = 0, _y_offset = 0, _shape_x1 = 0, _shape_x2 = 0) : comp_collider(_x_offset, _y_offset) constructor
{
	shape_x1 = _shape_x1;
	shape_x2 = _shape_x2;
	shape_x1_previous = _shape_x1;
	shape_x2_previous = _shape_x2;
	
	/// @function step
	static step = function()
	{
		x_offset_previous = x_offset;
		y_offset_previous = y_offset;
		shape_x1_previous = shape_x1;
		shape_x2_previous = shape_x2;
	}
	
	/// @function move
	static move = function()
	{
		var _self = self;
		var _comp_x, _comp_y, _comp_x_previous, _comp_y_previous;
		var _attach_list = attach_list;
		var _i;
		var _x_delta, _y_delta;
		var _instance, _instance_x, _distance;
		
		_comp_x = owner.x + x_offset;
		_comp_y = owner.y + y_offset;
		_comp_x_previous = owner.x_previous + x_offset_previous;
		_comp_y_previous = owner.y_previous + y_offset_previous;
		_x_delta = _comp_x - _comp_x_previous;
		_y_delta = _comp_y - _comp_y_previous;
		
		for (_i = array_length(_attach_list) - 1; _i >= 0; --_i)
		{
			_instance = _attach_list[_i];
			
			if (!instance_exists(_instance) || (_instance.collider_attach[collider_attach_data.collider] != _self))
			{
				array_delete(_attach_list, _i, 1);
				continue;
			}
			
			with (_instance)
			{
				_distance = point_distance(_comp_x_previous, 0, collider_attach[collider_attach_data.collision_x], 0);
				_instance_x = _comp_x + lengthdir_x(_distance, 0);
				collider_attach[collider_attach_data.speed_x] = _instance_x - collider_attach[collider_attach_data.collision_x];
				collider_attach[collider_attach_data.speed_y] = _y_delta;
				x += collider_attach[collider_attach_data.speed_x];
				y += _y_delta;
				collider_attach[collider_attach_data.collision_x] = _instance_x;
				collider_attach[collider_attach_data.collision_y] += _y_delta;
			}
		}
	}
}

/// @function comp_collider_line_vertical
/// @param _x_offset = 0
/// @param _y_offset = 0
/// @param _shape_y1 = 0
/// @param _shape_y2 = 0
function comp_collider_line_vertical(_x_offset = 0, _y_offset = 0, _shape_y1 = 0, _shape_y2 = 0) : comp_collider(_x_offset, _y_offset) constructor
{
	shape_y1 = _shape_y1;
	shape_y2 = _shape_y2;
	shape_y1_previous = _shape_y1;
	shape_y2_previous = _shape_y2;
	
	/// @function step
	static step = function()
	{
		x_offset_previous = x_offset;
		y_offset_previous = y_offset;
		shape_y1_previous = shape_y1;
		shape_y2_previous = shape_y2;
	}
	
	/// @function move
	static move = function()
	{
		var _self = self;
		var _comp_x, _comp_y, _comp_x_previous, _comp_y_previous;
		var _attach_list = attach_list;
		var _i;
		var _x_delta, _y_delta;
		var _instance, _instance_y, _distance;
		
		_comp_x = owner.x + x_offset;
		_comp_y = owner.y + y_offset;
		_comp_x_previous = owner.x_previous + x_offset_previous;
		_comp_y_previous = owner.y_previous + y_offset_previous;
		_x_delta = _comp_x - _comp_x_previous;
		_y_delta = _comp_y - _comp_y_previous;
		
		for (_i = array_length(_attach_list) - 1; _i >= 0; --_i)
		{
			_instance = _attach_list[_i];
			
			if (!instance_exists(_instance) || (_instance.collider_attach[collider_attach_data.collider] != _self))
			{
				array_delete(_attach_list, _i, 1);
				continue;
			}
			
			with (_instance)
			{
				_distance = point_distance(0, _comp_y_previous, 0, collider_attach[collider_attach_data.collision_y]);
				_instance_y = _comp_y + lengthdir_y(_distance, 0);
				collider_attach[collider_attach_data.speed_x] = _x_delta;
				collider_attach[collider_attach_data.speed_y] = _instance_y - collider_attach[collider_attach_data.collision_y];
				x += _x_delta;
				y += collider_attach[collider_attach_data.speed_y];
				collider_attach[collider_attach_data.collision_x] += _x_delta;
				collider_attach[collider_attach_data.collision_y] = _instance_y;
			}
		}
	}
}

/// @function comp_collider_circle
/// @param _x_offset = 0
/// @param _y_offset = 0
/// @param _radius = 0
/// @param _angle = 0
function comp_collider_circle(_x_offset = 0, _y_offset = 0, _radius = 0, _angle) : comp_collider(_x_offset, _y_offset) constructor
{
	radius = _radius;
	radius_previous = _radius;
	
	angle = _angle;
	angle_previous = angle;
	
	/// @function step
	static step = function()
	{
		radius_previous = radius;
		angle_previous = angle;
	}
	
	/// @function move
	static move = function()
	{
		var _self = self;
		var _comp_x, _comp_y, _comp_x_previous, _comp_y_previous, _angle_delta;
		var _attach_list = attach_list;
		var _i;
		var _x_delta, _y_delta;
		var _instance, _instance_x, _instance_y, _direction;
		
		if (angle < 0)
			angle += 360;
		else
			angle = angle mod 360;
		
		_comp_x = owner.x + x_offset;
		_comp_y = owner.y + y_offset;
		_comp_x_previous = owner.x_previous + x_offset_previous;
		_comp_y_previous = owner.y_previous + y_offset_previous;
		_angle_delta = angle - angle_previous;
		_x_delta = _comp_x - _comp_x_previous;
		_y_delta = _comp_y - _comp_y_previous;
		
		for (_i = array_length(_attach_list) - 1; _i >= 0; --_i)
		{
			_instance = _attach_list[_i];
			
			if (!instance_exists(_instance) || (_instance.collider_attach[collider_attach_data.collider] != _self))
			{
				array_delete(_attach_list, _i, 1);
				continue;
			}
			
			with (_instance)
			{
				_direction = point_direction(_comp_x_previous, _comp_y_previous, collider_attach[collider_attach_data.collision_x], collider_attach[collider_attach_data.collision_y]) + _angle_delta;
				_instance_x = _comp_x + lengthdir_x(radius, _direction);
				_instance_y = _comp_y + lengthdir_y(radius, _direction);
				collider_attach[collider_attach_data.speed_x] = _instance_x - collider_attach[collider_attach_data.collision_x];
				collider_attach[collider_attach_data.speed_y] = _instance_y - collider_attach[collider_attach_data.collision_y];
				x += collider_attach[collider_attach_data.speed_x];
				y += collider_attach[collider_attach_data.speed_y];
				collider_attach[collider_attach_data.collision_x] = _instance_x;
				collider_attach[collider_attach_data.collision_y] = _instance_y;
			}
		}
	}
}
