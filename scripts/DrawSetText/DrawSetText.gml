/// @desc DrawSetText(color, font, halign, valign)
/// @arg color
/// @arg font
/// @arg halign
/// @arg valign

/* 
 * Allows on line setup of major text drawing vars.
 * Requiring all four prevents forgetting one and
 * and therefore creating a dumb dependecy on other
 * event calls. (Then wondering why yout text 
 * changes later in development.)
 */

draw_set_color(argument0);
draw_set_font(argument1);
draw_set_halign(argument2);
draw_set_valign(argument3);
