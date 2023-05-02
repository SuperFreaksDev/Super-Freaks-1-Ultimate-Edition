/// @description Step

offset_previous = offset;
offset -= 1;

if (offset < 0)
{
	offset += 32;
	offset_previous += 32;
}