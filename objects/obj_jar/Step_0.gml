if (captured_player == noone || !instance_exists(captured_player)) {
    instance_destroy();
    exit;
}


if (instance_exists(captured_player))
{
    x = captured_player.x;
    y = captured_player.y;
}

var helper = noone;
var p1 = instance_place(x, y, obj_player);
var p2 = instance_place(x, y, obj_player2);

if (p1 != noone && p1 != captured_player) helper = p1;
if (p2 != noone && p2 != captured_player) helper = p2;

if (helper != noone)
{
    
    with (captured_player) {
        captured = false;
        in_jar = false;
        visible = true;
        jar_instance = noone;
        hp = max_hp * 0.5;
    }
    instance_destroy();
    exit;
}

if (instance_number(obj_jar) >= 2) {
    room_goto(Room_4DemoEnd);
}