/// @description 

// Inherit the parent event
event_inherited();

animate = 0;
depth = -9998;
state_next_set(0);
game_timer_pause(true);
music_stop();
audio_stop_all();
sfx_play_global(msc_gameover);
global.frame_machine_level.pause = true;
global.frame_machine_player.pause = true;