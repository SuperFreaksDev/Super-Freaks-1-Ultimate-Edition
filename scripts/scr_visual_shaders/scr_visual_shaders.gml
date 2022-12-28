/// @function screen_shaders_init
function screen_shaders_init()
{
	global.shaders_list = [];
	
	screen_shader_add(, "N/A");
	screen_shader_add(shader_grayscale, "Justice is Gray");
}

/// @function screen_shader_add
/// @param _shader = -1
/// @param _name = ""
function screen_shader_add(_shader = -1, _name = "")
{
	array_push(global.shaders_list, [_shader, _name]);
}