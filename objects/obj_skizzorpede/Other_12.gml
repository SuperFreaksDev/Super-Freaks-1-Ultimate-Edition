/// @description Spawn

var _segment, _i;

// Inherit the parent event
event_inherited();

path_position = my_path_pos_start;
x = path_get_x(my_path, path_position);
y = path_get_y(my_path, path_position);

for (_segment = 0; _segment <= segments; ++_segment)
{
	array_resize(hitbox[_segment][1], 0);
	for (_i = 0; _i <= SKIZZORPEDE_SEGMENT_LENGTH; ++_i)
	{
		array_insert(hitbox[_segment][1], 0, [x, y]);
	}
}