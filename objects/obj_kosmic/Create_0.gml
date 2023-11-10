/// @description Init

// Inherit the parent event
event_inherited();

if (image_angle < 0)
	image_angle += 360;

laser = new comp_hitbox_AABB(,,, enemy_hitbox_behaviors.hazard,, -4, -4, 4, 4);
hitbox = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.normal,, 24);
face = round(image_angle / 90);
speed_h = speed_move_x;
speed_v = speed_move_y;
attack_x = x;
attack_y = y;
animate_speed = 0.25;

collider_detector_up_set(-8,, 8,, -24);
collider_detector_sides_set(-8,, 8,, 24);
collider_detector_down_set(-8,, 8,, 24);