/// @description Step

var _array_length;
var _segment_previous, _segment_x_previous, _segment_y_previous;
var _segment, _x_min, _x_max, _y_min, _y_max;

event_inherited();

path_move(my_path);

array_insert(hitbox[0][1], 0, [x, y]);
array_resize(hitbox[0][1], SKIZZORPEDE_SEGMENT_LENGTH);

for (_segment = 1; _segment <= segments; ++_segment)
{
	_array_length = array_length(hitbox[_segment - 1][1]);
	_segment_previous = hitbox[_segment - 1][1];
	_segment_x_previous = _segment_previous[_array_length - 1][0];
	_segment_y_previous = _segment_previous[_array_length - 1][1];
	array_insert(hitbox[_segment][1], 0, [_segment_x_previous, _segment_y_previous]);
	array_resize(hitbox[_segment][1], SKIZZORPEDE_SEGMENT_LENGTH);
		
	hitbox[_segment][0].x_offset = _segment_x_previous - x;
	hitbox[_segment][0].y_offset = _segment_y_previous - y;
}