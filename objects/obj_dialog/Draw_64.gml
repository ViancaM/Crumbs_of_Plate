// Use Draw GUI to avoid split-screen issues
var gui_w = display_get_gui_width();
var gui_h = display_get_gui_height();

// Full width at bottom of screen
var _dx = 0;
var _dy = gui_h - 120; // 120px height at bottom
var _boxw = gui_w;
var _boxh = 120;

// Pixel art style dialog box - dark background with border
draw_set_color(c_black);
draw_rectangle(_dx - 2, _dy - 2, _dx + _boxw + 2, _dy + _boxh + 2, false); // Outer border

draw_set_color(c_gray);
draw_rectangle(_dx, _dy, _dx + _boxw, _dy + _boxh, false); // Inner border
draw_rectangle_color(_dx, _dy, _dx + _boxw, _dy + _boxh, c_gray, c_gray, c_gray, c_gray, true); // Fill

// Draw the text using your original system
var text_x = _dx + 16;
var text_y = _dy + 16;

// Draw speaker name if it exists
if (current_message >= 0 && current_message < array_length(messages))
{
    var _name = messages[current_message].name;
    if (_name != "")
    {
        draw_set_font(-1);
        draw_set_color(c_white);
        draw_set_halign(fa_left);
        draw_text(text_x, text_y, _name);
        text_y += 24; // Move down for the message
    }
}

// Draw the animated message
draw_set_color(c_white);
draw_text_ext(text_x, text_y, draw_message, -1, _boxw - 32);

// Draw "Press ENTER" prompt when text is complete
if (current_char >= string_length(messages[current_message].msg))
{
    draw_set_color(c_yellow);
    draw_set_halign(fa_right);
    draw_text(_dx + _boxw - 16, _dy + _boxh - 20, "Press ENTER");
    draw_set_halign(fa_left);
}