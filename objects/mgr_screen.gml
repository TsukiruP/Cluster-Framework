#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Screen Initialization

// Screen size:
screen_set_size(480, 270);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Resolution

switch (game_setting_get("screen_mode"))
{
    // 3DS:
    case 1:
        switch (game_setting_get("screen_ratio"))
        {
            // 4:3:
            case 1:
                if (!screen_is_equal(320, 240))
                {
                    screen_set_size(320, 240);
                }
                break;

            // 5:3:
            case 2:
                if (!screen_is_equal(400, 240))
                {
                    screen_set_size(400, 240);
                }
                break;

            // 16:9:
            default:
                if (!screen_is_equal(426, 240))
                {
                    screen_set_size(426, 240);
                }
                break;
        }
        break;

    // Misc.:
    case 2:
        if (!screen_is_equal(420, 240))
        {
            screen_set_size(420, 240);
        }
        break;

    // Default:
    default:
        switch (game_setting_get("screen_ratio"))
        {
            // 4:3:
            case 1:
                if (!screen_is_equal(360, 270))
                {
                    screen_set_size(360, 270);
                }
                break;

            // 16:9:
            default:
                if (!screen_is_equal(480, 270))
                {
                    screen_set_size(480, 270);
                }
        }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fullscreen

if (window_get_fullscreen() != game_setting_get("screen_full"))
{
    window_set_fullscreen(game_setting_get("screen_full"));
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Window

screen_set_window();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Caption

if (room_caption != GAME_NAME)
{
    room_caption = GAME_NAME;
}
