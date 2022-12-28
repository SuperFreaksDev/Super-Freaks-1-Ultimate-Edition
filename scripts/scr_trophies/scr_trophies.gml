/// @function trophies_init
/// @param _trophies_stored = 0
/// @param _trophy_max_count = 0
function trophies_init(_trophies_stored = 0, _trophy_max_count = 0)
{
	global.trophies = _trophies_stored;
	global.trophies_max = _trophy_max_count;
	
	gml_pragma("forceinline");
}

/// @function trophy_create
/// @param _x = 0
/// @param _y = 0
/// @param {int} _trophy_id = 0
function trophy_create(_x = 0, _y = 0, _trophy_id = 0)
{
	var _trophy = instance_create_layer(_x, _y, "layer_instances", obj_trophy,
	{
		trophy_id: _trophy_id,
		can_despawn: false
	});
	
	return _trophy;
}