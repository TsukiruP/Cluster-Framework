#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();

// Hurtbox:
hurtbox_set(8, 8, 7, 7, 0, 0);

// Reaction:
reaction_index = player_reaction_ring;

// Ring variables:
ring_super = false;
ring_rate = 8;

// Dropped:
dropped = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Super Ring

if (ring_super == true)
{
    sprite_index = spr_ring_super;
    ring_rate = 6;
}
else
{
    sprite_index = spr_ring;
    ring_rate = 8;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause))
{
    exit;
}

image_index = sync_rate(global.object_time, ring_rate / (1 + (dropped == true)), sprite_get_number(sprite_index));
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

event_inherited();

//field ring_super: false

/*preview
    var ring_super;

    ring_super = Field("ring_super", 0);
    sprite_index = Sprite("spr_ring",  0);

    if (ring_super == true)
    {
        sprite_index = Sprite("spr_ring_super",  0);
    }
*/
