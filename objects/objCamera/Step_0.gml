if (!instance_exists(player1) || !instance_exists(player2)) exit;


want_split =
    point_distance(player1.x, player1.y, player2.x, player2.y) > split_dist;


if (!want_split)
{
    view_w = shared_w;
    view_h = shared_h;
}
else
{
    view_w = split_w;
    view_h = split_h;
}

camera_set_view_size(global.Cameras[0], view_w, view_h);
camera_set_view_size(global.Cameras[1], view_w, view_h);


var mid_x = (player1.x + player2.x) * 0.5;
var mid_y = (player1.y + player2.y) * 0.5;

var shared_x = clamp(mid_x - view_w * 0.5, 0, room_width  - view_w);
var shared_y = clamp(mid_y - view_h * 0.5, 0, room_height - view_h);

var p1_x = clamp(player1.x - view_w * 0.5, 0, room_width  - view_w);
var p1_y = clamp(player1.y - view_h * 0.5, 0, room_height - view_h);

var p2_x = clamp(player2.x - view_w * 0.5, 0, room_width  - view_w);
var p2_y = clamp(player2.y - view_h * 0.5, 0, room_height - view_h);

if (!want_split)
{
    camera_set_view_pos(
        global.Cameras[0],
        lerp(camera_get_view_x(global.Cameras[0]), shared_x, cam_lerp),
        lerp(camera_get_view_y(global.Cameras[0]), shared_y, cam_lerp)
    );

    view_set_visible(0, true);
    view_set_visible(1, false);
}
else
{
    camera_set_view_pos(
        global.Cameras[0],
        lerp(camera_get_view_x(global.Cameras[0]), p1_x, cam_lerp),
        lerp(camera_get_view_y(global.Cameras[0]), p1_y, cam_lerp)
    );

    camera_set_view_pos(
        global.Cameras[1],
        lerp(camera_get_view_x(global.Cameras[1]), p2_x, cam_lerp),
        lerp(camera_get_view_y(global.Cameras[1]), p2_y, cam_lerp)
    );

    view_set_visible(0, true);
    view_set_visible(1, true);
}

var w = display_get_width();
var h = display_get_height();

if (!want_split)
{
    view_set_xport(0, 0);
    view_set_yport(0, 0);
    view_set_wport(0, w);
    view_set_hport(0, h);
}
else
{
    view_set_xport(0, 0);
    view_set_yport(0, 0);
    view_set_wport(0, w div 2);
    view_set_hport(0, h);

    view_set_xport(1, w div 2);
    view_set_yport(1, 0);
    view_set_wport(1, w div 2);
    view_set_hport(1, h);
}
