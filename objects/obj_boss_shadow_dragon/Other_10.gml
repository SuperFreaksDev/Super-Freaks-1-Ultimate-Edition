/// @description Step

var _array_length;
var _segment, _segment_previous, _segment_x_previous, _segment_y_previous;
var _speed_h, _speed_v, _player;
var _point_dir, _point_speed, _point_damp;

event_inherited();

timer = max(timer - 1, 0);
if (timer == clamp(timer, 1, 240))
{
	_player = player_nearest_to_point_alive(x, y);

	if (!is_undefined(_player))
	{
		_point_dir = point_direction(x, y,_player.x, _player.y);
		_point_speed = max(speed, 0);
		_point_damp = clamp(0.025, 0, 1);

		direction -= clamp(angle_difference(direction, _point_dir) * _point_damp, -_point_speed, _point_speed);
	}
}

_speed_h = lengthdir_x(speed, direction);
_speed_v = lengthdir_y(speed, direction);
	
x += _speed_h;
y += _speed_v;

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