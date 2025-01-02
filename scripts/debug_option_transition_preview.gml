/// debug_option_transition_preview(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Preview:";

    // Value:
    case 1:
        return pick(transition_preview, "Fade", "Menu", "Title Card", "Retry");

    // Confirm:
    case 2:
        transition_create(transition_room, transition_preview, true)
        return true;

    // Update:
    case 3:
        transition_preview += menu_x_direction;
        transition_preview = wrap(transition_preview, TRANS_FADE, TRANS_RETRY);
        return true;

    // Undefined:
    default:
        return undefined;
}
