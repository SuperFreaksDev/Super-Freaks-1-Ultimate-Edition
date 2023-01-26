/// @description Step

yorb_effect = max(yorb_effect - 0.25, 0);

if (the_trophy_appears > 0)
{
	trophy_offset = max(trophy_offset - 3, 0);
	the_trophy_appears--;
}
else
	trophy_offset = min(trophy_offset + 3, 32);