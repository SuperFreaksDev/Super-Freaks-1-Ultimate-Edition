/// @description Init

var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _screen_width_half = _screen_width / 2;
var _screen_height_half = _screen_height / 2;
var _start_x, _start_y;
var _i = 0;

level_num = 1;
level_id = -1;
target_x = 0;
target_y = 0;

text_world = "";
text_level = "";
trophies = 0;
trophies_max = 0;

// Inherit the parent event
event_inherited();

with (obj_worldmap_icon)
{
	global.worldmap_icons[global.story_mode][level_id][worldmap_icon_data.x] = x;
	global.worldmap_icons[global.story_mode][level_id][worldmap_icon_data.y] = y;
	global.worldmap_icons[global.story_mode][level_id][worldmap_icon_data.instance] = id;
	switch (global.worldmap_icons[global.story_mode][level_id][worldmap_icon_data.status])
	{
		case level_status.locked:
			visible = false;
			image_index = 0;
			break;
		case level_status.open:
			visible = true;
			image_index = 0;
			break;
		case level_status.clear_normal:
			visible = true;
			image_index = 1;
			break;
		case level_status.clear_perfect:
			visible = true;
			image_index = 2;
			break;
	}
}

frame = 0;

depth = -9995;

_start_x = global.worldmap_icons[global.story_mode][global.level_id][worldmap_icon_data.x];
if (is_undefined(_start_x))
	_start_x = 0;
_start_y = global.worldmap_icons[global.story_mode][global.level_id][worldmap_icon_data.y];
if (is_undefined(_start_y))
	_start_y = 0;

instance_create(obj_worldmap_player, _start_x, _start_y);
camera = new comp_camera(clamp(_start_x, _screen_width_half, room_width - _screen_width_half), clamp(_start_y, _screen_height_half, room_height - _screen_height_half));
view_reset(camera.x, camera.y);

for (_i = 0; _i < array_length(global.worldmap_icons[global.story_mode]); ++_i)
{
	if (global.worldmap_icons[global.story_mode][_i][worldmap_icon_data.status] == level_status_get(_i))
		continue;
	else
	{
		if (is_undefined(global.worldmap_icons[global.story_mode][_i][worldmap_icon_data.instance]))
			continue;
		else
		{
			level_num = _i;
			state_next_set(1);
			exit;
		}
	}
}
state_next_set(3);
