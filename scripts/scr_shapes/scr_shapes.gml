
#region Circle
	/// @function vertex_in_circle
	/// @param _x
	/// @param _y
	/// @param _circle_x
	/// @param _circle_y
	/// @param _circle_radius
	function vertex_in_circle(_x, _y, _circle_x, _circle_y, _circle_radius)
	{
		var _vertex_x = _x - _circle_x;
		var _vertex_y = _y - _circle_y;
		if (sqrt(_vertex_x*_vertex_x + _vertex_y*_vertex_y) <= _circle_radius)
			return true;
		
		return false;
	
		gml_pragma("forceinline");
	}

	/// @function circle_in_line
	/// @param _circle_x
	/// @param _circle_y
	/// @param _circle_radius
	/// @param _line_x1
	/// @param _line_y1
	/// @param _line_x2
	/// @param _line_y2
	function circle_in_line(_circle_x, _circle_y, _circle_radius, _line_x1, _line_y1, _line_x2, _line_y2)
	{
		var _center_x = _circle_x - _line_x1;
		var _center_y = _circle_y - _line_y1;
		var _edge_x = _line_x2 - _line_x1;
		var _edge_y = _line_y2 - _line_y1;
		var _angle = (_center_x*_edge_x) + (_center_y*_edge_y);
		var _length;

		if (_angle > 0)
		{
			_length = sqrt((_edge_x*_edge_x) + (_edge_y*_edge_y));
			_angle = _angle/_length;

			if (_angle < _length)
			{
				if (sqrt((_center_x*_center_x) + (_center_y*_center_y) - (_angle*_angle)) <= _circle_radius)
					return true;
			}
		}
	
		return false;
	}
	
	/// @function circle_in_circle
	/// @description Checks if two circles are overlapping
	/// @param _circle1_x
	/// @param _circle1_y
	/// @param _circle1_radius
	/// @param _circle2_x
	/// @param _circle2_y
	/// @param _circle2_radius
	function circle_in_circle(_circle1_x, _circle1_y, _circle1_radius, _circle2_x, _circle2_y, _circle2_radius)
	{
		var _dist_x = _circle1_x - _circle2_x;
		var _dist_y = _circle1_y - _circle2_y;
		var _distance = sqrt((_dist_x*_dist_x) + (_dist_y*_dist_y));
	
		if (_distance <= (_circle1_radius + _circle2_radius))
		    return true;
		
		return false;
	
		gml_pragma("forceinline");
	}

	/// @function circle_in_triangle
	/// @param _circle_x
	/// @param _circle_y
	/// @param _circle_radius
	/// @param _triangle_x1
	/// @param _triangle_y1
	/// @param _triangle_x2
	/// @param _triangle_y2
	/// @param _triangle_x3
	/// @param _triangle_y3
	function circle_in_triangle(_circle_x, _circle_y, _circle_radius, _triangle_x1, _triangle_y1, _triangle_x2, _triangle_y2, _triangle_x3, _triangle_y3)
	{
		//Circle/vertex checks
		if (point_in_circle(_triangle_x1, _triangle_y1, _circle_x, _circle_y, _circle_radius))
			return true;
		if (point_in_circle(_triangle_x2, _triangle_y2, _circle_x, _circle_y, _circle_radius))
			return true;
		if (point_in_circle(_triangle_x3, _triangle_y3, _circle_x, _circle_y, _circle_radius))
			return true;
		
		//Circle inside triangle check
		if ((_triangle_x2 - _triangle_x1)*(_circle_y - _triangle_y1) - (_triangle_y2 - _triangle_y1)*(_circle_x - _triangle_x1)) >= 0  &&
		   ((_triangle_x3 - _triangle_x2)*(_circle_y - _triangle_y2) - (_triangle_y3 - _triangle_y2)*(_circle_x - _triangle_x2)) >= 0  &&
		   ((_triangle_x1 - _triangle_x3)*(_circle_x - _triangle_x3) - (_triangle_y1 - _triangle_y3)*(_circle_x - _triangle_x3)) >= 0
			return true;
	
		//Circle/edge intersection checks
		if (circle_in_line(_circle_x, _circle_y, _circle_radius, _triangle_x1, _triangle_y1, _triangle_x2, _triangle_y2))
			return true;
		if (circle_in_line(_circle_x, _circle_y, _circle_radius, _triangle_x2, _triangle_y2, _triangle_x3, _triangle_y3))
			return true;
		if (circle_in_line(_circle_x, _circle_y, _circle_radius, _triangle_x3, _triangle_y3, _triangle_x1, _triangle_y1))
			return true;
	
		return false;
	}

	/// @function circle_in_capsule
	/// @param _circle_x
	/// @param _circle_y
	/// @param _circle_radius
	/// @param _capsule_x1
	/// @param _capsule_y1
	/// @param _capsule_x2
	/// @param _capsule_y2
	/// @param _capsule_radius
	function circle_in_capsule(_circle_x, _circle_y, _circle_radius, _capsule_x1, _capsule_y1, _capsule_x2, _capsule_y2, _capsule_radius)
	{
		var _capsule_closest_point = point_line_nearest(_circle_x, _circle_y, _capsule_x1, _capsule_y1, _capsule_x2, _capsule_y2);
	
		return circle_in_circle(_capsule_closest_point[0], _capsule_closest_point[1], _capsule_radius, _circle_x, _circle_y, _circle_radius);
	}
