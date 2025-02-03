/// debug_option_save_rename(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Rename Save";

    // Confirm:
    case 2:
        keyboard_string = game_get_save("name");
        rename_allow = true;
        rename_backup = keyboard_string;
        return true;

    // Undefined:
    default:
        return undefined;
}
