/// @function vector_perpendicular
/// @param _x
/// @param _y
function vector_perpendicular(_x, _y)
{
	return [-_y, _x];
	
	gml_pragma("forceinline");
}

/// @function cross_product
/// @param _x1
/// @param _y1
/// @param _x2
/// @param _y2
/// @param _z1
/// @param _z2
function cross_product(_x1, _y1, _x2, _y2, _z1, _z2)
{
	var _x_normal = (_y1*_z2) - (_z1*_y2);
	var _y_normal = (_z1*_x2) - (_x1*_z2);
	var _z_normal = (_x1*_y2) - (_y1*_x2);
	
	return [_x_normal, _y_normal, _z_normal];
	
	gml_pragma("forceinline");
}

