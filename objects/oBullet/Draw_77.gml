// upon collision with a wall, destroy the bullet.
// allows the bullet to be drawn even if it collides right away (happens after being drawn, hence post-draw)
if (place_meeting(x, y, oWall))
	instance_destroy();