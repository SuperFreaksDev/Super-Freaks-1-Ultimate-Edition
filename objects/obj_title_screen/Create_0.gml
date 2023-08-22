/// @description Init

// Inherit the parent event
event_inherited();

//text = "ALPHA 13\n7/23/2023\nBy SuperFreaksDev\nOriginal Game: 2006 - 2016";
text = "RC 3\nBy SuperFreaksDev/Joe Mama\nOriginal Game: 2006 - 2016";
music_set(msc_title);
music_play();
camera = new comp_camera(room_width / 2, room_height / 2);
depth = -5;