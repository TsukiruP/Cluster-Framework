#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();

hurtbox_set(8, 8, 7, 7, 0, 0);
reaction_index = player_reaction_ring;

super = false;
rate = 8;
dropped = false;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Super Ring

if (super == true)
{
    sprite_index = spr_ring_super;
    rate = 6;
}
else
{
    sprite_index = spr_ring;
    rate = 8;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause))
{
    exit;
}

image_index = time_sync(game_get_time(), rate / (1 + (dropped == true)), sprite_get_number(sprite_index));
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field super: false

/*preview
    var super;

    super = Field("super", 0);
    sprite_index = Sprite("spr_ring",  0);

    if (super == true)
    {
        sprite_index = Sprite("spr_ring_super",  0);
    }
*/
