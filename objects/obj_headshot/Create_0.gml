/// @description Init

// Inherit the parent event
event_inherited();

if (image_angle < 0)
	image_angle += 360;

speed_move = 0;
speed_acc = 0.125;
hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.normal,, 24);
face = round(image_angle / 90);
state_next_set(0);
timer = 0;

collider_detector_up_set(-8,, 8,, -24);
collider_detector_sides_set(-8,, 8,, 24);
collider_detector_down_set(-8,, 8,, 24);