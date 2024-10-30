var _screen_width = screen_width_get();
var _screen_height = screen_height_get();
var _view_width = camera_get_view_width(view_camera[view_current]);
var _view_height = camera_get_view_height(view_camera[view_current]);
var _view_x1 = camera_get_view_x(view_camera[view_current]);
var _view_y1 = camera_get_view_y(view_camera[view_current]);
var _view_x2 = _view_x1 + _view_width;
var _view_y2 = _view_y1 + _view_height;

#region Draw Touch Controls
    
    if (!surface_exists(global.surface_HUD))
        exit;
    
    surface_set_target(global.surface_HUD);
    draw_set_alpha(1);
    draw_set_color(c_white);
    draw_set_projection_2D(_view_x1, _view_y1, _screen_width, _screen_height);
    
    var thumbstick_position = new vector2(_view_x1 + 96, _view_y2 - 96);
    var thumbstick_radius = 64;
    var primary_position = new vector2(_view_x2 - 96, _view_y2 - 96);
    var primary_radius = 64;
    var secondary_position = new vector2(_view_x2 - 192, _view_y2 - 64);
    var secondary_radius = 32;
    var start_shape = [_view_x2 - 40, _view_y1 + 8, _view_x2 - 8, _view_y1 + 40];
    
    global.virtual_button_thumbstick.circle(thumbstick_position.x, thumbstick_position.y, thumbstick_radius);
    global.virtual_button_primary.circle(primary_position.x, primary_position.y, primary_radius);
    global.virtual_button_secondary.circle(secondary_position.x, secondary_position.y, secondary_radius);
    global.virtual_button_start.rectangle(start_shape[0], start_shape[1], start_shape[2], start_shape[3])
    
    input_virtual_debug_draw();

#endregion

surface_reset_target();
