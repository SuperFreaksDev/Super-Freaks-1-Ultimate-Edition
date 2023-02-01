/// @description 

instance_destroy();
sfx_play_global(sfx_heart);
global.hearts = min(global.hearts + 1, hearts_maximum_get());