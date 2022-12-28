/// @description 

// Inherit the parent event
event_inherited();

animate_speed = 0.125;
rotate_previous = 0;
rotate = 0;

spikeball[0][0] = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.hazard, 0, 16);
spikeball[0][1] = 0;
spikeball[0][2] = 0;
spikeball[1][0] = new comp_hitbox_circle(,,, enemy_hitbox_behaviors.hazard, 0, 16);
spikeball[1][1] = 0;
spikeball[1][2] = 0;
despawn_area[0] = -spikeball_distance - 16;
despawn_area[1] = -spikeball_distance - 16;
despawn_area[2] = spikeball_distance + 16;
despawn_area[3] = spikeball_distance + 16;