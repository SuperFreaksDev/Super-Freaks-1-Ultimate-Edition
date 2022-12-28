/// @function comp_timer
/// @param _frames = -1
/// @param _func = function(){}
function comp_timer(_frames = -1, _func = function(){}) constructor
{
	frames = _frames;
	func = _func;
	
	array_push(other.comp_list_timer, weak_ref_create(self));
}