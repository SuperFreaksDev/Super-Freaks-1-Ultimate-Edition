enum level_data
{
	status = 0,
	trophies,
	trophy_count,
	room,
	name_world,
	name_level,
	unlock_function,
	next_level,
	cutscene_room_begin,
	cutscene_room_end,
}

enum level_status
{
	locked = 0,
	open,
	clear_normal,
	clear_perfect,
}

enum level_ids
{
	test = 0,
	
	level_stadium,
	level_supersecret,
	level_supersecret_boss,
	
	level_normal_fruit,
	level_normal_sky,
	level_normal_fruit_secret,
	level_normal_boss,
	
	level_crazy_toy,
	level_crazy_park,
	level_crazy_toy_secret,
	level_crazy_boss,
	
	level_ludicrous_barrel,
	level_ludicrous_water,
	level_ludicrous_barrel_secret,
	level_ludicrous_boss,
	
	level_insane_hippie,
	level_insane_lightning,
	level_insane_hippie_secret,
	level_insane_boss,
	
	level_freaky_ice,
	level_freaky_star,
	level_freaky_ice_secret,
	level_freaky_boss,
	
	level_kranion_conveyor,
	level_kranion_moon,
	level_kranion_conveyor_secret,
	level_kranion_moon_secret,
	level_kranion_boss_secret,
	level_kranion_boss,
	level_kranion_final_boss,
	
	count,
}

enum level_lists
{
	normal = 0,
	completed,
	speedrun_normal,
	speedrun_crazy,
	speedrun_ludicrous,
	speedrun_insane,
	speedrun_freaky,
	speedrun_kranion,
	speedrun_stadium,
	speedrun_adventure,
	speedrun_secret,
	speedrun_ultimate,
	boss,
	demo,
	
	count,
}

