/// @function rect2
/// @param {Struct} _position = new vector2(0, 0)
/// @param {Struct} _size = new vector2(0, 0)
// NOTE: Rect2s have a top left origin
function rect2(_position, _size) constructor
{
    position = _position;
    size = _size;
	
	#region Methods
    
        /// @function abs
        /// @return {Struct} rect2
        static abs = function()
        {
            gml_pragma("forceinline");
            
            return new rect2(position + size.minf(0), new vector2(abs(size.x), abs(size.y)));
        }
        
        /// @function encloses
        /// @param {Struct} _rect2_b = new rect2()
        /// @return {Bool}
        static encloses = function(_rect2_b)
        {
            gml_pragma("forceinline");
            
            if (size.x < 0 or size.y < 0 or _rect2_b.size.x < 0 or _rect2_b.size.y < 0) {
                show_error("rect2 size is negative, please use rect2.abs()", true);
            }
            
            return (
                (_rect2_b.position.x >= position.x) and (_rect2_b.position.y >= position.y) and
                ((_rect2_b.position.x + _rect2_b.size.x) <= (position.x + size.x)) and
                ((_rect2_b.position.y + _rect2_b.size.y) <= (position.y + size.y))
            );
        }
        
        /// @function expand
        /// @param {Struct} _to = new vector2
        /// @return {Struct} rect2
        static expand = function(_to)
        {
            gml_pragma("forceinline");
            
            if (size.x < 0 or size.y < 0) {
                show_error("rect2 size is negative, please use rect2.abs()", true);
            }
            
            var _begin = position;
            var _end = position + size;
            
            if (_to.x < _begin.x) {
                _begin.x = _to.x;
            }
            if (_to.y < _begin.y) {
                _begin.y = _to.y;
            }
            
            if (_to.x > _end.x) {
                _end.x = _to.x;
            }
            if (_to.y > _end.y) {
                _end.y = _to.y;
            }
            
            return new rect2(_begin, _end - _begin);
        }
        
        /// @function get_area
        /// @return {Real}
        static get_area = function()
        {
            gml_pragma("forceinline");
            
            return size.x * size.y;
        }
        
        /// @function get_center
        /// @return {Struct} vector2
        static get_center = function() 
        {
            gml_pragma("forceinline");
            
            return position.add(size.multiply(0.5));
        }
        
        /// @function grow
        /// @param {Real} _amount = 0
        /// @return {Struct} rect2
        static grow = function(_amount)
        {
            gml_pragma("forceinline");
            
            var _position = position.add(new vector2(_amount, _amount));
            var _size = size.add(new vector2(_amount * 2, _amount * 2));
            
            return new rect2(_position, _size);
        }
        
        /// @function grow_individual
        /// @param {Real} _left = 0
        /// @param {Real} _top = 0
        /// @param {Real} _right = 0
        /// @param {Real} _bottom = 0
        /// @return {Struct} rect2
        static grow_individual = function(_left, _top, _right, _bottom)
        {
            gml_pragma("forceinline");
            
            var _position = new vector2(position.x - _left, position.y - _top);
            var _size = new vector2(size.x + _left + _right, size.y + _top + _bottom);
            
            return new rect2(_position, _size);
        }
        
        /// @function grow_side
        /// @param {Real} _side = SIDE.LEFT
        /// @param {Real} _amount = 0
        /// @return {Struct} rect2
        static grow_side = function(_side, _amount)
        {
            gml_pragma("forceinline");
            
            return self.grow_individual(
                (SIDE.LEFT == _side) ? _amount : 0,
                (SIDE.TOP == _side) ? _amount : 0,
                (SIDE.RIGHT == _side) ? _amount : 0,
                (SIDE.BOTTOM == _side) ? _amount : 0
            );
        }
        
        /// @function has_area
        /// @return {Bool}
        static has_area = function()
        {
            gml_pragma("forceinline");
            
            return (size.x > 0 and size.y > 0);
        }
        
        /// @function has_point
        /// @param {Struct} _point = new vector2()
        /// @return {Bool}
        static has_point = function(_point) 
        {
            gml_pragma("forceinline");
            
            if (size.x < 0 or size.y < 0) {
                show_error("rect2 size is negative, please use rect2.abs()", true);
            }
            
            if (_point.x < position.x) {
                return false;
            }
            if (_point.y < position.y) {
                return false;
            }
            
            if (_point.x >= (position.x + size.x)) {
                return false;
            }
            if (_point.y >= (position.y + size.y)) {
                return false;
            }
            
            return true;
        }
        
        /// @function intersection
        /// @param {Struct} _rect2_b = new rect2()
        /// @return {Struct} rect2
        static intersection = function(_rect2_b)
        {
            gml_pragma("forceinline");
            
            var _new_rect = _rect2_b;
            
            if (!intersects(_rect2_b)) {
                return new rect2();
            }
            
            _new_rect.position = _rect2_b.position.max(position);
            
            var _rect2_b_end = _rect2_b.position.add(_rect2_b.size);
            var _end = position.add(size);
            
            _new_rect.size = _rect2_b_end.min(_end).subtract(_new_rect.position);
            
            return _new_rect;
        }
        
        /// @function intersects
        /// @param {Struct} _rect2_b = new rect2()
        /// @param {Bool} _include_borders = false
        /// @return {Bool}
        static intersects = function(_rect2_b, _include_borders = false) 
        {
            gml_pragma("forceinline");
            
            if (size.x < 0 or size.y < 0) {
                show_error("rect2 size is negative, please use rect2.abs()", true);
            }
            
            if (include_borders) {
                if (position.x > (_rect2_b.position.x + _rect2_b.size.x)) {
                    return false;
                }
                if ((position.x + size.x) < _rect2_b.position.x) {
                    return false;
                }
                if (position.y > (_rect2_b.position.y + _rect2_b.size.y)) {
                    return false;
                }
                if ((position.y + size.y) < _rect2_b.position.y) {
                    return false;
                }
            } else {
            if (position.x >= (_rect2_b.position.x + _rect2_b.size.x)) {
                    return false;
                }
                if ((position.x + size.x) <= _rect2_b.position.x) {
                    return false;
                }
                if (position.y >= (_rect2_b.position.y + _rect2_b.size.y)) {
                    return false;
                }
                if ((position.y + size.y) <= _rect2_b.position.y) {
                    return false;
                }
            }
            
            return true;
        }
        
        /// @function is_equal
        /// @param {Struct} _rect2 = new rect2()
        /// @return {Bool}
        static is_equal = function(_rect2)
        {
            gml_pragma("forceinline");
            
            return (position.is_equal(_rect2.position) and size.is_equal(_rect2.size));
        }
        
        /// @function merge
        /// @param {Struct} _rect2_b
        /// @return {Struct} rect2
        static merge = function(_rect2_b)
        {
            gml_pragma("forceinline");
            
            if (size.x < 0 or size.y < 0) {
                show_error("rect2 size is negative, please use rect2.abs()", true);
            }
            
            var _new_rect = new rect2();
            
            _new_rect.position = _rect2_b.position.min(position);
            
            _new_rect.size = (_rect2_b.position.subtract(_rect2_b.size)).max(position.add(size));
            
            _new_rect.size = _new_rect.size.subtract(_new_rect.position); // Make relative again
            
            return _new_rect;
        }
        
        
        
        
        
		/// @function x1_get
		static x1_get = function()
		{
			var _position = position.x;
			
			gml_pragma("forceinline");
			
			return min(_position, _position + size.x);
		}
		
		/// @function y1_get
		static y1_get = function()
		{
			var _position = position.y;
			
			gml_pragma("forceinline");
			
			return min(_position, _position + size.y);
		}
		
		/// @function x2_get
		static x2_get = function()
		{
			var _position = position.x;
			
			gml_pragma("forceinline");
			
			return max(_position, _position + size.x);
		}
		
		/// @function y2_get
		static y2_get = function()
		{
			var _position = position.y;
			
			gml_pragma("forceinline");
			
			return max(_position, _position + size.y);
		}
		
		/// @function AABB_get
		static AABB_get = function()
		{
			var _position = position,
				_size = size,
				_x1, _y1, _x2, _y2;
			
			if (_size.x < 0)
			{
				_x1 = _position.x + _size.x;
				_x2 = _position.x;
			}
			else
			{
				_x1 = _position.x;
				_x2 = _position.x + _size.x;
			}
			
			if (_size.y < 0)
			{
				_y1 = _position.y + _size.y;
				_y2 = _position.y;
			}
			else
			{
				_y1 = _position.y;
				_y2 = _position.y + _size.y;
			}
			
			return new AABB(_x1, _y1, _x2, _y2);
		}
		
	#endregion
}