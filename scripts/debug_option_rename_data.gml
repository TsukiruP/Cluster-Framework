/// debug_option_rename_data(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Rename Data";

    // Confirm:
    case 2:
        keyboard_string = game_save_get("name");
        rename_allow = true;
        rename_backup = keyboard_string;
        return true;

    // Undefined:
    default:
        return undefined;
}
