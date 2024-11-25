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
    stage_set_timer(game_checkpoint_get_timer());
    x = game_checkpoint_get_x();
    y = game_checkpoint_get_y();
}

// Create players:
for (i = 0; i < game_get_player_count(); i += 1)
{
    if (game_save_get("player" + string(i)) != -1)
    {
        stage_set_player(i, instance_create(x - (30 * i), y, obj_player));

        with (stage_get_player(i))
        {
            player_id = i;
            character_id = game_save_get("player" + string(i));
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
    event_user(0);
}

// Destroy:
instance_destroy();
