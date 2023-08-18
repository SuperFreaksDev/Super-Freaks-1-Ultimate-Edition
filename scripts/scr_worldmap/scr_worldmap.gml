enum worldmap_icon_data
{
	status = 0,
	instance,
	x,
	y,
}

/// @function worldmap_init
function worldmap_init()
{
	var _i, _array, _story_mode;
	
	global.worldmap_icons = [];
	
	for (_story_mode = 0; _story_mode < story_modes.count; _story_mode++)
	{
		global.worldmap_icons[_story_mode] = array_create(array_length(global.levels));
	
		for (_i = 0; _i < array_length(global.worldmap_icons[_story_mode]); ++_i)
		{
			_array = array_create(4);
		
			_array[worldmap_icon_data.status] = level_status_get(_i, _story_mode);
			_array[worldmap_icon_data.instance] = undefined;
			_array[worldmap_icon_data.x] = undefined;
			_array[worldmap_icon_data.y] = undefined;
			global.worldmap_icons[_story_mode][_i] = _array;
		}
	
		global.worldmap_icons[_story_mode][level_ids.level_stadium][worldmap_icon_data.status] = level_status.open;
	}
}
