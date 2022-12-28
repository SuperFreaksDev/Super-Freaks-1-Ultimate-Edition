/// @description Init

// Inherit the parent event
event_inherited();

animation = 0;
animation_previous = 0;
player_number = 0;
hint = "";
depth = -9998;

state_machine_init();
state_next_set(pause_menu_states.opening);