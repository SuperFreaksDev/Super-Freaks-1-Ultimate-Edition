/// @description Step

var _width, _height, _zone;

timer++;

if (timer >= timer_frequency)
{
	_width = image_xscale;
	_height = image_yscale;
	_zone = zone_index;
	instance_create_layer(x, y, "layer_instances", obj_metal_box, 
	{
		image_xscale: _width,
		image_yscale: _height,
		zone_index: _zone
	});
	timer = 0;
}