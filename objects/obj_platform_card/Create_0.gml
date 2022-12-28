/// @description Init

var _i;
var _card, _card_count;

// Inherit the parent event
event_inherited();

card_extend_previous = 0;
card_extend = 0;
delay_timer = 0;
state_next_set(0);

collider_horizontal = new comp_collider_AABB(,, -32, -48, 32, 48);
with (collider_horizontal)
	collision_flags_set_all(true, true, true, true);
collider_vertical = new comp_collider_AABB(,, -32, -48, 32, 48);
with (collider_vertical)
	collision_flags_set_all(true, true, true, true);

for (_i = 0; _i < array_length(card_direction); ++_i)
{
	switch (card_direction[_i])
	{
		case "Left":
			despawn_area[0] = -(32 * card_amount);
			break;
		case "Up":
			despawn_area[1] = -(48 * card_amount);
			break;
		case "Right":
			despawn_area[2] = (32 * card_amount);
			break;
		case "Down":
			despawn_area[3] = (48 * card_amount);
			break;
	}
}