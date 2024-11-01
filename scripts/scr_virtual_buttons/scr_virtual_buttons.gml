function virtual_buttons_init()
{
    global.virtual_button_thumbstick = input_virtual_create().thumbstick("", "left", "right", "up", "down");
    global.virtual_button_jump = input_virtual_create().button("jump");
    global.virtual_button_bubble = input_virtual_create().button("bubble");
    global.virtual_button_confirm = input_virtual_create().button("confirm");
    global.virtual_button_deny = input_virtual_create().button("deny");
    global.virtual_button_start = input_virtual_create().button("start");
}
