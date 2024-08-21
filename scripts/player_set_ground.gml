/// player_set_ground(obj)
// Assigns the given solid as the player's current ground.

var sine, csine;

// Confirm assignment:
ground_id = argument0;
on_ground = true;

// Calculate and set new ground angle:
angle          = player_get_angle(ground_id, mask_rotation);
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
