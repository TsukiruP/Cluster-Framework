/// transition_create(room, [transition, preview])

var transition;

// Initialize:
transition = instance_create(0, 0, mgr_transition);

with (transition)
{
    transition_id = game_room_get_transition(argument0);
    transition_room = argument0;
    transition_run = game_room_get_run(argument0);

    // Override:
    if (argument_count >= 2)
    {
        transition_id = argument[1];
    }

    // Preview:
    if (argument_count >= 3)
    {
        preview = argument[2];
    }

    // Fade music:
    if (preview == false)
    {
        if (game_room_get_music() != game_room_get_music(transition_room))
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
