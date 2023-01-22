/// @description Death

enemy_killed_create(,,,,,, player_hit_speed_x,,);
yorbs_add(yorb_amount);
yorb_collect_effect(,, yorb_amount);
sfx_play_global(sfx_zip);
instance_destroy();