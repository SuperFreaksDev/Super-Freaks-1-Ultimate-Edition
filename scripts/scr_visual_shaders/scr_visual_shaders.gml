/// @function screen_shaders_init
function screen_shaders_init()
{
	global.shaders_list = [];
	
	screen_shader_add(, "None");
    screen_shader_add(shader_grayscale, "Justice is Gray");
    screen_shader_add(shader_jpeg, "JPEG-ify", true);
}

/// @function screen_shader_add
/// @param _shader = -1
/// @param _name = ""
function screen_shader_add(_shader = -1, _name = "", _use_texture_size = false)
{
	array_push(global.shaders_list, [_shader, _name, _use_texture_size]);
}