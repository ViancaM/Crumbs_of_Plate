if (instance_exists(obj_dialog)) exit;

if (keyboard_check_pressed(vk_enter))
{
    create_dialog([
	{
		name: "Test dialog!",
		msg: "It works!"
	}
	])
}


var _hor = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var _ver = keyboard_check(ord("S")) - keyboard_check(ord("W"));

// Move with collision (doors block when closed)
var d = instance_find(obj_door, 0);
if (d != noone && !d.door_open)
    move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, obj_boulder, obj_door]);
else
    move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap, obj_boulder]);


if (_hor != 0 or _ver != 0){
    if(_ver > 0) sprite_index = spr_player_walk_down;
    else if (_ver < 0) sprite_index = spr_player_walk_up;
    else if (_hor > 0) sprite_index = spr_player_walk_right;
    else if (_hor < 0) sprite_index = spr_player_walk_left;
} else {
    if (sprite_index == spr_player_walk_right) sprite_index = spr_player_idle_right;
    else if (sprite_index == spr_player_walk_left) sprite_index = spr_player_idle_left;
    else if (sprite_index == spr_player_walk_up) sprite_index = spr_player_idle_up;
    else if (sprite_index == spr_player_walk_down) sprite_index = spr_player_idle_down;
}

if (keyboard_check_pressed(vk_space))
{
    if (carried_item != noone)
    {
        // Drop key
        carried_item.picked_up = false;
        carried_item.owner = noone;
        carried_item = noone;
        has_key = false;
        global.has_key = 0;
    }
    else
    {
        // Pick up key if under player
        var item = instance_place(x, y, obj_key);
        if (item != noone)
        {
            if (item.owner != noone && item.owner != id)
            {
                item.owner.has_key = false;
                item.owner.carried_item = noone;
            }

            carried_item = item;
            has_key = true;
            item.owner = id;
            item.picked_up = true;

            global.has_key = 1;
        }
    }
}

