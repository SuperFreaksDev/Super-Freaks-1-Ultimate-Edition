var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _screen_upscale = global.visuals_settings[visuals_data.upscale_internal];

#region Draw Touch Controls
    
    //if (!surface_exists(surface))
    //    surface = surface_create(_screen_width * _screen_upscale, _screen_height * _screen_upscale);
    
    surface_set_target(application_surface);
    //draw_clear_alpha(c_black, 0);
    draw_set_alpha(1);
    draw_set_color(c_white);
    //draw_set_projection_2D(0, 0, _screen_width, _screen_height);
    
    var thumbstick_position_x = (0 + 96) * _screen_upscale;
    var thumbstick_position_y = (_screen_height - 96) * _screen_upscale;
    var thumbstick_radius = 64 * _screen_upscale;
    var thumbstick_min_threshold = 32 * _screen_upscale;
    var thumbstick_max_threshold = 64 * _screen_upscale;
    var primary_position_x = (_screen_width - 96) * _screen_upscale;
    var primary_position_y = (_screen_height - 96) * _screen_upscale;
    var primary_radius = 64 * _screen_upscale;
    var secondary_position_x = (_screen_width - 192) * _screen_upscale;
    var secondary_position_y = (_screen_height - 64) * _screen_upscale;
    var secondary_radius = 32 * _screen_upscale;
    var start_shape = [
        (_screen_width - 40) * _screen_upscale, 
        (0 + 8) * _screen_upscale, 
        (_screen_width - 8) * _screen_upscale, 
        (0 + 40) * _screen_upscale
    ];
    
    global.virtual_button_thumbstick.circle(thumbstick_position_x, thumbstick_position_y, thumbstick_radius).threshold(thumbstick_min_threshold, thumbstick_max_threshold);
    global.virtual_button_primary.circle(primary_position_x, primary_position_y, primary_radius);
    global.virtual_button_secondary.circle(secondary_position_x, secondary_position_y, secondary_radius);
    global.virtual_button_start.rectangle(start_shape[0], start_shape[1], start_shape[2], start_shape[3]);
    
    input_virtual_debug_draw();
    
#endregion

surface_reset_target();
//draw_set_alpha(1);
//surface_set_target(application_surface);
//draw_surface(surface, 0, 0);
//surface_reset_target();