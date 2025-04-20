#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Overlay Initialization

// Image speed:
image_speed = 0;

// Rainbow handle:
rainbow_inst = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

if (rainbow_inst != noone) {
    image_index = rainbow_inst.image_index + 6;
}
