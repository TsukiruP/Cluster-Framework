#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bubble Spawn Initialization

event_inherited();
cycle_index = 0;
cycle_state = 0;
cycle_frequency = 0;
cycle_count = 0;
cycle_alarm = irandom_range(128, 255);

bubble_large = false;
bubble_count = 0;
bubble_max_count = 0;
bubble_alarm = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cycle Set Initialization

cycle_set[0, 0] = 0;
cycle_set[0, 1] = 0;
cycle_set[0, 2] = 0;
cycle_set[0, 3] = 0;
cycle_set[0, 4] = 1;
cycle_set[0, 5] = 0;

cycle_set[1, 0] = 0;
cycle_set[1, 1] = 0;
cycle_set[1, 2] = 0;
cycle_set[1, 3] = 1;
cycle_set[1, 4] = 0;
cycle_set[1, 5] = 0;

cycle_set[2, 0] = 1;
cycle_set[2, 1] = 0;
cycle_set[2, 2] = 1;
cycle_set[2, 3] = 0;
cycle_set[2, 4] = 0;
cycle_set[2, 5] = 0;

cycle_set[3, 0] = 0;
cycle_set[3, 1] = 1;
cycle_set[3, 2] = 0;
cycle_set[3, 3] = 0;
cycle_set[3, 4] = 1;
cycle_set[3, 5] = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

image_index = mod_time(game_get_time(), 6, sprite_get_number(sprite_index));
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spawn Bubble

if (game_ispaused(mnu_pause)) exit;

if (cycle_state == 0)
{
    if (cycle_alarm > 0)
    {
        cycle_alarm -= 1;

        if (cycle_alarm == 0)
        {
            cycle_index = irandom_range(0, 3);
            cycle_state = 1;
            bubble_large = false;
            bubble_count = 0;
            bubble_max_count = irandom_range(1, 6);
            bubble_alarm = 0;
        }
    }
}

if (cycle_state == 1)
{
    if (bubble_alarm > 0) bubble_alarm -= 1;

    if (bubble_alarm == 0)
    {
        var bubble_size; bubble_size = cycle_set[cycle_index, bubble_count];

        if (!bubble_large)
        {
            var bubble_check; bubble_check = (cycle_frequency == 0); // Always check when frequency is 0.

            // If the frequency isn't zero, then we have to check if we're on a large bubble frame.
            if (!bubble_check && cycle_frequency > 0 && cycle_count > 0) bubble_check = (cycle_count mod cycle_frequency == 0);

            if (bubble_check)
            {
                // Large bubbles spawn if the last one, or with a 1/4 chance:
                if (bubble_count == bubble_max_count - 1 || choose_weighted(false, 3, true, 1))
                {
                    bubble_size = 2;
                    bubble_large = true;
                }
            }
        }

        with (instance_create(x + irandom_range(-8, 8), y, obj_bubble))
        {
            size = bubble_size;
            if (bubble_size == 2) hitbox_set_hurtbox(12, 12, 12, 12);
        }

        bubble_count += 1;
        bubble_alarm = irandom_range(0, 31);
    }

    if (bubble_count == bubble_max_count)
    {
        cycle_state = 0;
        cycle_count += 1;
        cycle_alarm = irandom_range(128, 255);
    }
}
