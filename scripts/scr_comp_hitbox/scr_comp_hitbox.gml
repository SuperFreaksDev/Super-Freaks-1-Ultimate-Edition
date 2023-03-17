enum hitbox_active
{
	inactive = 0,
	active,
	passive,
}

/// @function comp_hitbox
/// @param {Real} _x_offset = 0
/// @param {Real} _y_offset = 0
/// @param _active = hitbox_active.passive
/// @param {Int} _behavior = 0
/// @param {Int} _priority = 0
function comp_hitbox(_x_offset = 0, _y_offset = 0, _active = hitbox_active.passive, _behavior = 0, _priority = 0) constructor
{
	var _weak_ref = weak_ref_create(self);
	
	owner = other;
	active = _active;
	behavior = _behavior;
	priority = _priority;
	priority_previous = _priority;
	x_offset = _x_offset;
	y_offset = _y_offset;
	
	with (owner)
	{
		array_push(comp_list_hitbox, _weak_ref);
		hitbox_sort_flag = true;
	}
	
	/// @function draw
	static draw = function()
	{
		var _x = owner.x + x_offset;
		var _y = owner.y + y_offset;
		draw_point(_x, _y);
	}
}

/// @function comp_hitbox_AABB
function comp_hitbox_AABB(_x_offset = 0, _y_offset = 0, _active = hitbox_active.passive, _behavior = 0, _priority = 0, _shape_x1 = 0, _shape_y1 = 0, _shape_x2 = 0, _shape_y2 = 0) : comp_hitbox(_x_offset, _y_offset, _active, _behavior, _priority) constructor
{
	shape_x1 = _shape_x1;
	shape_y1 = _shape_y1;
	shape_x2 = _shape_x2;
	shape_y2 = _shape_y2;
	
	/// @function draw
	static draw = function()
	{
		var _x = owner.x + x_offset;
		var _y = owner.y + y_offset;
		draw_rectangle(_x + shape_x1, _y + shape_y1, _x + shape_x2, _y + shape_y2, false);
	}
}

/// @function comp_hitbox_line
function comp_hitbox_line(_x_offset = 0, _y_offset = 0, _active = hitbox_active.passive, _behavior = 0, _priority = 0, _shape_x1 = 0, _shape_y1 = 0, _shape_x2 = 0, _shape_y2 = 0) : comp_hitbox_AABB(_x_offset, _y_offset, _active, _behavior, _priority, _shape_x1, _shape_y1, _shape_x2, _shape_y2) constructor
{
	/// @function draw
	static draw = function()
	{
		var _x = owner.x + x_offset;
		var _y = owner.y + y_offset;
		draw_line(_x + shape_x1, _y + shape_y1, _x + shape_x2, _y + shape_y2);
	}
}

/// @function comp_hitbox_capsule
function comp_hitbox_capsule(_x_offset = 0, _y_offset = 0, _active = hitbox_active.passive, _behavior = 0, _priority = 0, _shape_x1 = 0, _shape_y1 = 0, _shape_x2 = 0, _shape_y2 = 0, _radius = 0) : comp_hitbox_AABB(_x_offset, _y_offset, _active, _behavior, _priority, _shape_x1, _shape_y1, _shape_x2, _shape_y2) constructor
{
	radius = _radius;
	
	/// @function draw
	static draw = function()
	{
		var _x = owner.x + x_offset;
		var _y = owner.y + y_offset;
		draw_circle(_x + shape_x1, _y + shape_y1, radius, false);
		draw_circle(_x + shape_x2, _y + shape_y2, radius, false);
		draw_line_width(_x + shape_x1, _y + shape_y1, _x + shape_x2, _y + shape_y2, radius);
	}
}

/// @function comp_hitbox_circle
function comp_hitbox_circle(_x_offset = 0, _y_offset = 0, _active = hitbox_active.passive, _behavior = 0, _priority = 0, _radius = 0) : comp_hitbox(_x_offset, _y_offset, _active, _behavior, _priority) constructor
{
	radius = _radius;
	
	/// @function draw
	static draw = function()
	{
		var _x = owner.x + x_offset;
		var _y = owner.y + y_offset;
		draw_circle(_x, _y, radius, false);
	}
}

/// @function comp_hitbox_triangle
function comp_hitbox_triangle(_x_offset = 0, _y_offset = 0, _active = hitbox_active.passive, _behavior = 0, _priority = 0, _shape_x1 = 0, _shape_y1 = 0, _shape_x2 = 0, _shape_y2 = 0, _shape_x3 = 0, _shape_y3 = 0) : comp_hitbox_AABB(_x_offset, _y_offset, _active, _behavior, _priority, _shape_x1, _shape_y1, _shape_x2, _shape_y2) constructor
{
	shape_x3 = _shape_x3;
	shape_y3 = _shape_y3;
	
	/// @function draw
	static draw = function()
	{
		var _x = owner.x + x_offset;
		var _y = owner.y + y_offset;
		draw_triangle(_x + shape_x1, _y + shape_y1, _x + shape_x2, _y + shape_y2, _x + shape_x3, _y + shape_y3, false);
	}
}