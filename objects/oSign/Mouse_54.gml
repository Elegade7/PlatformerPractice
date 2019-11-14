 /// @description Read Sign


if (point_in_circle(oPlayer.x, oPlayer.y, x, y, 64) && !instance_exists(oText)){
	// lock and destroy hover_arrow
	hover_arrow_lock = true;
	instance_destroy(hover_arrow);
	
	with (instance_create_layer(x, y-64, layer, oText)){
		text = other.text;
		length = string_length(text);
	}
	
	with (oCamera)
		follow = other.id;
}
