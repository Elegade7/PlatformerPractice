/// @description Hover Arrow Indicator


// create and destroy logic for oArrowSign's
if (instance_exists(oPlayer)){
if (point_in_circle(oPlayer.x, oPlayer.y, x, y, 64) && !instance_exists(oArrowSign) && !hover_arrow_lock){
	hover_arrow = instance_create_layer(x, y-24, "Entities", oArrowSign);
}
else if (!point_in_circle(oPlayer.x, oPlayer.y, x, y, 64) && instance_exists(oArrowSign))
	instance_destroy(hover_arrow);
}