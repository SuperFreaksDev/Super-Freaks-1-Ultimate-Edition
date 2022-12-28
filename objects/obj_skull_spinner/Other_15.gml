/// @description Death

enemy_killed_create(, 1,,,,, player_hit_speed_x * 2,,);
enemy_killed_create(, 0,,,, angle, player_hit_speed_x,,);
sfx_play_global(sfx_zip);
instance_destroy();