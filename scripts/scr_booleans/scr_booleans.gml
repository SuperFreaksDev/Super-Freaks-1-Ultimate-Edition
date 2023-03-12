/// @function boolean_string
/// @param {Boolean} _boolean
function boolean_string(_boolean)
{
	if (_boolean)
		return "True";
	else
		return "False";
		
	gml_pragma("forceinline");
}

/// @function boolean_string_yesno
/// @param {Boolean} _boolean
function boolean_string_yesno(_boolean)
{
	if (_boolean)
		return "Yes";
	else
		return "No";
		
	gml_pragma("forceinline");
}

/// @function boolean_string_onoff
/// @param {Boolean} _boolean
function boolean_string_onoff(_boolean)
{
	if (_boolean)
		return "On";
	else
		return "Off";
		
	gml_pragma("forceinline");
}