draw_clear(c_black);
draw_sprite(spr_storybook, 0, book_x, book_y);

draw_set_alpha(fade);
draw_sprite(page_art[page], 0, art_x, art_y);

draw_sprite_ext(h_sprite, floor(h_frame), h_x, h_y, 1.15, 1.15, 0, c_white, fade);
draw_sprite_ext(g_sprite, floor(g_frame), g_x, g_y, 1.15, 1.15, 0, c_white, fade);

draw_set_color(make_color_rgb(70, 45, 20));

var wrap_w = (book_x + book_w * 0.65) - text_x;
var lines = string_split(page_text[page], "\n");
var yy = text_y;

for (var i = 0; i < array_length(lines); i++) {
    draw_text_ext(text_x, yy, lines[i], 4, wrap_w);
    yy += 18;
}

draw_set_alpha(1);
draw_set_color(c_white);
