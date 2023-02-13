/// @description Init

// Inherit the parent event
event_inherited();

button_left = controls_action_states.NA;
button_right = controls_action_states.NA;
button_up = controls_action_states.NA;
button_down = controls_action_states.NA;
button_pause = controls_action_states.NA;
button_jump = controls_action_states.NA;
button_deny = controls_action_states.NA;

level_id = -1;

state_next_set(0);
hitbox = new comp_hitbox_AABB(,,hitbox_active.active,,, -16, -16, 16, 16);