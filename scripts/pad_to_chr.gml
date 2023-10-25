// pad_to_chr(pad)
// Returns a character based on the given joystick button.

// Return chracter:
/* [PLACEHOLDER]
switch(argument0) {
    case gp_face1: return chr(127 + global.input_misc_style * 16); // Bottom face button
    case gp_face2: return chr(128 + global.input_misc_style * 16); // Right face button
    case gp_face3: return chr(129 + global.input_misc_style * 16); // Left face button
    case gp_face4: return chr(130 + global.input_misc_style * 16); // Top face button
    case gp_shoulderl: return chr(131 + global.input_misc_style * 16); // Left bumper
    case gp_shoulderr: return chr(132 + global.input_misc_style * 16); // Right bumper
    case gp_shoulderlb: return chr(133 + global.input_misc_style * 16); // Left trigger
    case gp_shoulderrb: return chr(134 + global.input_misc_style * 16); // Right trigger
    case gp_select: return chr(135 + global.input_misc_style * 16); // Select
    case gp_start: return chr(136 + global.input_misc_style * 16); // Start
    case gp_stickl: return chr(137 + global.input_misc_style * 16); // Left stick press
    case gp_stickr: return chr(138 + global.input_misc_style * 16); // Right stick press
    case gp_padu: return chr(139 + global.input_misc_style * 16); // Dpad up
    case gp_padd: return chr(140 + global.input_misc_style * 16); // Dpad down
    case gp_padl: return chr(141 + global.input_misc_style * 16); // Dpad left
    case gp_padr: return chr(142 + global.input_misc_style * 16); // Dpad right
}
