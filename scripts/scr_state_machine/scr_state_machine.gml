/// @function state_machine_init
function state_machine_init()
{
	state = -1;
	state_previous = -1;
	state_next = 0;
	state_next_priority = 0;
	state_begin = true;
}

/// @function state_machine_step
function state_machine_step()
{
	if (state_next != state)
	{
		state_previous = state;
		state = state_next;
		state_begin = true;
	}
	else
		state_begin = false;
		
	state_next_priority = 0;
}

/// @function state_next_set
/// @param {int} _state
/// @param {int} _priority = 0
/// @description Will set the instance's next state, but only you set a priority higher than the stored one
function state_next_set(_state, _priority = 0)
{
	if (_priority >= state_next_priority)
	{
		state_next_priority = _priority;
		state_next = _state;
	}
}
