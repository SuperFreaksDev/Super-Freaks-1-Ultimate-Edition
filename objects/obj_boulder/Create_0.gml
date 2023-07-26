/// @description Init

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,,,, 0);
image_index = choose(0, 1);
speed_y = 0;
can_despawn = false;
angle_speed = random_range(-5, 5);
angle = random(360);
angle_previous = angle;
switch (image_index)
{
	case 0:
		hitbox.radius = 100;
		collider_detector_down_set(-50, 0, 50, 0, 100);
		break;
	case 1:
		hitbox.radius = 64;
		collider_detector_down_set(-32, 0, 32, 0, 64);
		break;
}
depth = 2;