#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Rhino Spring Initialization

event_inherited();
reaction_index = player_reaction_rhino_spring;
rhino_inst = noone;
sfx_alarm = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (sfx_alarm > 0) sfx_alarm -= 1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (instance_exists(rhino_inst))
{
    x = floor(rhino_inst.x);
    y = floor(rhino_inst.y);
    image_xscale = rhino_inst.image_xscale;
    image_yscale = rhino_inst.image_yscale;

    switch (rhino_inst.sequence_index)
    {
        case seq_rhino_move:
            hitbox_set_hurtbox(13, 9, 13, 9, 1, -9);
            break;

        case seq_rhino_move_turn:
            hitbox_set_hurtbox(11, 8, 11, 8, 1, -9);
            break;

        case seq_rhino_charge:
            hitbox_set_hurtbox(9, 15, 15, 1);
            break;

        case seq_rhino_ram:
            hitbox_set_hurtbox(13, 18, 10, 1);
            break;

        default:
            hitbox_set_hurtbox();
    }
}
else instance_destroy();
