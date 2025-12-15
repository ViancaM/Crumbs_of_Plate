// obj_hand: Step Event
attack_timer++;

if (state == "idle") {
    attack_duration = 0;
}

if (state == "idle" && attack_timer > 120) { // every ~2 seconds
    attack_timer = 0;
    if (choose(0,1) == 0) {
        target_player = obj_player;
    } else {
        target_player = obj_player2;
    }
    state = "attacking";
}

if (state == "attacking" && instance_exists(target_player)) {
    var tx = target_player.x;
    var ty = target_player.y;
    
    // Move down toward player
    x = lerp(x, tx, 0.05); // smooth horizontal movement
    y += speed_down;
    
    // Check collision with player
    if (place_meeting(x, y, target_player)) {
        with (target_player) {
            hp -= 10; // damage
        }
        state = "returning";
    }

    if (attack_duration > room_speed * 4) { 
        state = "returning";
    }
}

if (state == "returning") {
    x = lerp(x, origin_x, 0.2);
    y = lerp(y, origin_y, 0.2);
    
    // Close enough to origin
    if (point_distance(x, y, origin_x, origin_y) < 4) {
        x = origin_x;
        y = origin_y;
        state = "idle";
    }
}