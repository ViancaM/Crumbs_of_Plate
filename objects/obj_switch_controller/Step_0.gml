// obj_controller Step Event
if (!key_spawned) {
    var all_occupied = true;

    for (var i = 0; i < total_switches; i++) {
        if (!switch_array[i].occupied) {
            all_occupied = false; // at least one switch is not pressed
            break;
        }
    }

    if (all_occupied) {
        // Spawn the key only now
        instance_create_layer(200, 200, "Instances", obj_key); // replace coordinates as needed
        key_spawned = true; // make sure it only spawns once
    }
}

// obj_switch Step Event Enhancement
//if (occupied) sprite_index = spr_switch_on;
//else sprite_index = spr_switch_off;