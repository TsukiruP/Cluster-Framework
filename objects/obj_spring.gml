#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();

// Reaction:
reaction_index = player_reaction_spring;

// Spring variables:
spring_orientation = ORIEN_VERTICAL;
spring_flip_x      = false;
spring_flip_y      = false;
spring_strength    = 8;
spring_angle       = 0;

spring_active      = false;
spring_sfx         = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// SFX

if (spring_sfx > 0) {
    spring_sfx -= 1;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

// Exit if the game is paused or the object is a dash/rainbow ring:
if (game_ispaused(ctrl_pause)|| object_is_ancestor(self.object_index, obj_dash_ring)) {
    exit;
}

// Execute script:
if (spring_active == true) {
    ctl_update();
    script_execute(ctl_index);
}

// Reset frame:
if (spring_active == false) {
    timeline_set(ctl_index);
    image_index = 0;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field spring_orientation: enum(0, 1, 2)
//field spring_flip_x: bool
//field spring_flip_y: bool
//field spring_strength: number

/*preview
    var spring_orientation, spring_flip_x, spring_flip_y;

    image_xscale       = 1;
    image_yscale       = 1;
    spring_orientation = Field("spring_orientation", 0);
    spring_flip_x      = Field("spring_flip_x", 0);
    spring_flip_y      = Field("spring_flip_y", 0);

    switch (spring_orientation) {
        // Horizontal:
        case 1:
            sprite_index = Sprite("spr_spring_horizontal", 0);
            break;

        // Diagonal:
        case 2:
            sprite_index = Sprite("spr_spring_diagonal", 0);
            break;

        // Vertical
        default:
            sprite_index = Sprite("spr_spring_vertical",  0);
    }

    // Flip x:
    if (spring_flip_x == true) {
        image_xscale = -1;
    }

    // Flip y:
    if (spring_flip_y == true) {
        image_yscale = -1;
    }
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

// Spring orientation:
switch (spring_orientation) {
    // Horizontal:
    case ORIEN_HORIZONTAL:
        sprite_index = spr_spring_horizontal;
        spring_angle = ANGLE_RIGHT;
        ctl_initialize(ctl_spring_horizontal);
        set_hurtbox(16, 5, 4, 5);
        break;

    // Diagonal:
    case ORIEN_DIAGONAL:
        sprite_index = spr_spring_diagonal;
        spring_angle = ANGLE_RIGHT_UP;
        ctl_initialize(ctl_spring_diagonal);
        set_hurtbox(6, 2, 4, 8);
        break;

    // Vertical:
    default:
        sprite_index = spr_spring_vertical;
        spring_angle = ANGLE_UP;
        ctl_initialize(ctl_spring_vertical);
        set_hurtbox(5, 4, 5, 15);
}

// Flip x:
if (spring_flip_x == true) {
    image_xscale = -1;
    spring_angle = 180 - spring_angle;
}

// Flip y:
if (spring_flip_y == true) {
    image_yscale = -1;
    spring_angle = 360 - spring_angle;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Spring

// Spring:
draw_self();

// Collision:
event_inherited();
