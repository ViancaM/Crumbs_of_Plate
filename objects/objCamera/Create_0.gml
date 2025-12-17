player1 = obj_player;
player2 = obj_player2;

shared_w = 800;
shared_h = 450;

split_w = 560;  
split_h = 450;

view_w = shared_w;
view_h = shared_h;

split_dist = 450;
cam_lerp   = 0.12;
want_split = false;

view_enabled = true;
global.Cameras = array_create(2);

for (var i = 0; i < 2; i++)
{
    global.Cameras[i] = camera_create_view(
        0, 0,
        view_w, view_h,
        0,
        -1, -1, -1, -1
    );
    view_set_camera(i, global.Cameras[i]);
}

view_set_visible(0, true);
view_set_visible(1, false);

camera_set_view_pos(
    global.Cameras[0],
    clamp(player1.x - view_w * 0.5, 0, room_width - view_w),
    clamp(player1.y - view_h * 0.5, 0, room_height - view_h)
);

camera_set_view_pos(
    global.Cameras[1],
    clamp(player2.x - view_w * 0.5, 0, room_width - view_w),
    clamp(player2.y - view_h * 0.5, 0, room_height - view_h)
);

window_set_size(1366, 768);
