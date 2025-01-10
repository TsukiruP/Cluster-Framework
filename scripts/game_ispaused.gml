/// game_ispaused([manager])
/* Returns true or false based on the variables of the text manager or pause manager.
Defaults to checking both managers should neither be the argument given, or no argument was given. */

var pause_text, pause_stage;

pause_text = (!ds_list_empty(mgr_text.body_list) || mgr_text.subject_string != "" || mgr_text.log_alpha != 0);
pause_stage = false;

if (instance_exists(mnu_pause))
{
    pause_stage = mnu_pause.pause_active;
}

if (argument_count >= 1)
{
    // Text:
    if (argument[0] == mgr_text)
    {
        return pause_text;
    }

    // Pause:
    else if (argument[0] == mnu_pause)
    {
        return pause_stage;
    }
}

return (pause_text || pause_stage);
