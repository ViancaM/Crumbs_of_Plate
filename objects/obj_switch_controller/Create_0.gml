// obj_controller Create Event
total_switches = instance_number(obj_switch); // counts all switches
key_spawned = false; // track if the key has already spawned

// Store all switches in an array for consistent checking
switch_array = array_create(total_switches, 0);
var i = 0;
with (obj_switch) {
    switch_array[i] = id;
    i += 1;
}