/// @description Init

// Inherit the parent event
event_inherited();

cutscene_segment_set(0, "Super Freaks: 'YAAAAAAAA!!!!!!'", spr_cutscene_ending_secret_1,,, msc_cutscene_normal);
cutscene_segment_set(1, "Anti Freaks: 'YAAAAAAAA!!!!!!'", spr_cutscene_ending_secret_2,,,,, cutscene_transitions.NA);
cutscene_segment_set(2, "Super Freaks: 'YAAAAAAAA!!!!!!'", spr_cutscene_ending_secret_1,,,,, cutscene_transitions.NA);
cutscene_segment_set(3, "Anti Freaks: 'YAAAAAAAA!!!!!!'", spr_cutscene_ending_secret_2,,,,, cutscene_transitions.NA);
cutscene_segment_set(4, "Super Freaks: 'YAAAAAAAA!!!!!!'", spr_cutscene_ending_secret_3,,,,, cutscene_transitions.NA);
cutscene_segment_set(5, "Anti Freaks: 'YAAAAAAAA!!!!!!'", spr_cutscene_ending_secret_4,,,,, cutscene_transitions.NA);
cutscene_segment_set(6, "Anti Freaks: ?????????", spr_cutscene_ending_secret_4,,,, sfx_falling_piano_1, cutscene_transitions.NA);
//The Anti Freaks have been crushed by a falling piano
cutscene_segment_set(7, "", spr_cutscene_ending_secret_5,,,, sfx_falling_piano_2, cutscene_transitions.shake);
cutscene_segment_set(8, "", spr_cutscene_ending_secret_6,,,, sfx_yell_wilhelm, cutscene_transitions.NA);