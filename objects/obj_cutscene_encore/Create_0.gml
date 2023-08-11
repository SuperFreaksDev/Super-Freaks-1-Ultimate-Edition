/// @description Init

// Inherit the parent event
event_inherited();

//Anti Freaks
cutscene_segment_set(0, "Superior: 'Well, what a surprise! It appears you were able to find all of our trophies afterall.'", spr_cutscene_encore_1,,, msc_cutscene_normal);
cutscene_segment_set(1, "'If you could kindly wait here a moment for your reward...'");
//Anti Freaks huddling together in desperation
cutscene_segment_set(2, "'Now what do we do???'", spr_cutscene_encore_2,,,,, cutscene_transitions.NA);
cutscene_segment_set(3, "Negative Quincy: 'I don't know, this was your stupid idea!'",,,,,, cutscene_transitions.NA);
cutscene_segment_set(4, "Trash Can Man: 'Clearly those idiots cheated. There's no way they're actually that good!'");
cutscene_segment_set(5, "Geyzer: 'So we test their skills further. Time for Plan B.'");
//The Anti Freaks with construction equipment
cutscene_segment_set(6, "", spr_cutscene_encore_3);
//Exciting Encore
cutscene_segment_set(7, "Superior: 'Step inside our dome of torment--I mean uh, fun for a delightful time!'", spr_cutscene_encore_4);
cutscene_segment_set(8, "Tikiman: 'That's a death obstacle course you just threw together, isn't it?'");
cutscene_segment_set(9, "Negative Quincy: 'Nah, uhh, it's even got sick pyrotechnics and fancy music in there. You'll have a blast!'");