/// @function hurt_timer_set
/// @param {int} _hurt_timer = 128
function hurt_timer_set(_hurt_timer = 128)
{
	hurt_timer = _hurt_timer;
	
	gml_pragma("forceinline");
}

/// @function hurt_timer_step
function hurt_timer_step()
{
	hurt_timer = max(hurt_timer - 1, 0);
	
	if (hurt_timer > 0)
	{
		if (global.game_frame_new == true)
			visible = !visible;
	}
	else
		visible = true;
		
	gml_pragma("forceinline");
}
