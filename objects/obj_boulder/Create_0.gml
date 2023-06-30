/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,,,, 0);
image_index = choose(0, 1);
speed_y = 0;
can_despawn = false;
switch (image_index)
{
	case 0:
		hitbox.radius = 100;
		collider_detector_down_set(-100, 0, 100, 0, 100);
		break;
	case 1:
		hitbox.radius = 64;
		collider_detector_down_set(-64, 0, 64, 0, 64);
		break;
}