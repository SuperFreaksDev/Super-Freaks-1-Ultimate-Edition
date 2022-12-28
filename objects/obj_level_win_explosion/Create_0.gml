/// @description Init

// Inherit the parent event
event_inherited();

animate_speed = 0.25;
image_xscale = 4;
image_yscale = 4;
music_stop();
game_timer_pause(true);
timer = new comp_timer(32, function()
{
	level_beat();
});
