/// @function bit_set
/// @param _variable
/// @param _bit
function bit_set(_variable, _bit)
{
	_variable |= 1 << _bit;
	
	return _variable;
	
	gml_pragma("forceinline");
}

/// @function bit_get
/// @param _variable
/// @param _bit
function bit_get(_variable, _bit)
{
	return (_variable & (1 << _bit)) != 0;
	
	gml_pragma("forceinline");
}

/// @function bit_clear
/// @param _variable
/// @param _bit
function bit_clear(_variable, _bit)
{
	_variable &= ~(1 << _bit);
	
	return _variable;
	
	gml_pragma("forceinline");
}

/// @function bit_toggle
/// @param _variable
/// @param _bit
function bit_toggle(_variable, _bit)
{
	_variable ^= 1 << _bit;
	
	return _variable;
	
	gml_pragma("forceinline");
}
