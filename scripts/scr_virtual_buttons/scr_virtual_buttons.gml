function virtual_buttons_init()
{
    global.virtual_button_thumbstick = input_virtual_create().thumbstick("", "left", "right", "up", "down");
    global.virtual_button_primary = input_virtual_create().button("confirm").button("jump");
    global.virtual_button_secondary = input_virtual_create().button("deny").button("bubble");
    global.virtual_button_start = input_virtual_create().button("start");
}
