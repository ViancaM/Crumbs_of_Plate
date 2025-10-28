//proximity distance to detect players
var proximity_distance = 50; // Adjust as needed

//check if both players exist
if (instance_exists(obj_player) && instance_exists(obj_player2)) {
    
    // Get the two player instances
    var p1 = instance_find(obj_player, 0);
    var p2 = instance_find(obj_player2, 0);
    
    //calculate distance from door to players
    var distance_p1 = point_distance(x, y, p1.x, p1.y);
    var distance_p2 = point_distance(x, y, p2.x, p2.y);
    
    //check if both players are within proximity
    if (distance_p1 <= proximity_distance && distance_p2 <= proximity_distance) {
        
        //check if both players have the key item
        if (p1.has_key || p2.has_key) {
			show_debug_message("Moving to the next room.");
			room_goto(Room_4DemoEnd);
			
			//play a sound to indicate transition
            //audio_play_sound(snd_door_open, 1, false);
        }
    }
}