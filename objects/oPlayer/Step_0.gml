  /*
 * Step event:
 * - setting macros for keyboard_check functions
 * - checking for events and acting accordingly
 */

if (hascontrol){
	// key-event macros
	key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
	key_right = keyboard_check(vk_right) || keyboard_check(ord("D"));
	key_jump = keyboard_check_pressed(vk_space);


	if (key_left || key_right || key_jump){
		controller = 0;
	}

	// Controller Logic
	if (abs(gamepad_axis_value(0,gp_axislh)) > 0.2){
		key_left = abs(min(gamepad_axis_value(0, gp_axislh), 0));
		key_right = max(gamepad_axis_value(0, gp_axislh), 0);
		controller = 1;
	}
	if (gamepad_button_check(0, gp_shoulderl)){
		key_jump = 1;
		controller = 1;
	}
}
else
{
	key_right = 0;
	key_left = 0;
	key_jump = 0;
}


var move = key_right - key_left; // -1 for move left, 1 for move right
hsp = move * walksp; // horizontal speed which changes depending on move

vsp += grv; // vertical speed which changes depending on gravity

// Jumping
canjump-=1;
if (canjump > 0 && key_jump){
	vsp = -7
	canjump = 0;
}

// Collision detection
#region
// horizontal collision
if (place_meeting(x+hsp, y, oWall)){
	while(!place_meeting(x+sign(hsp), y, oWall)){
		x += sign(hsp);
	}
	hsp = 0;
}
x += hsp; // change objects horizontal position in the room 

// vertical collision
if (place_meeting(x, y+vsp, oWall)){
	while(!place_meeting(x, y+sign(vsp), oWall)){
		y += sign(vsp);
	}
	vsp = 0;
}
y += vsp; // change objects vertical position in the room
#endregion

/* 
 * Animation
 */
#region
// falling/jumping
if (!place_meeting(x, y+1, oWall)){
	sprite_index = sPlayerA; // set sprite to falling/jumping frames
	image_speed = 0; // don't animate the sprite
	// choose appropriate frame
	if (sign(vsp) > 0)
		image_index = 1;
	else
		image_index = 0;
}
// all other animation
else{
	canjump = 10; // setting our jump buffer to 10 "frames"
	if (sprite_index == sPlayerA){
		audio_sound_pitch(snLanding, choose(0.8, 1.0, 1.2));
		audio_play_sound(snLanding, 4, false);
	}
	image_speed = 1;
	if (hsp == 0){
		sprite_index = sPlayer;
	}
	else{
		sprite_index = sPlayerR;
	}
}

if (hsp != 0){
	image_xscale = sign(hsp);
}
#endregion