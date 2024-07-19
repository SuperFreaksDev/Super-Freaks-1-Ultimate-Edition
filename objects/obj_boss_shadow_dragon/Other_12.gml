/// @description Spawn

var _segment, _i;

// Inherit the parent event
event_inherited();

for (_segment = 0; _segment <= segments; ++_segment)
{
	array_resize(hitbox[_segment][1], 0);
	for (_i = 0; _i <= SKIZZORPEDE_SEGMENT_LENGTH; ++_i)
	{
		array_insert(hitbox[_segment][1], 0, [x, y]);
	}
}