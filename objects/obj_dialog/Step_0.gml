// Safety check - if no messages, destroy immediately
if (array_length(messages) == 0) {
    global.dialog_active = false;
    instance_destroy();
    exit;
}

// Safety check - if current_message is invalid, fix it
if (current_message < 0) current_message = 0;
if (current_message >= array_length(messages)) {
    global.dialog_active = false;
    instance_destroy();
    exit;
}

var _str = messages[current_message].msg;

if (current_char < string_length(_str))
{
    current_char += char_speed * (1 + keyboard_check(input_key));
    draw_message = string_copy(_str, 0, current_char);
}
else if (keyboard_check_pressed(input_key))
{
    current_message++;
    if (current_message >= array_length(messages))
    {
        global.dialog_active = false;
        instance_destroy();
    }
    else
    {
        current_char = 0;
    }
}