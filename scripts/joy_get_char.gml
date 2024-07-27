/// joy_get_char(button, [style])
// Returns the character for the indicated button.

var button_id, input_style;

// Button id:
button_id = argument[0];

// Set style:
if (argument_count >= 2) {
    input_style = argument[1];
} else {
    input_style = 0;
}

// Return chracter:
return chr(128 + button_id + (input_style * 18));
