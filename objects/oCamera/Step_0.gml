/* Camera Step Event
 * - logic for camera to follow oPlayer
 */
 
// Update destination
if (instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
	
	if ((follow).object_index == oPDead){
		x = xTo;
		y = yTo;
	}
}

// Update Object Position
x += (xTo - x) / 25;
y += (yTo - y) / 25;


// Clamp camera to not go oustide of the room
// 'buff' added for screen shale
x = clamp(x, view_w_half + buff, room_width - view_w_half - buff);
y = clamp(y, view_h_half + buff, room_height - view_h_half - buff); 


//Screen Shake
x += random_range(-shake_remain, shake_remain);
y += random_range(-shake_remain, shake_remain);
shake_remain = max(0, shake_remain - ((1/shake_length) * shake_magnitude));


// Update camera view
camera_set_view_pos(cam, x - view_w_half, y - view_h_half);

// Background paralaxing
/*
 * This call can have performance costs:
 * You could instead store the layer_id in a variable at the create event-
 * and then check for its existence with its ID.
 */

if (layer_exists("Mountains")){
	layer_x("Mountains", x/2);
}

if (layer_exists("Trees")){
	layer_x("Trees", x/4);
}
