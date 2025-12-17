if (!want_split) exit;

var w = display_get_width();
var h = display_get_height();
var split_x = w div 2;

draw_set_color(c_black);
draw_rectangle(split_x - 2, 0, split_x + 2, h, false);
