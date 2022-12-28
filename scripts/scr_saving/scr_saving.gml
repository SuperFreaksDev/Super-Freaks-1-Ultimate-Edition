/// @function string_save
/// @description Converts a string into a buffer and writes it into a file
/// @param {string} _string
/// @param _filename
function string_save(_string, _filename)
{
	var _buffer = buffer_create(string_byte_length(_string) + 1, buffer_fixed, 1);
	
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
	
	gml_pragma("forceinline");
}

/// @function string_load
/// @description Opens a file with a buffer and converts it into a readable string
/// @param _filename
function string_load(_filename)
{
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	
	buffer_delete(_buffer);
	return _string;
	
	gml_pragma("forceinline");
}
