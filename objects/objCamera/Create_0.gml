///@description camera
//#macro CameraWidth 640
//#macro CameraHeight 360
//#macro CameraScale 3
//#macro CameraSpeed 0.1

//cameraTarget = obj_player;
///global.Camera
//global.Camera = camera_create_view(0, 0, CameraWidth, CameraHeight);

//global.Camera = camera_create_view(0, 0, CameraWidth, CameraHeight, 0, obj_player, 4, 4, CameraWidth, CameraHeight)

//camera_set_view_border(global.Camera, CameraWidth, CameraHeight);
//camera_set_view_target(global.Camera, obj_player);
//camera_set_view_speed(global.Camera, 4, 4);

//view_enabled = true;
//view_visible[0] = true;
//view_set_camera(0, global.Camera);

///Viewport

//window_set_size(CameraWidth * CameraScale, CameraHeight * CameraScale);
//surface_resize(application_surface, CameraWidth * CameraScale, CameraHeight * CameraScale);
//var windowWidth = CameraWidth * CameraScale;
//var windowHeight = CameraHeight * CameraScale;
//window_set_position(display_get_width() / 2 - windowWidth / 2, display_get_height() / 2 - windowHeight / 2);

//Split Screen
playerList[0] = obj_player;
playerList[1] = obj_player2

view_enabled = true;

var width = 960, height = 540, scale = 1.5;

global.Cameras = undefined;

for(var i = 0; i < array_length_1d(playerList); ++i) {
	view_visible[i] = true;
	
	//create camera
	var CameraWidth = width / array_length_1d(playerList);
	global.Cameras[i] = camera_create_view(0, 0, CameraWidth, height, 0, playerList[i], -1, -1, CameraWidth, height);
	view_set_camera(i, global.Cameras[i]);
	
	//viewport
	view_xport[i] = CameraWidth * i;
	view_wport[i] = CameraWidth;
	
}

window_set_size(width * scale, height * scale);
surface_resize(application_surface, width * scale, height * scale);