var available_targets = [];
var p1 = instance_exists(obj_player) ? instance_nearest(x, y, obj_player) : noone;
var p2 = instance_exists(obj_player2) ? instance_nearest(x, y, obj_player2) : noone;


if (p1 != noone && !p1.in_jar) {
    array_push(available_targets, p1);
}
if (p2 != noone && !p2.in_jar) {
    array_push(available_targets, p2);
}

var target = noone;

if (array_length(available_targets) > 0) {

    var closest_dist = 10000;
    for (var i = 0; i < array_length(available_targets); i++) {
        var dist = point_distance(x, y, available_targets[i].x, available_targets[i].y);
        if (dist < closest_dist) {
            closest_dist = dist;
            target = available_targets[i];
        }
    }
    
    if (target != noone && closest_dist < chase_range) {
        target_x = target.x;
        target_y = target.y;
    } else {

        if (alarm[0] <= 0) {
            target_x = random_range(xstart - 80, xstart + 80);
            target_y = random_range(ystart - 80, ystart + 80);
            alarm[0] = 30;
        }
    }
} else {
    
    if (alarm[0] <= 0) {
        target_x = random_range(xstart - 80, xstart + 80);
        target_y = random_range(ystart - 80, ystart + 80);
        alarm[0] = 30;
    }
}

var _hor = clamp(target_x - x, -1, 1);
var _ver = clamp(target_y - y, -1, 1);

move_and_collide(_hor * move_speed, _ver * move_speed, [tilemap]);


if (instance_exists(obj_player) && !obj_player.in_jar) {
    if (distance_to_object(obj_player) < 20) {
        obj_player.hp -= 10;
    }
}

if (instance_exists(obj_player2) && !obj_player2.in_jar) {
    if (distance_to_object(obj_player2) < 20) {
        obj_player2.hp -= 10;
    }
}