enum hitbox_flags
{
	player = 1 << 0,
	enemy = 1 << 1,
	attack = 1 << 2,
	collectible = 1 << 3,
	misc = 1 << 4,
}

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
	owner = other;
	active = _active;
	behavior = _behavior;
	priority = _priority;
	x_offset = _x_offset;
	y_offset = _y_offset;
	flags = 0;
	flags_to_check = 0;
	
	array_push(other.comp_list_hitbox, weak_ref_create(self));
}

/// @function comp_hitbox_AABB
function comp_hitbox_AABB(_x_offset = 0, _y_offset = 0, _active = hitbox_active.passive, _behavior = 0, _priority = 0, _shape_x1 = 0, _shape_y1 = 0, _shape_x2 = 0, _shape_y2 = 0) : comp_hitbox(_x_offset, _y_offset, _active, _behavior, _priority) constructor
{
	shape_x1 = _shape_x1;
	shape_y1 = _shape_y1;
	shape_x2 = _shape_x2;
	shape_y2 = _shape_y2;
}

/// @function comp_hitbox_line
function comp_hitbox_line(_x_offset = 0, _y_offset = 0, _active = hitbox_active.passive, _behavior = 0, _priority = 0, _shape_x1 = 0, _shape_y1 = 0, _shape_x2 = 0, _shape_y2 = 0) : comp_hitbox_AABB(_x_offset, _y_offset, _active, _behavior, _priority, _shape_x1, _shape_y1, _shape_x2, _shape_y2) constructor
{
	
}

/// @function comp_hitbox_circle
function comp_hitbox_circle(_x_offset = 0, _y_offset = 0, _active = hitbox_active.passive, _behavior = 0, _priority = 0, _radius = 0) : comp_hitbox(_x_offset, _y_offset, _active, _behavior, _priority) constructor
{
	radius = _radius;
}

/// @function hitbox_bitmask_set
/// @param {Boolean} _player = false
/// @param {Boolean} _enemy = false
/// @param {Boolean} _attack = false
/// @param {Boolean} _collectible = false
/// @param {Boolean} _misc = false
function hitbox_bitmask_set(_player = false, _enemy = false, _attack = false, _collectible = false, _misc = false)
{
	if (_player)
		flags |= 1 << hitbox_flags.player;
	if (_enemy)
		flags |= 1 << hitbox_flags.enemy;
	if (_attack)
		flags |= 1 << hitbox_flags.attack;
	if (_collectible)
		flags |= 1 << hitbox_flags.collectible;
	if (_misc)
		flags |= 1 << hitbox_flags.misc;
		
	gml_pragma("forceinline");
}

/// @function hitbox_bitmask_clear
/// @param {Boolean} _player = false
/// @param {Boolean} _enemy = false
/// @param {Boolean} _attack = false
/// @param {Boolean} _collectible = false
/// @param {Boolean} _misc = false
function hitbox_bitmask_clear(_player = false, _enemy = false, _attack = false, _collectible = false, _misc = false)
{
	if (_player)
		flags &= ~(1 << hitbox_flags.player);
	if (_enemy)
		flags &= ~(1 << hitbox_flags.enemy);
	if (_attack)
		flags &= ~(1 << hitbox_flags.attack);
	if (_collectible)
		flags &= ~(1 << hitbox_flags.collectible);
	if (_misc)
		flags &= ~(1 << hitbox_flags.misc);
		
	gml_pragma("forceinline");
}

/// @function hitbox_bitmask_to_check_set
/// @param {Boolean} _player = false
/// @param {Boolean} _enemy = false
/// @param {Boolean} _attack = false
/// @param {Boolean} _collectible = false
/// @param {Boolean} _misc = false
function hitbox_bitmask_to_check_set(_player = false, _enemy = false, _attack = false, _collectible = false, _misc = false)
{
	if (_player)
		flags_to_check |= 1 << hitbox_flags.player;
	if (_enemy)
		flags_to_check |= 1 << hitbox_flags.enemy;
	if (_attack)
		flags_to_check |= 1 << hitbox_flags.attack;
	if (_collectible)
		flags_to_check |= 1 << hitbox_flags.collectible;
	if (_misc)
		flags_to_check |= 1 << hitbox_flags.misc;
		
	gml_pragma("forceinline");
}

/// @function hitbox_bitmask_to_check_clear
/// @param {Boolean} _player = false
/// @param {Boolean} _enemy = false
/// @param {Boolean} _attack = false
/// @param {Boolean} _collectible = false
/// @param {Boolean} _misc = false
function hitbox_bitmask_to_check_clear(_player = false, _enemy = false, _attack = false, _collectible = false, _misc = false)
{
	if (_player)
		flags_to_check &= ~(1 << hitbox_flags.player);
	if (_enemy)
		flags_to_check &= ~(1 << hitbox_flags.enemy);
	if (_attack)
		flags_to_check &= ~(1 << hitbox_flags.attack);
	if (_collectible)
		flags_to_check &= ~(1 << hitbox_flags.collectible);
	if (_misc)
		flags_to_check &= ~(1 << hitbox_flags.misc);
		
	gml_pragma("forceinline");
}
