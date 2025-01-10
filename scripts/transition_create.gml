/// transition_create(room, [transition, preview])
/* Creates a transition manager and returns it. */

var transition;

transition = instance_create(0, 0, mgr_transition);

with (transition)
{
    transition_id = game_get_room_transition(argument0);
    transition_room = argument0;
    transition_run = game_get_room_run(argument0);

    if (argument_count >= 2)
    {
        transition_id = argument[1];
    }

    if (argument_count >= 3)
    {
        preview = argument[2];
    }

    if (preview == false)
    {
        if (game_get_room_music() != game_get_room_music(transition_room))
        {
            audio_fade_out();
        }
        else
        {
            audio_fade_jng(true);
        }
    }
}

return transition;
