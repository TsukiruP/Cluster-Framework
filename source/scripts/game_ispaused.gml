/// game_ispaused([controller])
/// @desc Returns whether the game is considered paused.
/// @param {object} [controller] Specific pause source.
/// @returns {bool}

var _controller; if (argument_count > 0) _controller = argument[0]; else _controller = undefined;

var pause_text; pause_text = false;
var pause_transition; pause_transition = false;
var pause_credits; pause_credits = instance_exists(mnu_credits);
var pause_stage; pause_stage = false;

with (ctrl_text) pause_text = (!ds_list_empty(body_list) || subject_string != "" || log_alpha != 0);
with (ctrl_transition) pause_transition = ((transition_index == TRANS_CARD && (transition_state > 1 && transition_state < 4)) || (transition_index == TRANS_RETRY && transition_state == 4));
with (mnu_pause) pause_stage = pause_active;

if (!is_undefined(_controller))
{
    if (_controller == ctrl_text) return pause_text;
    else if (_controller = mnu_credits) return pause_credits;
    else if (_controller == mnu_pause) return pause_stage;
}

return (pause_text || pause_transition || pause_credits || pause_stage);
