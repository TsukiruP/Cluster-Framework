#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spawn Player

instance_create(0, 0, ctrl_stage);

if (game_checkpoint_isset())
{
    x = game_checkpoint_get_x();
    y = game_checkpoint_get_y();
    stage_set_time(game_checkpoint_get_time());
}

for ({var i; i = 0}; i < PLAYER_COUNT; i += 1)
{
    if (save_get_character(i) != -1)
    {
        stage_add_player(instance_create(x - (30 * i), y, obj_player));

        with (stage_get_player(i))
        {
            character_index = save_get_character(i);
            input_allow = false;

            if (i == 0)
            {
                var camera; camera = instance_create(x, y, ctrl_camera);
                camera.focus_inst = stage_get_player(i);
            }
        }
    }
}

if (instance_number(obj_player) > 1)
{
    with (ctrl_input) event_user(0);
}

instance_destroy();