/// @function levels_init
function levels_init()
{
	var _level_list, _i;
	
	global.levels = [];
	global.level_list = [];
	global.current_level_list = [];
	global.level_id = 1;
	global.level_demo = 0;
	
	for (_i = 0; _i < level_lists.count; ++_i)
	{
		array_push(global.level_list, []);
	}
	
	level_create(0, level_status.open, rm_test_1, "Test World", "Test Level");
	
	level_create(1, level_status.open, rm_stadium_1, "Mystic Island", "Super Freaks Stadium",,, rm_cutscene_intro, rm_cutscene_antifreaks_intro);
	level_create(2,,, "Mystic Island", "Exciting Encore",, 0);
	level_create(3,, rm_boss_antifreaks, "Mystic Island", "Vs Anti Freaks", function()
	{
		return level_complete_get(2);
	}, 0);
	
	//Normal World
	level_create(4,, rm_fruit_1, "Normal World", "Fruit Juice Factory", function()
	{
		return level_complete_get(1);
	});
	level_create(5,, rm_skyway_1, "Normal World", "Skyway Highway", function()
	{
		return level_complete_get(1);
	});
	level_create(6,, rm_secretfruit_1, "Normal World", "Fruit Juice Secret", function()
	{
		return level_perfect_get(4) && level_perfect_get(5);
	});
	level_create(7,, rm_boss_cinge, "Normal World", "Vs Cinge", function()
	{
		return (level_complete_get(4) && level_complete_get(5));
	}, 0);
	
	//Crazy World
	level_create(8,, rm_toy_1, "Crazy World", "Toy Block Bridge", function()
	{
		return level_complete_get(7);
	});
	level_create(9,, rm_park_1, "Crazy World", "Playful Park", function()
	{
		return level_complete_get(7);
	});
	level_create(10,, rm_secrettoy_1, "Crazy World", "Toy Block Secret", function()
	{
		return level_perfect_get(8) && level_perfect_get(9);
	});
	level_create(11,, rm_boss_milkman, "Crazy World", "Vs Milk Man", function()
	{
		return (level_complete_get(8) && level_complete_get(9));
	}, 0);
	
	//Ludicrous World
	level_create(12,, rm_canyon_1, "Ludicrous World", "Barrel Canyon Cliffs", function()
	{
		return level_complete_get(11);
	},, rm_cutscene_xfreaks);
	level_create(13,, rm_ship_1, "Ludicrous World", "Shipwreck Poopdeck", function()
	{
		return level_complete_get(11);
	});
	level_create(14,, rm_secretcanyon_1, "Ludicrous World", "Barrel Secret", function()
	{
		return (level_perfect_get(12) && level_perfect_get(13));
	});
	level_create(15,, rm_boss_megaklaw, "Ludicrous World", "Vs Mega Klaw", function()
	{
		return (level_complete_get(12) && level_complete_get(13));
	}, 0);
	
	//Insane World
	level_create(16,, rm_hippie_1, "Insane World", "Forever Flowery Fields", function()
	{
		return level_complete_get(15);
	});
	level_create(17,, rm_lightning_1, "Insane World", "Lightning Rod Lake", function()
	{
		return level_complete_get(15);
	});
	level_create(18,, rm_secrethippie_1, "Insane World", "Flowery Secret", function()
	{
		return (level_perfect_get(16) && level_perfect_get(17));
	});
	level_create(19,, rm_boss_larry, "Insane World", "Vs Larry McPeel", function()
	{
		return (level_complete_get(16) && level_complete_get(17));
	}, 0);
	
	//Freaky World
	level_create(20,, rm_ice_1, "Freaky World", "Cool n Chill Caverns", function(){
		return level_complete_get(19);
	},, rm_cutscene_freak_fathers);
	level_create(21,, rm_star_1, "Freaky World", "Starscraper", function()
	{
		return level_complete_get(19);
	});
	level_create(22,, rm_secretice_1, "Freaky World", "Cool n Chill Secret", function()
	{
		return (level_perfect_get(20) && level_perfect_get(21));
	});
	level_create(23,, rm_boss_francis, "Freaky World", "Vs Francis", function()
	{
		return (level_complete_get(20) && level_complete_get(21));
	}, 0);
	
	//Castle Kranion
	level_create(24,, rm_castle_1, "Castle Kranion", "Conveyor Castle", function()
	{
		return level_complete_get(23);
	});
	level_create(25,, rm_moon_1, "Castle Kranion", "Mecha Moon", function()
	{
		return level_complete_get(23);
	});
	level_create(26,, rm_secretcastle_1, "Castle Kranion", "Conveyor Secret", function()
	{
		return (level_perfect_get(24) && level_perfect_get(25));
	});
	level_create(27,, rm_secretmoon_1, "Castle Kranion", "Moon Secret", function()
	{
		return level_complete_get(6)
		&& level_complete_get(10)
		&& level_complete_get(14)
		&& level_complete_get(18)
		&& level_complete_get(22)
		&& level_complete_get(26);
	});
	level_create(28,,, "Castle Kranion", "Kranion's Secret Weapon", function()
	{
		return level_complete_get(27);
	}, 0);
	level_create(29,,, "Castle Kranion", "Vs Dino", function()
	{
		return (level_complete_get(24) && level_complete_get(25));
	}, 0);
	level_create(30,,, "Castle Kranion", "Vs Kranion", function()
	{
		return level_complete_get(29);
	}, 0);
	
	#region Level Lists
		#region Normal Run
			_level_list = global.level_list[level_lists.speedrun_normal];
			
			array_push(_level_list, level_ids.level_normal_fruit);
			array_push(_level_list, level_ids.level_normal_sky);
			array_push(_level_list, level_ids.level_normal_fruit_secret);
			array_push(_level_list, level_ids.level_normal_boss);
		#endregion
		
		#region Crazy Run
			_level_list = global.level_list[level_lists.speedrun_crazy];
			
			array_push(_level_list, level_ids.level_crazy_toy);
			array_push(_level_list, level_ids.level_crazy_park);
			array_push(_level_list, level_ids.level_crazy_toy_secret);
			array_push(_level_list, level_ids.level_crazy_boss);
		#endregion
		
		#region Ludicrous Run
			_level_list = global.level_list[level_lists.speedrun_ludicrous];
			
			array_push(_level_list, level_ids.level_ludicrous_barrel);
			array_push(_level_list, level_ids.level_ludicrous_water);
			array_push(_level_list, level_ids.level_ludicrous_barrel_secret);
			array_push(_level_list, level_ids.level_ludicrous_boss);
		#endregion
		
		#region Insane Run
			_level_list = global.level_list[level_lists.speedrun_insane];
			
			array_push(_level_list, level_ids.level_insane_hippie);
			array_push(_level_list, level_ids.level_insane_lightning);
			array_push(_level_list, level_ids.level_insane_hippie_secret);
			array_push(_level_list, level_ids.level_insane_boss);
		#endregion
		
		#region Freaky Run
			_level_list = global.level_list[level_lists.speedrun_freaky];
			
			array_push(_level_list, level_ids.level_freaky_ice);
			array_push(_level_list, level_ids.level_freaky_star);
			array_push(_level_list, level_ids.level_freaky_ice_secret);
			array_push(_level_list, level_ids.level_freaky_boss);
		#endregion
		
		#region Kranion Run
			_level_list = global.level_list[level_lists.speedrun_kranion];
			
			array_push(_level_list, level_ids.level_kranion_conveyor);
			array_push(_level_list, level_ids.level_kranion_moon);
			array_push(_level_list, level_ids.level_kranion_conveyor_secret);
			array_push(_level_list, level_ids.level_kranion_moon_secret);
			array_push(_level_list, level_ids.level_kranion_boss_secret);
			array_push(_level_list, level_ids.level_kranion_boss);
			array_push(_level_list, level_ids.level_kranion_final_boss);
		#endregion
		
		#region Stadium Run
			_level_list = global.level_list[level_lists.speedrun_stadium];
			
			array_push(_level_list, level_ids.level_stadium);
			array_push(_level_list, level_ids.level_supersecret);
			array_push(_level_list, level_ids.level_supersecret_boss);
		#endregion
	
		#region Adventure Run
			_level_list = global.level_list[level_lists.speedrun_adventure];
			
			array_push(_level_list, level_ids.level_stadium);
			array_push(_level_list, level_ids.level_normal_fruit);
			array_push(_level_list, level_ids.level_normal_sky);
			array_push(_level_list, level_ids.level_normal_boss);
			array_push(_level_list, level_ids.level_crazy_toy);
			array_push(_level_list, level_ids.level_crazy_park);
			array_push(_level_list, level_ids.level_crazy_boss);
			array_push(_level_list, level_ids.level_ludicrous_barrel);
			array_push(_level_list, level_ids.level_ludicrous_water);
			array_push(_level_list, level_ids.level_ludicrous_boss);
			array_push(_level_list, level_ids.level_insane_hippie);
			array_push(_level_list, level_ids.level_insane_lightning);
			array_push(_level_list, level_ids.level_insane_boss);
			array_push(_level_list, level_ids.level_freaky_ice);
			array_push(_level_list, level_ids.level_freaky_star);
			array_push(_level_list, level_ids.level_freaky_boss);
			array_push(_level_list, level_ids.level_kranion_conveyor);
			array_push(_level_list, level_ids.level_kranion_moon);
			array_push(_level_list, level_ids.level_kranion_boss);
			array_push(_level_list, level_ids.level_kranion_final_boss);
		#endregion
		
		#region Secret Run
			_level_list = global.level_list[level_lists.speedrun_secret];
			
			array_push(_level_list, level_ids.level_normal_fruit_secret);
			array_push(_level_list, level_ids.level_crazy_toy_secret);
			array_push(_level_list, level_ids.level_ludicrous_barrel_secret);
			array_push(_level_list, level_ids.level_insane_hippie_secret);
			array_push(_level_list, level_ids.level_freaky_ice_secret);
			array_push(_level_list, level_ids.level_kranion_conveyor_secret);
			array_push(_level_list, level_ids.level_kranion_moon_secret);
			array_push(_level_list, level_ids.level_kranion_boss_secret);
		#endregion
		
		#region Ultimate Run
			_level_list = global.level_list[level_lists.speedrun_ultimate];
		
			array_push(_level_list, level_ids.level_stadium);
			array_push(_level_list, level_ids.level_normal_fruit);
			array_push(_level_list, level_ids.level_normal_sky);
			array_push(_level_list, level_ids.level_normal_fruit_secret);
			array_push(_level_list, level_ids.level_normal_boss);
			array_push(_level_list, level_ids.level_crazy_toy);
			array_push(_level_list, level_ids.level_crazy_park);
			array_push(_level_list, level_ids.level_crazy_toy_secret);
			array_push(_level_list, level_ids.level_crazy_boss);
			array_push(_level_list, level_ids.level_ludicrous_barrel);
			array_push(_level_list, level_ids.level_ludicrous_water);
			array_push(_level_list, level_ids.level_ludicrous_barrel_secret);
			array_push(_level_list, level_ids.level_ludicrous_boss);
			array_push(_level_list, level_ids.level_insane_hippie);
			array_push(_level_list, level_ids.level_insane_lightning);
			array_push(_level_list, level_ids.level_insane_hippie_secret);
			array_push(_level_list, level_ids.level_insane_boss);
			array_push(_level_list, level_ids.level_freaky_ice);
			array_push(_level_list, level_ids.level_freaky_star);
			array_push(_level_list, level_ids.level_freaky_ice_secret);
			array_push(_level_list, level_ids.level_freaky_boss);
			array_push(_level_list, level_ids.level_kranion_conveyor);
			array_push(_level_list, level_ids.level_kranion_moon);
			array_push(_level_list, level_ids.level_kranion_conveyor_secret);
			array_push(_level_list, level_ids.level_kranion_moon_secret);
			array_push(_level_list, level_ids.level_kranion_boss_secret);
			array_push(_level_list, level_ids.level_kranion_boss);
			array_push(_level_list, level_ids.level_kranion_final_boss);
			array_push(_level_list, level_ids.level_supersecret);
			array_push(_level_list, level_ids.level_supersecret_boss);
		#endregion
		
		#region Boss Rush
			_level_list = global.level_list[level_lists.boss];
		
			array_push(_level_list, level_ids.level_normal_boss);
			array_push(_level_list, level_ids.level_crazy_boss);
			array_push(_level_list, level_ids.level_ludicrous_boss);
			array_push(_level_list, level_ids.level_insane_boss);
			array_push(_level_list, level_ids.level_freaky_boss);
			array_push(_level_list, level_ids.level_kranion_boss_secret);
			array_push(_level_list, level_ids.level_kranion_boss);
			array_push(_level_list, level_ids.level_kranion_final_boss);
			array_push(_level_list, level_ids.level_supersecret_boss);
		#endregion
		
		#region Demo
			_level_list = global.level_list[level_lists.demo];
			
			array_push(_level_list, level_ids.level_stadium);
			array_push(_level_list, level_ids.level_normal_fruit);
			array_push(_level_list, level_ids.level_normal_sky);
			array_push(_level_list, level_ids.level_normal_fruit_secret);
			array_push(_level_list, level_ids.level_normal_boss);
			array_push(_level_list, level_ids.level_crazy_toy);
			array_push(_level_list, level_ids.level_crazy_park);
			array_push(_level_list, level_ids.level_crazy_toy_secret);
			array_push(_level_list, level_ids.level_crazy_boss);
			array_push(_level_list, level_ids.level_ludicrous_barrel);
			array_push(_level_list, level_ids.level_ludicrous_barrel_secret);
		#endregion
	#endregion
	
	worldmap_init();
	
	levels_load();
}

