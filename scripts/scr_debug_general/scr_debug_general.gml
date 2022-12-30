/// @function debug_init
/// @param {Boolean} _flag = false
function debug_init(_flag = false)
{
	global.debug = _flag;
	global.debug_viewer = array_create(4, false);
}