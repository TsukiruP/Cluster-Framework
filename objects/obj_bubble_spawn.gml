#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bubble Spawn Initialization

event_inherited();
cycle_id = 0;
cycle_state = 0;
cycle_frequency = 0;
cycle_count = 0;
cycle_alarm = irandom_range(128, 255);

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
/// Spawn Bubble

if (game_ispaused(mnu_pause)) exit;

if (cycle_state == 0)
{
    if (cycle_alarm > 0)
    {
        cycle_alarm -= 1;
        if (cycle_alarm == 0)
        {
            cycle_state = 1;
            cycle_id = irandom_range(0, 3);
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
        with (instance_create(x + irandom_range(-8, 8), y, obj_bubble))
        {
            size = other.cycle_set[other.cycle_id, other.bubble_count];
        }

        bubble_count += 1;
        bubble_alarm = irandom_range(0, 31);
    }

    if (bubble_count == bubble_max_count)
    {
        cycle_state = 0;
        cycle_alarm = irandom_range(128, 255);
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Bubble Spawn

draw_self();
event_inherited();
