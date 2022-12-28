enum collision_flag_bits
{
	left = 1 << 0,
	right = 1 << 1,
	up = 1 << 2,
	down = 1 << 3,
}

#region All
	/// @function collision_flags_set_all
	/// @param {Boolean} _left = false
	/// @param {Boolean} _up = false
	/// @param {Boolean} _right = false
	/// @param {Boolean} _down = false
	/// @description Sets all four collision flags
	function collision_flags_set_all(_left = false, _up = false, _right = false, _down = false)
	{
		collision_flags = 0;
		
		if (_left)
			collision_flag_set_left();
		if (_up)
			collision_flag_set_up();
		if (_right)
			collision_flag_set_right();
		if (_down)
			collision_flag_set_down();
	}
#endregion

#region Left
	/// @function collision_flag_set_left
	/// @description Sets the left collision flag
	function collision_flag_set_left()
	{
		collision_flags |= collision_flag_bits.left;
	
		gml_pragma("forceinline");
	}

	/// @function collision_flag_get_left
	/// @description Sets the left collision flag
	function collision_flag_get_left()
	{
		return (collision_flags & collision_flag_bits.left) != 0;
	
		gml_pragma("forceinline");
	}

	/// @function collision_flag_clear_left
	/// @description Clears the left collision flag
	function collision_flag_clear_left()
	{
		collision_flags &= ~collision_flag_bits.left;
	
		gml_pragma("forceinline");
	}
#endregion

#region Right
	/// @function collision_flag_set_right
	/// @description Sets the right collision flag
	function collision_flag_set_right()
	{
		collision_flags |= collision_flag_bits.right;
	
		gml_pragma("forceinline");
	}

	/// @function collision_flag_get_right
	/// @description Sets the right collision flag
	function collision_flag_get_right()
	{
		return (collision_flags & collision_flag_bits.right) != 0;
	
		gml_pragma("forceinline");
	}

	/// @function collision_flag_clear_right
	/// @description Clears the right collision flag
	function collision_flag_clear_right()
	{
		collision_flags &= ~collision_flag_bits.right;
	
		gml_pragma("forceinline");
	}
#endregion

#region Up
	/// @function collision_flag_set_up
	/// @description Sets the up collision flag
	function collision_flag_set_up()
	{
		collision_flags |= collision_flag_bits.up;
	
		gml_pragma("forceinline");
	}

	/// @function collision_flag_get_up
	/// @description Sets the up collision flag
	function collision_flag_get_up()
	{
		return (collision_flags & collision_flag_bits.up) != 0;
	
		gml_pragma("forceinline");
	}

	/// @function collision_flag_clear_up
	/// @description Clears the up collision flag
	function collision_flag_clear_up()
	{
		collision_flags &= ~collision_flag_bits.up;
	
		gml_pragma("forceinline");
	}
#endregion

#region Down
	/// @function collision_flag_set_down
	/// @description Sets the down collision flag
	function collision_flag_set_down()
	{
		collision_flags |= collision_flag_bits.down;
	
		gml_pragma("forceinline");
	}

	/// @function collision_flag_get_down
	/// @description Sets the down collision flag
	function collision_flag_get_down()
	{
		return (collision_flags & collision_flag_bits.down) != 0;
	
		gml_pragma("forceinline");
	}

	/// @function collision_flag_clear_down
	/// @description Clears the down collision flag
	function collision_flag_clear_down()
	{
		collision_flags &= ~collision_flag_bits.down;
	
		gml_pragma("forceinline");
	}
#endregion
