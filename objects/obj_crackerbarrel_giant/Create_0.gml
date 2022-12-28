/// @description Init

image_xscale = abs(image_xscale);
image_yscale = image_xscale;

// Inherit the parent event
event_inherited();

hitbox = new comp_hitbox_circle(,,,,, 56 * image_xscale);

can_despawn = false;
animate_speed = abs(speed_move) * 0.125;