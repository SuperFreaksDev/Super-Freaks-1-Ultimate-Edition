/// @description Init
var _segment, _i;

// Inherit the parent event
event_inherited();

my_path_pos_start = path_closest_point(my_path, x, y);
path_position = my_path_pos_start;
x = path_get_x(my_path, path_position);
y = path_get_y(my_path, path_position);
speed_path = my_speed;
SKIZZORPEDE_SEGMENT_LENGTH = floor(32 / abs(speed_path));

animate_speed = 0.125;

hitbox = [];

for (_segment = 0; _segment <= segments; ++_segment)
{
	hitbox[_segment][0] = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.hazard,, 16);
	hitbox[_segment][1] = [];
	
	for (_i = 0; _i <= SKIZZORPEDE_SEGMENT_LENGTH; ++_i)
	{
		array_insert(hitbox[_segment][1], 0, [x, y]);
	}
}