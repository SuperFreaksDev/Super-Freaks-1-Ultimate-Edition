/// @description Init

// Inherit the parent event
event_inherited();

//Dino standing before the Super Freaks
cutscene_segment_set(0, "Dino: Stop right there!'", spr_cutscene_dino_1,,, msc_cutscene_normal);
cutscene_segment_set(1, "King Quincy: 'Hey, Dino.'");
//Dino dramatically holding a lightsaber
cutscene_segment_set(2, "Dino: 'Don't 'hey Dino' me. That little pizza stunt may have gotten you in the castle, but you royally ticked me off!'", spr_cutscene_dino_2,,,,, cutscene_transitions.NA);
cutscene_segment_set(3, "'I have proudly served the sons of Marrow Prime for my whole life, and I'll cut you to ribbons for them!'");
cutscene_segment_set(4, "King Quincy: 'Did you forget something?'");
//Dino's pants fell down
cutscene_segment_set(5, "Dino: 'Interesting last words for...MY PANTS!!!!'", spr_cutscene_dino_3,,,,, cutscene_transitions.NA);
cutscene_segment_set(6, "'That does it! You won't live to repeat this!'");