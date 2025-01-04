#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Spawn

var i;

// Create stage manager:
instance_create(0, 0, mgr_stage);

// Move to checkpoint:
if (game_checkpoint_isset())
{
    x = game_get_checkpoint_x();
    y = game_get_checkpoint_y();
    stage_set_time(game_get_checkpoint_time());
}

// Create players:
for (i = 0; i < PLAYER_COUNT; i += 1)
{
    if (game_get_save("player" + string(i)) != -1)
    {
        stage_set_player(i, instance_create(x - (30 * i), y, obj_player));

        with (stage_get_player(i))
        {
            player_id = i;
            character_id = game_get_save("player" + string(i));
            input_lock = true;

            // Create camera:
            if (i == 0)
            {
                camera = instance_create(x, y, mgr_camera);
                camera.focus_handle = stage_get_player(i);
            }

            // CPU input:
            else
            {
                input_cpu = true;
            }
        }
    }
}

// Create partner queues:
with (mgr_input)
{
    //event_user(0);
}

// Auto save:
if (!game_checkpoint_isset())
{
    game_set_save("stage", room);
    game_save_auto();
}

// Destroy:
instance_destroy();