/// @function levels_save
function levels_save()
{
	var _i, _json;
	var _array = [];
	
	for (_i = 0; _i < array_length(global.levels); ++_i)
	{
		_array[_i][level_data.status] = global.levels[_i][level_data.status];
		_array[_i][level_data.trophies] = global.levels[_i][level_data.trophies];
	}
	
	_json = json_stringify(_array);
	string_save(_json, "levels.save");
}

/// @function levels_load
function levels_load()
{
	var _json;
	var _array;
	var _i;
	
	if (file_exists("levels.save"))
	{
		_json = string_load("levels.save");
		_array = json_parse(_json);
		
		for (_i = 0; _i < array_length(_array); ++_i)
		{
			global.worldmap_icons[_i][worldmap_icon_data.status] = _array[_i][level_data.status];
			global.levels[_i][level_data.status] = _array[_i][level_data.status];
			global.levels[_i][level_data.trophies] = _array[_i][level_data.trophies];
		}
		level_complete_list_reset();
	}
}

/// @function level_complete_list_reset
function level_complete_list_reset()
{
	var _i;
	var _level_list = global.level_list[level_lists.completed];
	var _level_status;
	
	array_resize(_level_list, 0);
	
	for (_i = 0; _i < array_length(global.levels); ++_i)
	{
		_level_status = global.levels[_i][level_data.status];
		
		if (_level_status == level_status.clear_normal || _level_status == level_status.clear_perfect)
			array_push(_level_list, _i);
	}
}

