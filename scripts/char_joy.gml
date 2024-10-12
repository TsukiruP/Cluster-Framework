/// char_joy(button, [style])
// Returns the character depending on the button

var button_id, input_style;

// Initialize:
button_id = argument0;
input_style = 0;

// Set style:
if (argument_count >= 2)
{
    input_style = argument[1];
}

// Return chracter:
return chr(128 + button_id + (input_style * 18));
