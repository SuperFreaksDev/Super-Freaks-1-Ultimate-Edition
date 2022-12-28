/// @function triggers_init
function triggers_init()
{
	global.triggers = 0;
	
	gml_pragma("forceinline");
}

/// @function trigger_set
/// @param _trigger_id
function trigger_set(_trigger_id)
{
	_trigger_id = clamp(_trigger_id, 0, 31);
	global.triggers = bit_set(global.triggers, _trigger_id);
	
	gml_pragma("forceinline");
}

/// @function trigger_get
/// @param _trigger_id
function trigger_get(_trigger_id)
{
	_trigger_id = clamp(_trigger_id, 0, 31);
	return bit_get(global.triggers, _trigger_id);
	
	gml_pragma("forceinline");
}

/// @function trigger_clear
/// @param _trigger_id
function trigger_clear(_trigger_id)
{
	_trigger_id = clamp(_trigger_id, 0, 31);
	global.triggers = bit_clear(global.triggers, _trigger_id);
	
	gml_pragma("forceinline");
}

/// @function trigger_toggle
/// @param _trigger_id
function trigger_toggle(_trigger_id)
{
	_trigger_id = clamp(_trigger_id, 0, 31);
	global.triggers = bit_toggle(global.triggers, _trigger_id);
	
	gml_pragma("forceinline");
}