#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Boot Initialization

boot_state = 0;
boot_alpha = 0;
boot_fade = 0;
boot_speed = 0.033;
boot_alarm = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (boot_alarm > 0) boot_alarm -= 1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alpha

var boot_max_state; boot_max_state = 5;

if (input_get_check(INP_CONFIRM, CHECK_PRESSED))
{
    if (boot_state < boot_max_state - 1)
    {
        boot_state = roundto(boot_state, 2) + 1;
        boot_alpha = 1;
        boot_alarm = pick((boot_state - 1) div 2, 360, 180, 120);
    }
    else if (!instance_exists(ctrl_transition)) transition_create(rm_debug);
}

switch (boot_state mod 2)
{
    // Fade in:
    case 0:
        if (boot_fade < 0.6) boot_fade += 0.02;

        if (boot_alpha < 1 && boot_fade == 0.6)
        {
            boot_alpha += boot_speed;

            if (boot_alpha >= 1)
            {
                boot_state += 1;
                boot_alpha = 1;
                boot_alarm = pick((boot_state - 1) div 2, 360, 180, 120);
            }
        }
        break;

    // Fade out:
    default:
        if (boot_alarm == 0)
        {
            if (boot_state < boot_max_state)
            {
                if (boot_alpha > 0)
                {
                    boot_alpha -= boot_speed;

                    if (boot_alpha <= 0)
                    {
                        boot_state += 1;
                        boot_alpha = 0;
                    }
                }
            }
            else if (!instance_exists(ctrl_transition)) transition_create(rm_debug);
        }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Boot

var boot_string; boot_string = "";
var boot_x; boot_x = view_xview[view_current] + screen_get_width() / 2;
var boot_y; boot_y = view_yview[view_current] + screen_get_height() / 2;

// Fade:
draw_set1(c_black, boot_fade);
draw_rectangle(view_xview[view_current], view_yview[view_current], view_xview[view_current] + screen_get_width(), view_yview[view_current] + screen_get_height(), false);
draw_reset();

// Boot:
draw_set_alpha(boot_alpha);

switch (boot_state)
{
    // Warning:
    case 0:
    case 1:
        boot_string = "A few people may experience epileptic seizures when exposed to certain light patterns or flashing lights, such as while watching TV or playing video games, even those with no history of prior seizures or epilepsy." + "##" +
        "If you experience any of the following symptoms - altered vision, muscle or eye twitching, loss of awareness, disorientation, any involutary movement, or convulsions - IMMEDIATELY stop playing and consult your physician.";
        break;

    // Copyright:
    case 2:
    case 3:
        boot_string = "The Cluster Framework is a free to use, non profit Sonic the Hedgehog base." + "##" +
        "This framework is in no way affiliated with SEGA or Sonic Team. All associated characters, names, art, and music belong to their respective owners.";
        break;

    // FMOD:
    case 4:
    case 5:
        draw_sprite_ext(spr_boot, 0, boot_x, boot_y, 1, 1, 0, c_white, boot_alpha);
        break;
}

if (boot_string != "")
{
    draw_set_font(global.font_system);
    draw_set2(fa_middle, fa_center);
    draw_text_ext(boot_x, boot_y, boot_string, font_get_height(global.font_system), screen_get_width() - 84);
}

draw_reset();
