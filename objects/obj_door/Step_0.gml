// Find both players
var p1 = instance_find(obj_player, 0);
var p2 = instance_find(obj_player2, 0);
if (!instance_exists(p1) || !instance_exists(p2)) exit;

// Distance 
var proximity_distance = 130;

// Distance to players
var d1 = point_distance(x, y, p1.x, p1.y);
var d2 = point_distance(x, y, p2.x, p2.y);

// Are both players nearby?
var both_near = (d1 <= proximity_distance) && (d2 <= proximity_distance);

// Check if key is near the door (whether carried or dropped)
var k = instance_find(obj_key, 0);
var key_distance = (k != noone) ? point_distance(x, y, k.x, k.y) : 1000;
var key_nearby = (key_distance <= proximity_distance);

// Open door if conditions met: both players near AND key near
if (!door_open && !opening && both_near && key_nearby) {
    opening = true;
    sprite_index = spr_door_animation;
    image_speed = 0.5;
}

// Finish animation
if (opening && image_index >= image_number - 1) {
    sprite_index = spr_door_open;
    image_speed = 0.2;
    door_open = true;
    opening = false;
    room_goto(Room_2Foyer);
}