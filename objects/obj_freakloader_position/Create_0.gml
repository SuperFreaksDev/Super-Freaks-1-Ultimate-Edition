/// @desc Init

event_inherited();

anim =
[
	player_animations.idle,
	player_animations.walk,
	player_animations.skid,
	player_animations.hurt,
	player_animations.death,
	player_animations.air,
	player_animations.jump,
	player_animations.wall_slide,
	player_animations.hang,
	player_animations.climb,
	player_animations.pole_climb,
	player_animations.pole_turn,
	player_animations.rail_grind
];

animNum    = 0;
animFrame  = 0;
customChar = "example";

dummy =
{
	sprite: player_animation_get(0, anim[animNum]),
	xOrig:  24,
	YOrig:  40,
}
custom =
{
	x: (window_get_width() / 4) + 64,
	y: floor(room_height / 2.5),
	sprite: player_animation_get(global.custom_character_indexes[$ customChar], anim[animNum]),
	XOrig:  24,
	YOrig:  40,
}