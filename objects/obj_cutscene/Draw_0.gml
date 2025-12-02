draw_clear(c_black);

draw_sprite(spr_storybook, 0, book_x, book_y);

draw_set_alpha(fade);

var safe_page = clamp(page, 0, pages_count - 1);

var art_sprite = page_art[safe_page];
var art_w = sprite_get_width(art_sprite);
var art_h = sprite_get_height(art_sprite);
draw_sprite(art_sprite, 0, art_center_x - art_w * 0.5, art_center_y - art_h * 0.5);


if (safe_page == 0 && show_players) {
    draw_sprite_ext(h_sprite, floor(h_frame), h_x, h_y, 1.5, 1.5, 0, c_white, fade);
    draw_sprite_ext(g_sprite, floor(g_frame), g_x, g_y, 1.5, 1.5, 0, c_white, fade);
}


draw_set_color(make_color_rgb(70, 45, 20));

var left_text_right = book_x + book_w * 0.65; 
var left_text_bottom = book_y + book_h * 0.90; 
var wrap_width = left_text_right - text_x;

var lines = string_split(page_text[safe_page], "\n"); 
var y_pos = text_y;
var line_height = 18; 

for (var i = 0; i < array_length(lines); i++) {
    var line = lines[i];

    draw_text_ext(text_x, y_pos, line, 4, wrap_width);

    y_pos += line_height;

    if (y_pos + line_height > left_text_bottom) break;
}

draw_set_alpha(1);
draw_set_color(c_white);
