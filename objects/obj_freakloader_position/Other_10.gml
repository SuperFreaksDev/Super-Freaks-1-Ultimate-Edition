/// @desc Step

if (input_check_pressed("confirm", 0))
{
	if (animNum == array_length(anim) - 1) animNum = 0;
	else
	{
		animNum++;
		dummy.sprite = player_animation_get(0, anim[animNum]);
		if (customChar != "") custom.sprite = player_animation_get(global.custom_character_indexes[$ customChar], anim[animNum]);
		animFrame = 0;
	}
}

if (input_check_pressed("deny", 0))
{
	if (animNum == 0) animNum = array_length(anim) - 1;
	else
	{
		animNum--;
		dummy.sprite = player_animation_get(0, anim[animNum]);
		if (customChar != "") custom.sprite = player_animation_get(global.custom_character_indexes[$ customChar], anim[animNum]);
		animFrame = 0;
	}
}

for (var i = 0; i <= 120; i++)
{
	if (i == 120) animFrame++;
}