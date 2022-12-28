/// @description Init

var _radius;

// Inherit the parent event
event_inherited();

image_xscale = abs(image_xscale);
image_yscale = image_xscale;
_radius = sprite_get_width(sprite_index) * image_xscale / 2;
speed_h = speed_move_x;
speed_v = speed_move_y;
animate_speed = 0.125;

hitbox = new comp_hitbox_circle(,,,enemy_hitbox_behaviors.hazard,, _radius);
collider_detector_up_set(-_radius + 4, 0, _radius - 4, 0, -_radius);
collider_detector_down_set(-_radius + 4, 0, _radius - 4, 0, _radius);
collider_detector_sides_set(-_radius + 4, 0, _radius - 4, 0, _radius);