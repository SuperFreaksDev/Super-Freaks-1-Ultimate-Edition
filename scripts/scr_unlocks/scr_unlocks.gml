enum unlock_data
{
	unlocked = 0,
	description,
	text,
	func_condition,
	func_unlock,
}

enum unlocks
{
	free_play,
	randomizer,
	speedrun_story,
	speedrun_secret,
	speedrun_100,
	boss_rush,
	supersecret,
	speedrun_normal,
	speedrun_crazy,
	speedrun_ludicrous,
	speedrun_insane,
	speedrun_freaky,
	speedrun_kranion,
	speedrun_stadium,
	museum,
	character_superior,
	character_negative_quincy,
	character_geyzer,
	character_trash_can_man,
	character_2006,
	character_dino,
	character_x_freaks,
}

/// @function unlocks_init
function unlocks_init()
{
	global.unlocks = [];
	
	unlock_create(unlocks.free_play, "Unlock Free Play", "Free Play Challenge Mode is now available!", function()
	{
		return level_complete_get(level_ids.level_stadium);
	});
	unlock_create(unlocks.randomizer, "Unlock Randomizer", "Randomizer Challenge Mode is now available!", function()
	{
		return level_complete_get(level_ids.level_crazy_boss);
	});
	unlock_create(unlocks.supersecret, "Unlock Exciting Encore", "You can now access the Super Secret Level! Good luck! No, seriously--you're gonna need it.", function()
	{
		var _i;
		
		if (!level_perfect_get(level_ids.level_stadium))
			return false;
		
		for (_i = level_ids.level_normal_fruit; _i <= level_ids.level_kranion_final_boss; ++_i)
		{
			if (!level_perfect_get(_i))
				return false;
		}
		
		return true;
	}, function()
	{
		if (global.levels[2][level_data.status] == level_status.locked)
			global.levels[2][level_data.status] = level_status.open;
	});
	unlock_create(unlocks.speedrun_normal, "Unlock Normal Run", "Normal Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_normal_fruit_secret) && level_complete_get(level_ids.level_normal_boss);
	});
	unlock_create(unlocks.speedrun_crazy, "Unlock Crazy Run", "Crazy Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_crazy_toy_secret) && level_complete_get(level_ids.level_crazy_boss);
	});
	unlock_create(unlocks.speedrun_ludicrous, "Unlock Ludicrous Run", "Ludicrous Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_ludicrous_barrel_secret) && level_complete_get(level_ids.level_ludicrous_boss);
	});
	unlock_create(unlocks.speedrun_insane, "Unlock Insane Run", "Insane Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_insane_hippie_secret) && level_complete_get(level_ids.level_insane_boss);
	});
	unlock_create(unlocks.speedrun_freaky, "Unlock Freaky Run", "Freaky Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_freaky_ice_secret) && level_complete_get(level_ids.level_freaky_boss);
	});	
	unlock_create(unlocks.speedrun_kranion, "Unlock Kranion Run", "Kranion Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_kranion_boss_secret) && level_complete_get(level_ids.level_kranion_final_boss);
	});
	unlock_create(unlocks.speedrun_stadium, "Unlock Stadium Run", "Stadium Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_supersecret_boss);
	});
	unlock_create(unlocks.speedrun_story, "Unlock Adventure Run", "Adventure Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_kranion_final_boss);
	});
	unlock_create(unlocks.speedrun_secret, "Unlock Secret Run", "Secret Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_kranion_boss_secret);
	});
	unlock_create(unlocks.speedrun_100, "Unlock Ultimate Run", "Ultimate Run is now available in the Speedrun Challenge Menu!", function()
	{
		return level_complete_get(level_ids.level_supersecret_boss);
	});
	unlock_create(unlocks.boss_rush, "Unlock Boss Rush", "Boss Rush Challenge Mode is now available!", function()
	{
		return level_complete_get(level_ids.level_supersecret_boss);
	});
	unlock_create(unlocks.museum, "Unlock Museum", "Museum Mode is now available!", function()
	{
		return level_complete_get(level_ids.level_stadium);
	});
	unlock_create(unlocks.character_superior, "Unlock Superior", "You can now play as Scruffy's Anti Freaks counterpart, Superior! He's alright I guess.", function()
	{
		return level_perfect_get(level_ids.level_normal_fruit_secret);
	}, function()
	{
		global.characters_unlocked[character_indexes.superior] = true;
	});
	unlock_create(unlocks.character_negative_quincy, "Unlock Negative Quincy", "You can now play as King Quincy's Anti Freaks counterpart, Negative Quincy! Be very glad you're not playing against him.", function()
	{
		return level_perfect_get(level_ids.level_crazy_toy_secret);
	}, function()
	{
		global.characters_unlocked[character_indexes.negative_quincy] = true;
	});
	unlock_create(unlocks.character_geyzer, "Unlock Geyzer", "You can now play as Gambi's Anti Freaks counterpart, Geyzer! But don't touch him, what with all that edge he's got.", function()
	{
		return level_perfect_get(level_ids.level_insane_hippie_secret);
	}, function()
	{
		global.characters_unlocked[character_indexes.geyzer] = true;
	});
	unlock_create(unlocks.character_trash_can_man, "Unlock Trash Can Man", "You can now play as Tikiman's Anti Freaks counterpart, Trash Can Man! If he had it his way, you'd have to buy him.", function()
	{
		return level_perfect_get(level_ids.level_freaky_ice_secret);
	}, function()
	{
		global.characters_unlocked[character_indexes.trash_can_man] = true;
	});
	unlock_create(unlocks.character_2006, "Unlock 2006 Super Freaks", "You can now play as the 2006 Super Freaks! They're almost old enough to get their drivers licenses!", function()
	{
		return level_perfect_get(level_ids.level_kranion_boss_secret);
	}, function()
	{
		global.characters_unlocked[character_indexes.scruffy_2006] = true;
		global.characters_unlocked[character_indexes.quincy_2006] = true;
		global.characters_unlocked[character_indexes.gambi_2006] = true;
		global.characters_unlocked[character_indexes.tikiman_2006] = true;
	});
	unlock_create(unlocks.character_dino, "Unlock Dino", "You can now play as Kranion's right hand man, Dino! Give him the victory he's never had!", function()
	{
		return level_perfect_get(level_ids.level_kranion_boss);
	}, function()
	{
		global.characters_unlocked[character_indexes.dino] = true;
	});
	unlock_create(unlocks.character_x_freaks, "Unlock X-Freaks", "You can now play as the X-Freaks! These guys are First Class! ...yeah I know, that joke kinda sucked. Great movie though!", function()
	{
		return level_perfect_get(level_ids.level_ludicrous_barrel_secret);
	}, function()
	{
		global.characters_unlocked[character_indexes.slaypool] = true;
		global.characters_unlocked[character_indexes.cyquops] = true;
		global.characters_unlocked[character_indexes.gloverine] = true;
		global.characters_unlocked[character_indexes.professor_t] = true;
	});
	
	unlocks_load();
}

