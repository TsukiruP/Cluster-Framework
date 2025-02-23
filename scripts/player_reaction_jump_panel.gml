/// player_reaction_jump_panel(obj, hitbox, side)
/* Really stupid commitment to game accuracy. */

var reaction_inst, hitbox, side;

reaction_inst = argument0;
hitbox = argument1;
side = argument2;


if ((hitbox & HIT_SOLID) && side == ANGLE_UP)
{
    image_xscale = reaction_inst.image_xscale;
    x_speed = reaction_inst.force * image_xscale;
    input_lock_alarm = 16;
    if (ground_inst != reaction_inst) player_set_ground(reaction_inst);

    if (hitbox & HIT_COLLISION)
    {
        y_speed = -6;
        player_set_state(player_state_ramp, true);
        audio_play_sfx("snd_dash_panel");
    }
}
