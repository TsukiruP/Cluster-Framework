/// char_pad(button, [style])
/* Returns a character depending on the button. */

var button_index, input_style;

button_index = argument0;
input_style = 0;
if (argument_count > 1) input_style = argument[1];
return chr(128 + button_index + (input_style * 18));
