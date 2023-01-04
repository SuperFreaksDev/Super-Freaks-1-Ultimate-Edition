enum collider_detector_sides_data
{
	flat_y1 = 0,
	slope_y1,
	flat_y2,
	slope_y2,
	width
}
enum collider_detector_vertical_data
{
	flat_x1 = 0,
	slope_x1,
	flat_x2,
	slope_x2,
	y,
}

/// @function collider_detectors_init
function collider_detectors_init()
{
	collider_detector_up = array_create(5, 0); //_flat_x1, _slope_x1, _flat_x2, _slope_x2, _y
	collider_detector_down = array_create(5, 0); //_flat_x1, _slope_x1, _flat_x2, _slope_x2, _y
	collider_detector_sides = array_create(5, 0); //_flat_y1, _slope_y1, _flat_y2, _slope_y2, _width
}

#region Up
	/// @function collider_detector_up_set
	/// @param _flat_x1 = 0
	/// @param _slope_x1 = 0
	/// @param _flat_x2 = 0
	/// @param _slope_x2 = 0
	/// @param _y = 0
	function collider_detector_up_set(_flat_x1 = 0, _slope_x1 = 0, _flat_x2 = 0, _slope_x2 = 0, _y = 0)
	{
		collider_detector_up[collider_detector_vertical_data.flat_x1] = _flat_x1;
		collider_detector_up[collider_detector_vertical_data.slope_x1] = _slope_x1;
		collider_detector_up[collider_detector_vertical_data.flat_x2] = _flat_x2;
		collider_detector_up[collider_detector_vertical_data.slope_x2] = _slope_x2;
		collider_detector_up[collider_detector_vertical_data.y] = _y;
	}

	/// @function collider_detector_up_flat_x1_get
	function collider_detector_up_flat_x1_get()
	{
		return collider_detector_up[collider_detector_vertical_data.flat_x1];
	
		gml_pragma("forceinline");
	}

	/// @function collider_detector_up_flat_x2_get
	function collider_detector_up_flat_x2_get()
	{
		return collider_detector_up[collider_detector_vertical_data.flat_x2];
	
		gml_pragma("forceinline");
	}

	/// @function collider_detector_up_slope_x1_get
	function collider_detector_up_slope_x1_get()
	{
		return collider_detector_up[collider_detector_vertical_data.slope_x1];
	
		gml_pragma("forceinline");
	}

	/// @function collider_detector_up_slope_x2_get
	function collider_detector_up_slope_x2_get()
	{
		return collider_detector_up[collider_detector_vertical_data.slope_x2];
	
		gml_pragma("forceinline");
	}

	/// @function collider_detector_up_y_get
	function collider_detector_up_y_get()
	{
		return collider_detector_up[collider_detector_vertical_data.y];
	
		gml_pragma("forceinline");
	}
#endregion

#region Down
	/// @function collider_detector_down_set
	/// @param _flat_x1 = 0
	/// @param _slope_x1 = 0
	/// @param _flat_x2 = 0
	/// @param _slope_x2 = 0
	/// @param _y = 0
	function collider_detector_down_set(_flat_x1 = 0, _slope_x1 = 0, _flat_x2 = 0, _slope_x2 = 0, _y = 0)
	{
		collider_detector_down[collider_detector_vertical_data.flat_x1] = _flat_x1;
		collider_detector_down[collider_detector_vertical_data.slope_x1] = _slope_x1;
		collider_detector_down[collider_detector_vertical_data.flat_x2] = _flat_x2;
		collider_detector_down[collider_detector_vertical_data.slope_x2] = _slope_x2;
		collider_detector_down[collider_detector_vertical_data.y] = _y;
	}
	
	/// @function collider_detector_down_flat_x1_get
	function collider_detector_down_flat_x1_get()
	{
		return collider_detector_down[collider_detector_vertical_data.flat_x1];
	
		gml_pragma("forceinline");
	}

	/// @function collider_detector_down_flat_x2_get
	function collider_detector_down_flat_x2_get()
	{
		return collider_detector_down[collider_detector_vertical_data.flat_x2];
	
		gml_pragma("forceinline");
	}

	/// @function collider_detector_down_slope_x1_get
	function collider_detector_down_slope_x1_get()
	{
		return collider_detector_down[collider_detector_vertical_data.slope_x1];
	
		gml_pragma("forceinline");
	}

	/// @function collider_detector_down_slope_x2_get
	function collider_detector_down_slope_x2_get()
	{
		return collider_detector_down[collider_detector_vertical_data.slope_x2];
	
		gml_pragma("forceinline");
	}

	/// @function collider_detector_down_y_get
	function collider_detector_down_y_get()
	{
		return collider_detector_down[collider_detector_vertical_data.y];
	
		gml_pragma("forceinline");
	}
#endregion

/// @function collider_detector_sides_set
/// @param _flat_y1 = 0
/// @param _slope_y1 = 0
/// @param _flat_y2 = 0
/// @param _slope_y2 = 0
/// @param _width = 0
function collider_detector_sides_set(_flat_y1 = 0, _slope_y1 = 0, _flat_y2 = 0, _slope_y2 = 0, _width = 0)
{
	collider_detector_sides[collider_detector_sides_data.flat_y1] = _flat_y1;
	collider_detector_sides[collider_detector_sides_data.slope_y1] = _slope_y1;
	collider_detector_sides[collider_detector_sides_data.flat_y2] = _flat_y2;
	collider_detector_sides[collider_detector_sides_data.slope_y2] = _slope_y2;
	collider_detector_sides[collider_detector_sides_data.width] = _width;
}

/// @function collider_detector_sides_width_get
function collider_detector_sides_width_get()
{
	return collider_detector_sides[collider_detector_sides_data.width];
	
	gml_pragma("forceinline");
}
