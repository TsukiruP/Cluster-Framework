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
spring_angle       = 0;
spring_strength    = 8;

spring_active      = false;
spring_sfx         = 0;

// Flip variables:
flip_x = false;
flip_y = false;
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
/// Animate

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
//field spring_strength: number
//field flip_x: bool
//field flip_y: bool

/*preview
    var spring_orientation, flip_x, flip_y;

    spring_orientation = Field("spring_orientation", 0);
    flip_x             = Field("flip_x", 0);
    flip_y             = Field("flip_y", 0);

    switch (spring_orientation) {
        case 0:
            sprite_index = Sprite("spr_spring_vertical",  0);
            break;

        case 1:
            sprite_index = Sprite("spr_spring_horizontal", 0);
            break;

        case 2:
            sprite_index = Sprite("spr_spring_diagonal", 0);
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
/// Spring Initialization

// Sprite index:
switch (spring_orientation) {
    // Vertical:
    case SPRING_VERTICAL:
        sprite_index = spr_spring_vertical;
        spring_angle = ANGLE_UP;
        ctl_initialize(ctl_spring_vertical);
        set_hurtbox(5, 4, 5, 15);
        break;

    // Horizontal:
    case SPRING_HORIZONTAL:
        sprite_index = spr_spring_horizontal;
        spring_angle = ANGLE_RIGHT;
        ctl_initialize(ctl_spring_horizontal);
        set_hurtbox(16, 5, 4, 5);
        break;

    // Diagonal:
    case SPRING_DIAGONAL:
        sprite_index = spr_spring_diagonal;
        spring_angle = ANGLE_RIGHT_UP;
        ctl_initialize(ctl_spring_diagonal);
        set_hurtbox(6, 2, 4, 8);
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
