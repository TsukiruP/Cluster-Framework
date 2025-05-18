#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stamina Initialization

event_inherited();
max_stamina = 0;
stamina = max_stamina;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

with (player_inst)
{
    other.max_stamina = pick(character_index == CHAR_MILES, max_energy, fly_max_time);
    other.stamina = pick(character_index == CHAR_MILES, energy, fly_max_time - fly_time);
}

if (stamina == max_stamina) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Stamina

var stamina_x; stamina_x = floor(x) + 24;
var stamina_y; stamina_y = floor(y) - 16;

draw_sprite(spr_stamina, 0, stamina_x, stamina_y);
draw_sprite_radial(spr_stamina, 1, stamina / max_stamina, stamina_x, stamina_y, 1, 1, c_white, 1, false);
