draw_self();

// Show interaction hint when players are close
var p1_near = instance_nearest(x, y, obj_player) != noone && distance_to_point(instance_nearest(x, y, obj_player).x, instance_nearest(x, y, obj_player).y) < interact_range;
var p2_near = instance_nearest(x, y, obj_player2) != noone && distance_to_point(instance_nearest(x, y, obj_player2).x, instance_nearest(x, y, obj_player2).y) < interact_range;

if (p1_near || p2_near) {
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_font(-1); // Default font
    draw_text_transformed(x, y - 25, "Press TAB or RETURN", 0.7, 0.7, 0); // Scaled to 70% size
    draw_set_halign(fa_left);
}