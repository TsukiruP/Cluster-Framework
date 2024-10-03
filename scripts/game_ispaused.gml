/// game_ispaused([controller])
/* Returns true or false based on the variables of the text controller or pause controller.
Defaults to checking both controllers should neither be the argument given, or no argument was given. */

var pause_text, pause_stage;

// Text pause:
pause_text = (ctrl_text.text_message != "" || ctrl_text.topic_message != "" || ctrl_text.log_alpha[1] != 0);

// Stage pause:
if (instance_exists(ctrl_pause))
{
    pause_stage = ctrl_pause.pause_active;
}
else
{
    pause_stage = false;
}

// Return:
if (argument_count >= 1)
{
    // Text:
    if (argument[0] == ctrl_text)
    {
        return pause_text;
    }

    // Pause:
    else if (argument[0] == ctrl_pause)
    {
        return pause_stage;
    }

    // Default to either:
    else
    {
        return (pause_text || pause_stage);
    }
}
else
{
    return (pause_text || pause_stage);
}
