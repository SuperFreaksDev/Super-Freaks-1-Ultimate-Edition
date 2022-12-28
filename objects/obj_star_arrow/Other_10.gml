/// @description Step

rotate_effect_previous = rotate_effect mod 360;
rotate_effect = rotate_effect_previous + rotate_speed;
rotate_speed = max(rotate_speed - 0.25, 1);
hitbox.radius = min(hitbox.radius + 2, 32);
