/// @description 

global.trophies = bit_set(global.trophies, trophy_id);
sfx_play_global(sfx_unlock_level);
instance_destroy();
