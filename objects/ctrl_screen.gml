#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Screen Initialization

screen_set_size(480, 270);
room_set_view_all(screen_width, screen_height);
window_resize_buffer(screen_width, screen_height, true, false);
window_set_fullscreen(game_get_config("screen_full"));
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update

if (screen_set_resolution())
{
    room_set_view_better(screen_width, screen_height);
    room_set_view_all(screen_width, screen_height);
}

screen_set_window();

if (game_get_config("screen_full") != window_get_fullscreen()) game_set_config("screen_full", window_get_fullscreen());
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Caption

if (room_caption != GAME_NAME) room_caption = GAME_NAME;
