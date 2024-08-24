/// player_set_ground(obj)
// Assigns the given solid as the player's current ground.

var new_angle, sine, csine;

// Confirm assignment:
ground_id     = argument0;
on_ground     = true;
on_surface    = false;

// Calculate ground angle:
new_angle = player_get_angle(ground_id, mask_rotation);

if (new_angle < 0) {
    new_angle = angle;
}

// Set new ground angle:
angle          = new_angle;
relative_angle = angle_wrap(angle - gravity_angle());

sine  = dsin(mask_rotation);
csine = dcos(mask_rotation);

// Rise up while inside:
repeat (y_radius * 2) {
    if (collision_box_vertical(x_radius, y_radius, mask_rotation, ground_id) != noone) {
        x -= sine;
        y -= csine;
    } else {
        break;
    }
}

// Snap down while outside:
repeat (y_radius * 2) {
    if (collision_box_vertical(x_radius, y_radius + 1, mask_rotation, ground_id) == noone) {
        x += sine;
        y += csine;
    } else {
        break;
    }
}

// Water surface:
if (instance_exists(obj_water_surface)) {
    if (mask_rotation == 0 && floor(y) + y_radius + 1 == obj_water_surface.y) {
        on_surface = true;
    }
}
