#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Blockade Initialization

event_inherited();

// Mask:
mask = false;

// Reaction:
reaction_index = player_reaction_blockade;

// Blockade variables:
orientation = ORIEN_VERTICAL;
vitality = 3;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field blockade_orientation: enum(0, 1)

/*preview
    var orientation;

    orientation = Field("orientation", 0);

    switch (orientation)
    {
        // Horizontal:
        case 1:
            sprite_index = Sprite("spr_blockade_horizontal", 0);
            break;

        // Vertical:
        default:
            sprite_index = Sprite("spr_blockade_vertical", 0);
    }
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Blockade Initialization

// Blockade orientation:
switch (orientation)
{
    // Horizontal:
    case ORIEN_HORIZONTAL:
        sprite_index = spr_blockade_horizontal;
        set_hurtbox(24, 12, 23, 11);
        break;

    // Vertical:
    default:
        sprite_index = spr_blockade_vertical;
        set_hurtbox(13, 24, 12, 23);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Blockade

// Blockade:
image_index = image_number - vitality;
draw_self();

// Collision:
event_inherited();