/// @function level_create
/// @param {int} _level_id
/// @param {boolean} _status = level_status.locked
/// @param {room} _room = rm_level_parent
/// @param {string} _name_world = ""
/// @param {string} _name_level = ""
/// @param {function} _unlock_function = function(){return false;}
/// @param {int} _trophy_count = 3
/// @param {room} _cutscene_room_begin = -1
/// @param {room} _cutscene_room_end = -1
function level_create(_level_id, _status = level_status.locked, _room = rm_level_parent, _name_world = "", _name_level = "", _unlock_function = function(){return false;}, _trophy_count = 3, _cutscene_room_begin = -1, _cutscene_room_end = -1)
{
	global.levels[_level_id][level_data.status] = _status;
	global.levels[_level_id][level_data.room] = _room;
	global.levels[_level_id][level_data.name_world] = _name_world;
	global.levels[_level_id][level_data.name_level] = _name_level;
	global.levels[_level_id][level_data.unlock_function] = _unlock_function;
	global.levels[_level_id][level_data.trophies] = 0;
	global.levels[_level_id][level_data.trophy_count] = _trophy_count;
	global.levels[_level_id][level_data.cutscene_room_begin] = _cutscene_room_begin;
	global.levels[_level_id][level_data.cutscene_room_end] = _cutscene_room_end;
	
	array_push(global.level_list[level_lists.normal], _level_id);
}

