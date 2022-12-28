/// @description Init

// Inherit the parent event
event_inherited();

sprite_index = -1;
sprite_next = -1;
sprite_alpha = 0;

text = string("");
text_next = string("");
text_draw = 0;

segment = [];
segment_current = -1;

depth = -9997;
animate_speed = 0.125;

cutscene_segment_set(0, "What's up gamers");