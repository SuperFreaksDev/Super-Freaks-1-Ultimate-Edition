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
	var _i, _array;
	
	global.worldmap_icons = array_create(array_length(global.levels));
	
	for (_i = 0; _i < array_length(global.worldmap_icons); ++_i)
	{
		_array = array_create(4);
		
		_array[worldmap_icon_data.status] = level_status.locked;
		_array[worldmap_icon_data.instance] = undefined;
		_array[worldmap_icon_data.x] = undefined;
		_array[worldmap_icon_data.y] = undefined;
		global.worldmap_icons[_i] = _array;
	}
	
	global.worldmap_icons[1][worldmap_icon_data.status] = level_status.open;
}
