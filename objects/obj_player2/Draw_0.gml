if (!captured && !in_jar && room != Room_4DemoEnd) {
    draw_self();
    
    var bar_w = 32;
    var bar_h = 4;
    var hp_percent = hp / max_hp;
    var x1 = x - bar_w/2;
    var y1 = y - sprite_height/2 - 10;

    draw_set_color(c_red);
    draw_rectangle(x1, y1, x1 + bar_w, y1 + bar_h, false);
    draw_set_color(c_green);
    draw_rectangle(x1, y1, x1 + bar_w * hp_percent, y1 + bar_h, false);
}
