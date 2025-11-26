// Draw the sign sprite
draw_self();

// Show interaction hint when players are close
if (player_near) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_font(-1); // Default font
    draw_text_transformed(x, y - 25, "Press RETURN to read", 0.7, 0.7, 0); // Scaled to 70% size
    draw_set_halign(fa_left);
}