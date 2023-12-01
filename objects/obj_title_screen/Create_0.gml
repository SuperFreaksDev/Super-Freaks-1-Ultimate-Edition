/// @description Init

// Inherit the parent event
event_inherited();

//text = "ALPHA 13\n7/23/2023\nBy SuperFreaksDev\nOriginal Game: 2006 - 2016";
text = "v2.0 RC 1\n11/30/2023\nBy SuperFreaksDev/Joe Mama\nOriginal Game: 2006 - 2016";
camera = new comp_camera(room_width / 2, room_height / 2);
depth = -5;

gml_pragma("UnityBuild", "true");