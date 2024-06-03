#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effect Initialization

// Image speed:
image_speed = 0;

// Timeline initialization:
ctl_initialize();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Execute Custom Timeline

if (ctl_index != noone) {
    script_execute(ctl_index);
}
