/// fade_create(speed, target, [depth, color])
// Returns a newly created fade object.

fade             = instance_create(0, 0, ctrl_fade);
fade.fade_speed  = argument[0];
fade.fade_target = argument[1];

// Set depth:
if (argument_count >= 3) {
    fade.depth = argument[2];
} else {
    fade.depth = self.depth + 1;
}

// Set color:
if (argument_count >= 4) {
    fade.fade_color = argument[3];
}

// Return the fade controller:
return fade;