/// @function levels_unlock
function levels_unlock()
{
	var _i;
	var _status;
	var _func;
	
	for (_i = 0; _i < array_length(global.levels); ++_i)
	{
		_status = level_status_get(_i);
		
		if (_status != level_status.locked)
			continue;
			
		_func = global.levels[_i][level_data.unlock_function];
		
		if (_func() == true)
			global.levels[_i][level_data.status] = level_status.open;
	}
}

/// @function level_status_get
/// @param {int} _level_id = global.level_id
function level_status_get(_level_id = global.level_id)
{
	return global.levels[_level_id][level_data.status];
	
	gml_pragma("forceinline");
}

/// @function level_complete_get
/// @param {int} _level_id = global.level_id
function level_complete_get(_level_id = global.level_id)
{
	switch (global.levels[_level_id][level_data.status])
	{
		case level_status.clear_normal:
		case level_status.clear_perfect:
			return true;
			break;
		default:
			return false;
			break;
	}
	
	gml_pragma("forceinline");
}

/// @function level_perfect_get
/// @param {int} _level_id = global.level_id
function level_perfect_get(_level_id = global.level_id)
{
	switch (global.levels[_level_id][level_data.status])
	{
		case level_status.clear_perfect:
			return true;
			break;
		default:
			return false;
			break;
	}
	
	gml_pragma("forceinline");
}

/// @function level_room_get
/// @param {int} _level_id = global.level_id
function level_room_get(_level_id = global.level_id)
{
	return global.levels[_level_id][level_data.room];
	
	gml_pragma("forceinline");
}

/// @function level_name_world_get
/// @param {int} _level_id = global.level_id
function level_name_world_get(_level_id = global.level_id)
{
	return global.levels[_level_id][level_data.name_world];
	
	gml_pragma("forceinline");
}

/// @function level_name_get
/// @param {int} _level_id = global.level_id
function level_name_get(_level_id = global.level_id)
{
	return global.levels[_level_id][level_data.name_level];
	
	gml_pragma("forceinline");
}

/// @function level_trophies_get
/// @param {int} _level_id = global.level_id
function level_trophies_get(_level_id = global.level_id)
{
	return global.levels[_level_id][level_data.trophies];
	
	gml_pragma("forceinline");
}

/// @function level_trophy_count_max_get
/// @param {int} _level_id = global.level_id
function level_trophy_count_max_get(_level_id = global.level_id)
{
	return global.levels[_level_id][level_data.trophy_count];
	
	gml_pragma("forceinline");
}

/// @function level_beat
function level_beat()
{
	switch (global.game_mode)
	{
		case game_modes.randomizer:
			global.level_demo++;
				
			if (global.level_demo >= array_length(global.current_level_list))
			{
				global.level_demo = 0;
				global.current_level_list = array_shuffle(global.current_level_list);
			}
			global.level_id = global.current_level_list[global.level_demo];
			spawn_point_set(level_room_get(global.level_id));
			instance_create_layer(0, 0, "layer_instances", obj_room_transition_level);
			break;
		case game_modes.speedrun:
		case game_modes.boss_rush:
			global.level_demo++;
				
			if (global.level_demo >= array_length(global.current_level_list))
				instance_create_layer(0, 0, "layer_instances", obj_level_win_screen);
			else
			{
				global.level_id = global.current_level_list[global.level_demo];
				spawn_point_set(level_room_get(global.level_id));
				instance_create_layer(0, 0, "layer_instances", obj_room_transition_level);
			}
			break;
		default:
			instance_create_layer(0, 0, "layer_instances", obj_level_win_screen);
			break;
	}
}