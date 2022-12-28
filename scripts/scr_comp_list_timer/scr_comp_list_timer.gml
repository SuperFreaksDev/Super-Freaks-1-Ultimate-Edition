/// @function comp_list_timer_init
function comp_list_timer_init()
{
	comp_list_timer = [];
}

/// @function comp_list_timer_step
function comp_list_timer_step()
{
	var _my_id = id;
	var _list = comp_list_timer;
	var _list_pos, _list_length = array_length(_list);
	var _timer, _timer_func;
	
	if (_list_length == 0)
		exit;
	
	for (_list_pos = _list_length - 1; _list_pos > -1; --_list_pos)
	{
		_timer = _list[_list_pos];
		
		if (!weak_ref_alive(_timer))
		{
			array_delete(_list, _list_pos, 1);
			continue;
		}
		
		_timer = _timer.ref;
		
		with (_timer)
		{
			if (frames > 0)
				frames--;
			else if (frames == 0)
			{
			    frames = -1;
				_timer_func = func;
				with (_my_id)
					_timer_func();
			}
		}
	}
}
