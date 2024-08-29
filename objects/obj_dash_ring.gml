#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ring Initialization

event_inherited();

// Image index:
image_index = 1;

// Rainbow variables:
rainbow_ring  = false;
rainbow_index = spr_rainbow_ring_left;
rainbow_score = true;

// Overlay:
with (instance_create(x, y, obj_dash_ring_overlay)) {
    overlay_handle = other.id;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Don't bother if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

if (rainbow_ring == true) {
    sprite_index = rainbow_index;
    image_index  = sync_rate(global.object_time, 4, 6) + 1;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/

event_inherited();

/*preview
    var spring_type, flip_x, flip_y;

    spring_type = Field("spring_type", 0);
    flip_x      = Field("flip_x", 0);
    flip_y      = Field("flip_y", 0);

    switch (spring_type) {
        case 0:
            sprite_index = Sprite("spr_dash_ring_vertical",  0);
            break;

        case 1:
            sprite_index = Sprite("spr_dash_ring_horizontal", 0);
            break;

        case 2:
            sprite_index = Sprite("spr_dash_ring_diagonal", 0);
            break;
    }
*/
