#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Rhino Initialization

event_inherited();
class = ENE_SUPER;
explosion_y_offset = 12;
rhino_range = 128;
rhino_alarm = 0;
dust_alarm = 0;
ram_speed = 0;
sequence_init(seq_rhino_move);
with (instance_create(x, y, obj_rhino_spring)) rhino_inst = other.id;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarms

event_inherited();
if (game_ispaused()) exit;

if ((sequence_index == seq_rhino_move || sequence_index == seq_rhino_charge) && rhino_alarm > 0) rhino_alarm = roundto_step(rhino_alarm, -sequence_speed);
if (sequence_index == seq_rhino_charge && dust_alarm > 0) dust_alarm = roundto_step(dust_alarm, -sequence_speed);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();

// Move:
if (sequence_index == seq_rhino_move && rhino_alarm == 0)
{
    x += sequence_speed * image_xscale;

    if (enemy_get_border_hor()) sequence_set(seq_rhino_move_turn);
    else
    {
        var player_inst; player_inst = enemy_get_player_front(rhino_range, true);

        if (instance_exists(player_inst))
        {
            rhino_alarm = 32;
            sequence_set(seq_rhino_charge);
            audio_play_sfx("snd_spin_dash_charge", true);
        }
    }
}

// Charge:
else if (sequence_index == seq_rhino_charge)
{
    // Start ram:
    if (rhino_alarm == 0)
    {
        ram_speed = 1;
        sequence_set(seq_rhino_ram);
        audio_play_sfx("snd_spin_dash_release", true);
        audio_stop_sfx("snd_spin_dash_charge");
    }

    // Create dust:
    if (dust_alarm == 0)
    {
        effect_create(x - 16 * image_xscale + irandom_range(-16, 16), y + 11 * image_yscale, seq_brake, -depth, image_xscale, image_yscale);
        dust_alarm = 4;
    }
}

// Ram:
else if (sequence_index == seq_rhino_ram)
{
    x += ram_speed * sequence_speed * image_xscale;
    ram_speed = min(ram_speed * 2, 8);

    if (enemy_get_border_hor() || position_meeting(x, y, par_solid))
    {
        rhino_alarm = 48;
        sequence_set(seq_rhino_move);
    }
}

sequence_execute();
