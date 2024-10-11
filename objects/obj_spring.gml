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
orientation = ORIEN_VERTICAL;
flip_x = false;
flip_y = false;
force = 8;
angle = 0;
activated = false;
sfx_alarm = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (sfx_alarm > 0)
{
    sfx_alarm -= 1;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

// Exit if the game is paused or the object is a dash/rainbow ring:
if (game_ispaused(ctrl_pause) || object_is_ancestor(self.object_index, obj_dash_ring))
{
    exit;
}

// Execute script:
if (activated == true)
{
    ctl_update();
    script_execute(ctl_index);
}

// Reset frame:
if (activated == false)
{
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

event_inherited();

//field orientation: enum(0, 1, 2)
//field flip_x: bool
//field flip_y: bool
//field force: number

/*preview
    var orientation, flip_x, flip_y;

    image_xscale = 1;
    image_yscale = 1;
    orientation = Field("orientation", 0);
    flip_x = Field("flip_x", 0);
    flip_y = Field("flip_y", 0);

    switch (orientation)
    {
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
    if (flip_x == true)
    {
        image_xscale = -1;
    }

    // Flip y:
    if (flip_y == true)
    {
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
switch (orientation)
{
    // Horizontal:
    case ORIEN_HORIZONTAL:
        sprite_index = spr_spring_horizontal;
        angle = ANGLE_RIGHT;
        ctl_initialize(ctl_spring_horizontal);
        set_hurtbox(16, 5, 4, 5);
        break;

    // Diagonal:
    case ORIEN_DIAGONAL:
        sprite_index = spr_spring_diagonal;
        angle = ANGLE_RIGHT_UP;
        ctl_initialize(ctl_spring_diagonal);
        set_hurtbox(6, 2, 4, 8);
        break;

    // Vertical:
    default:
        sprite_index = spr_spring_vertical;
        angle = ANGLE_UP;
        ctl_initialize(ctl_spring_vertical);
        set_hurtbox(5, 4, 5, 15);
}

// Flip x:
if (flip_x == true)
{
    image_xscale = -1;
    angle = 180 - angle;
}

// Flip y:
if (flip_y == true)
{
    image_yscale = -1;
    angle = 360 - angle;
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