#endregion

#region Triangle
	/// @function triangle_in_triangle
	/// @param _triangle1_x1
	/// @param _triangle1_y1
	/// @param _triangle1_x2
	/// @param _triangle1_y2
	/// @param _triangle1_x3
	/// @param _triangle1_y3
	/// @param _triangle2_x1
	/// @param _triangle2_y1
	/// @param _triangle2_x2
	/// @param _triangle2_y2
	/// @param _triangle2_x3
	/// @param _triangle2_y3
	function triangle_in_triangle(_triangle1_x1, _triangle1_y1, _triangle1_x2, _triangle1_y2, _triangle1_x3, _triangle1_y3, _triangle2_x1, _triangle2_y1, _triangle2_x2, _triangle2_y2, _triangle2_x3, _triangle2_y3)
	{
		var _line_x1, _line_y1, _line_x2, _line_y2;
		
		//Point checks
		if (point_in_triangle(_triangle1_x1, _triangle1_y1, _triangle2_x1, _triangle2_y1, _triangle2_x2, _triangle2_y2, _triangle2_x3, _triangle2_y3))
			return true;
		if (point_in_triangle(_triangle1_x2, _triangle1_y2, _triangle2_x1, _triangle2_y1, _triangle2_x2, _triangle2_y2, _triangle2_x3, _triangle2_y3))
			return true;
		if (point_in_triangle(_triangle1_x3, _triangle1_y3, _triangle2_x1, _triangle2_y1, _triangle2_x2, _triangle2_y2, _triangle2_x3, _triangle2_y3))
			return true;
		
		//Triangle inside triangle
		_line_x1 = (_triangle1_x1 + _triangle1_x2 + _triangle1_x3) / 3;
		_line_y1 = (_triangle1_y1 + _triangle1_y2 + _triangle1_y3) / 3;
		if ((_triangle2_x2 - _triangle2_x1)*(_line_y1 - _triangle2_y1) - (_triangle2_y2 - _triangle2_y1)*(_line_x1 - _triangle2_x1)) >= 0  &&
		   ((_triangle2_x3 - _triangle2_x2)*(_line_y1 - _triangle2_y2) - (_triangle2_y3 - _triangle2_y2)*(_line_x1 - _triangle2_x2)) >= 0  &&
		   ((_triangle2_x1 - _triangle2_x3)*(_line_x1 - _triangle2_x3) - (_triangle2_y1 - _triangle2_y3)*(_line_x1 - _triangle2_x3)) >= 0
			return true;
			
		_line_x1 = (_triangle2_x1 + _triangle2_x2 + _triangle2_x3) / 3;
		_line_y1 = (_triangle2_y1 + _triangle2_y2 + _triangle2_y3) / 3;
		if ((_triangle1_x2 - _triangle1_x1)*(_line_y1 - _triangle1_y1) - (_triangle1_y2 - _triangle1_y1)*(_line_x1 - _triangle1_x1)) >= 0  &&
		   ((_triangle1_x3 - _triangle1_x2)*(_line_y1 - _triangle1_y2) - (_triangle1_y3 - _triangle1_y2)*(_line_x1 - _triangle1_x2)) >= 0  &&
		   ((_triangle1_x1 - _triangle1_x3)*(_line_x1 - _triangle1_x3) - (_triangle1_y1 - _triangle1_y3)*(_line_x1 - _triangle1_x3)) >= 0
			return true;
		
		//Line intersections
		_line_x1 = _triangle1_x1;
		_line_y1 = _triangle1_y1;
		_line_x2 = _triangle1_x2;
		_line_y2 = _triangle1_y2;
		if (intersection_lines(_line_x1, _line_y1, _line_x2, _line_y2, _triangle2_x1, _triangle2_y1, _triangle2_x2, _triangle2_y2))
			return true;
		if (intersection_lines(_line_x1, _line_y1, _line_x2, _line_y2, _triangle2_x2, _triangle2_y2, _triangle2_x3, _triangle2_y3))
			return true;
		if (intersection_lines(_line_x1, _line_y1, _line_x2, _line_y2, _triangle2_x3, _triangle2_y3, _triangle2_x1, _triangle2_y1))
			return true;
			
		_line_x1 = _triangle1_x2;
		_line_y1 = _triangle1_y2;
		_line_x2 = _triangle1_x3;
		_line_y2 = _triangle1_y3;
		if (intersection_lines(_line_x1, _line_y1, _line_x2, _line_y2, _triangle2_x1, _triangle2_y1, _triangle2_x2, _triangle2_y2))
			return true;
		if (intersection_lines(_line_x1, _line_y1, _line_x2, _line_y2, _triangle2_x2, _triangle2_y2, _triangle2_x3, _triangle2_y3))
			return true;
		if (intersection_lines(_line_x1, _line_y1, _line_x2, _line_y2, _triangle2_x3, _triangle2_y3, _triangle2_x1, _triangle2_y1))
			return true;
			
		_line_x1 = _triangle1_x3;
		_line_y1 = _triangle1_y3;
		_line_x2 = _triangle1_x1;
		_line_y2 = _triangle1_y1;
		if (intersection_lines(_line_x1, _line_y1, _line_x2, _line_y2, _triangle2_x1, _triangle2_y1, _triangle2_x2, _triangle2_y2))
			return true;
		if (intersection_lines(_line_x1, _line_y1, _line_x2, _line_y2, _triangle2_x2, _triangle2_y2, _triangle2_x3, _triangle2_y3))
			return true;
		if (intersection_lines(_line_x1, _line_y1, _line_x2, _line_y2, _triangle2_x3, _triangle2_y3, _triangle2_x1, _triangle2_y1))
			return true;
			
		return false;
	}
