#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spawn Player

// Move to checkpoint:
if (checkpoint_isset())
{
    x = global.checkpoint_x;
    y = global.checkpoint_y;
}

// Create players:
for (i = 0; i < global.player_count; i += 1)
{
    var player_handle, player_character;

    player_character = global.player_data[i, 0];

    if (player_character >= CHAR_SONIC)
    {
        global.player_data[i, 1] = instance_create(x - (30 * i), y, obj_player);

        player_handle = player_get_instance(0);
        player_handle.player_slot = i;
        player_handle.character_id = player_character;
        player_handle.input_lock = true;

        // Create HUD:
        if (i == 0)
        {
            // Create camera:
            camera = instance_create(x, y, ctrl_camera);
            camera.focus_handle = player_handle;

            // Create HUD:
            instance_create(0, 0, ctrl_hud);
        }
        else if (i > 0)
        {
            player_handle.input_cpu = true;
        }
    }
}

// Create partner queues:
with (ctrl_input)
{
    event_user(0);
}

// Compile animations:
if (global.animation_grid == -1)
{
    player_compile_animations();
}

// Destroy:
instance_destroy();
