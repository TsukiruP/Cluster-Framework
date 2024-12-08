#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sound Initialization

// Load character sounds:
sound_add_directory("data\audio\sfx\character\common", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\sonic", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\shield", ".wav", 0, true);

// Load prop sounds:
sound_add_directory("data\audio\sfx\prop", ".wav", 0, true);

// Volume:
sound_kind_volume(0, game_setting_get("audio_sfx"));

// Ring pan:
ring_pan = 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Music Initialization

// Load music:
sound_add_directory("data\audio\bgm", ".ogg", 1, true);

// Loop points:
sound_set_loop("bgm_debug", 2304672, 9984665, unit_samples);
sound_set_loop("bgm_basic_test_1", 1024258, 5121290, unit_samples);

// Volume:
sound_kind_volume(1, game_setting_get("audio_bgm"));

// Music handle:
bgm_handle = -1;

// Fade out:
fade_out = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Jingle Initialization

// Load jingles:
sound_add_directory("data\audio\jng", ".ogg", 3, true);

// Volume:
sound_kind_volume(3, game_setting_get("audio_bgm"));

// Jingle handle:
jng_handle = -1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Music Priority

// Drowning music takes highest priority:
if (audio_drown_isplaying())
{
    audio_bgm_mute();
    audio_jng_mute();
}

// Jingle has priority over music:
else
{
    if (audio_jng_isplaying())
    {
        audio_bgm_mute();
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Music Fade

// Fade out:
if (fade_out == true)
{
    audio_bgm_fade(true);
    audio_jng_fade(true);

    if (bgm_handle == -1 && jng_handle == -1)
    {
        fade_out = false;
    }
}
else
{
    if (!audio_drown_isplaying())
    {
        // Jingle:
        if (audio_jng_isplaying() == true)
        {
            audio_jng_fade(false);
        }

        // Music:
        else
        {
            audio_bgm_fade(false);
        }
    }
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Release Audio

var i, j, audio_list, audio_index;

// Stop all audio:
audio_stop_all();

for (i = 0; i < 4; i += 1)
{
    audio_list = sound_kind_list(i);

    for (j = 0; j < ds_list_size(audio_list); j += 1)
    {
        audio_index = ds_list_find_value(audio_list, i);

        if (sound_exists(audio_index))
        {
            // Delete:
            sound_delete(audio_index);
        }

        ds_list_delete(audio_list, i);
    }

    // Destroy:
    ds_list_destroy(audio_list);
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Discard Audio

audio_jng_stop();
audio_drown_stop();