#endregion

#region Capsule
	/// @function capsule_in_capsule
	/// @param _capsule1_x1
	/// @param _capsule1_y1
	/// @param _capsule1_x2
	/// @param _capsule1_y2
	/// @param _capsule1_radius
	/// @param _capsule2_x1
	/// @param _capsule2_y1
	/// @param _capsule2_x2
	/// @param _capsule2_y2
	/// @param _capsule2_radius
	function capsule_in_capsule(_capsule1_x1, _capsule1_y1, _capsule1_x2, _capsule1_y2, _capsule1_radius, _capsule2_x1, _capsule2_y1, _capsule2_x2, _capsule2_y2, _capsule2_radius)
	{
		var _capsule1_closest_point, _capsule2_closest_point, _point_A, _point_B;
	
		_point_A = point_line_nearest(_capsule1_x1, _capsule1_y1, _capsule2_x1, _capsule2_y1, _capsule2_x2, _capsule2_y2);
		_point_B = point_line_nearest(_capsule1_x2, _capsule1_y2, _capsule2_x1, _capsule2_y1, _capsule2_x2, _capsule2_y2);
	
		if (point_distance(_capsule1_x2, _capsule1_y2, _point_B[0], _point_B[1]) < point_distance(_capsule1_x1, _capsule1_y1, _point_A[0], _point_A[1]))
			_capsule2_closest_point = _point_B;
		else
			_capsule2_closest_point = _point_A;
		
		_point_A = point_line_nearest(_capsule2_x1, _capsule2_y1, _capsule1_x1, _capsule1_y1, _capsule1_x2, _capsule1_y2);
		_point_B = point_line_nearest(_capsule2_x2, _capsule2_y2, _capsule1_x1, _capsule1_y1, _capsule1_x2, _capsule1_y2);
	
		if (point_distance(_capsule2_x2, _capsule2_y2, _point_B[0], _point_B[1]) < point_distance(_capsule2_x1, _capsule2_y1, _point_A[0], _point_A[1]))
			_capsule1_closest_point = _point_B;
		else
			_capsule1_closest_point = _point_A;
		
		return circle_in_circle(_capsule1_closest_point[0], _capsule1_closest_point[1], _capsule1_radius, _capsule2_closest_point[0], _capsule2_closest_point[1], _capsule2_radius);
	}
#endregion