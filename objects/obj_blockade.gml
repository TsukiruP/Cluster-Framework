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
blockade_orientation = ORIEN_VERTICAL;
blockade_health      = 3;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field blockade_orientation: enum(0, 1)

/*preview
    var blockade_orientation, spike_flip;

    spike_orientation = Field("blockade_orientation", 0);

    switch (spike_orientation) {
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
switch (blockade_orientation) {
    // Horizontal:
    case ORIEN_HORIZONTAL:
        sprite_index = spr_blockade_horizontal;
        set_hurtbox(24, 12, 23, 11);
        break;

    // Vertical:
    default:
        sprite_index = spr_blockade_vertical;
        set_hurtbox(12, 24, 11, 23);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Blockade

// Blockade:
image_index = image_number - blockade_health;
draw_self();

// Collision:
event_inherited();
