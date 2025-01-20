#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Spawn

var i;

instance_create(0, 0, ctrl_stage);

if (game_checkpoint_isset())
{
    x = game_get_checkpoint_x();
    y = game_get_checkpoint_y();
    stage_set_time(game_get_checkpoint_time());
}

for (i = 0; i < PLAYER_COUNT; i += 1)
{
    if (game_get_save("player" + string(i)) != -1)
    {
        stage_add_player(instance_create(x - (30 * i), y, obj_player));

        with (stage_get_player(i))
        {
            character_id = game_get_save("player" + string(i));
            input_allow = false;

            if (i == 0)
            {
                camera = instance_create(x, y, ctrl_camera);
                camera.focus_handle = stage_get_player(i);
            }
        }
    }
}

if (instance_number(obj_player) > 1)
{
    with (ctrl_input) event_user(0);
}

instance_destroy();
