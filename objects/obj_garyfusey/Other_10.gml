/// @description Step

// Inherit the parent event
event_inherited();

if (countdown == true)
{
	sprite_index = spr_garyfusey_danger;
	animate_speed = 0.5;
	countdown_timer--;
	if (countdown_timer <= 0)
		event_user(5);
}
else
{
	sprite_index = spr_garyfusey_normal;
	animate_speed = 0.25;
}