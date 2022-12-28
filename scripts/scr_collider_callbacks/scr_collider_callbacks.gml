/// @function collider_callback_default_x1
function collider_callback_default_x1()
{
	collision_flag_set_right();
	
	gml_pragma("forceinline");
}

/// @function collider_callback_default_y1
function collider_callback_default_y1()
{
	collision_flag_set_down();
	
	gml_pragma("forceinline");
}

/// @function collider_callback_default_x2
function collider_callback_default_x2()
{
	collision_flag_set_left();
	
	gml_pragma("forceinline");
}

/// @function collider_callback_default_y2
function collider_callback_default_y2()
{
	collision_flag_set_up();
	
	gml_pragma("forceinline");
}