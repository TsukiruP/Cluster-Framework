/// transition_create(room, [transition, preview])
/* Returns a transition controller. */

var transition;

transition = instance_create(0, 0, ctrl_transition);

with (transition)
{
    transition_index = game_get_room_transition(argument0);
    transition_room = argument0;
    transition_run = game_get_room_run(argument0);
    if (argument_count > 1) transition_index = argument[1];
    if (argument_count > 2) preview = argument[2];

    if (!preview)
    {
        if (game_get_room_music() != game_get_room_music(transition_room)) audio_fade_out();
        else audio_fade_jng(true);
    }
}

return transition;