/// @function unlocks_save
function unlocks_save()
{
	var _i, _json;
	var _array = [];
	
	for (_i = 0; _i < array_length(global.unlocks); ++_i)
	{
		_array[_i] = global.unlocks[_i][unlock_data.unlocked];
	}
	
	_json = json_stringify(_array);
	string_save(_json, "unlockables.save");
}

/// @function unlocks_load
function unlocks_load()
{
	var _json;
	var _array;
	var _i;
	var _func;
	
	if (file_exists("unlockables.save"))
	{
		_json = string_load("unlockables.save");
		_array = json_parse(_json);
		
		for (_i = 0; _i < array_length(_array); ++_i)
		{
			global.unlocks[_i][unlock_data.unlocked] = _array[_i];
			if (_array[_i] == true)
			{
				_func = global.unlocks[_i][unlock_data.func_unlock];
				_func();
			}
		}
	}
}

/// @function unlock_create
/// @param {int} _id
/// @param {string} _description = ""
/// @param {string} _text = ""
/// @param {function} _func_condition = function(){}
/// @param {function} _func_unlock = function(){}
function unlock_create(_id, _description = "", _text = "", _func_condition = function(){return false;}, _func_unlock = function(){})
{
	global.unlocks[_id][unlock_data.unlocked] = false;
	global.unlocks[_id][unlock_data.description] = _description;
	global.unlocks[_id][unlock_data.text] = _text;
	global.unlocks[_id][unlock_data.func_condition] = _func_condition;
	global.unlocks[_id][unlock_data.func_unlock] = _func_unlock;
}

/// @function unlocks_unlock
function unlocks_unlock()
{
	var _i;
	var _func;
	
	for (_i = 0; _i < array_length(global.unlocks); ++_i)
	{
		if (global.unlocks[_i][unlock_data.unlocked] == true)
			continue;
			
		_func = global.unlocks[_i][unlock_data.func_condition];
		
		if (_func() == true)
		{
			global.unlocks[_i][unlock_data.unlocked] = true;
			_func = global.unlocks[_i][unlock_data.func_unlock];
			_func();
		}
	}
}
