/// @description Init

//Re:connect Super Freaks HD 1.5 2.8 0.2 3 1/2 Dream Drop Distance Birth by Sleep A Fragmentary Passage Final Chapter Prologue

// Inherit the parent event
event_inherited();

animation = 0;
animation_previous = 0;
depth = -9999;

state_machine_init();
state_next_set(pause_menu_states.opening);

if (input_player_connected_count() == 0)
	global.player_lead = undefined;