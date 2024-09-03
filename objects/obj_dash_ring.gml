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
rainbow_index = spr_rainbow_ring_vertical;
rainbow_score = true;
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

// Set rainbow ring:
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
/// Field Initialization

event_inherited();

//field rainbow_ring: bool

/*preview
    var spring_orientation, flip_x, flip_y;

    spring_orientation = Field("spring_orientation", 0);
    flip_x             = Field("flip_x", 0);
    flip_y             = Field("flip_y", 0);
    rainbow_ring       = Field("rainbow_ring", 0);

    switch (spring_orientation) {
        case 0:
            if (rainbow_ring == true) {
                sprite_index = Sprite("spr_rainbow_ring_vertical",  0);
            } else {
                sprite_index = Sprite("spr_dash_ring_vertical",  0);
            }
            break;

        case 1:
            if (rainbow_ring == true) {
                sprite_index = Sprite("spr_rainbow_ring_horizontal",  0);
            } else {
                sprite_index = Sprite("spr_dash_ring_horizontal",  0);
            }
            break;

        case 2:
            if (rainbow_ring == true) {
                sprite_index = Sprite("spr_rainbow_ring_diagonal",  0);
            } else {
                sprite_index = Sprite("spr_dash_ring_diagonal",  0);
            }
            break;
    }

    image_xscale = 1;
    image_yscale = 1;

    if (flip_x == true) {
        image_xscale = -1;
    }

    if (flip_y == true) {
        image_yscale = -1;
    }
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ring Initialization

// Sprite index:
switch (spring_orientation) {
    // Vertical:
    case SPRING_VERTICAL:
        sprite_index  = spr_dash_ring_vertical;
        rainbow_index = spr_rainbow_ring_vertical;
        spring_angle  = ANGLE_UP;
        set_hurtbox(26, 5, 26, 6);
        break;

    // Horizontal:
    case SPRING_HORIZONTAL:
        sprite_index  = spr_dash_ring_horizontal;
        rainbow_index = spr_rainbow_ring_horizontal;
        spring_angle  = ANGLE_RIGHT;
        set_hurtbox(6, 24, 7, 26);
        break;

    // Diagonal:
    case SPRING_DIAGONAL:
        sprite_index  = spr_dash_ring_diagonal;
        rainbow_index = spr_rainbow_ring_diagonal;
        spring_angle  = ANGLE_RIGHT_UP;
        set_hurtbox(7, 7, 7, 7);
        break;
}

// Flip x:
if (flip_x == true) {
    image_xscale = -1;
    spring_angle = 180 - spring_angle;
}

// Flip y:
if (flip_y == true) {
    image_yscale = -1;
    spring_angle = 360 - spring_angle;
}

// Overlay:
with (instance_create(x, y, obj_dash_ring_overlay)) {
    overlay_handle = other.id;
    image_xscale   = other.image_xscale;
    image_yscale   = other.image_yscale;
    image_angle    = other.image_angle;
}
