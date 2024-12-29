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

// Load menu sounds:
sound_add_directory("data\audio\sfx\menu", ".wav", 0, true);

// Volume:
sound_kind_volume(0, game_config_get("audio_sfx") / 100);

// Sound list:
sfx_list = ds_list_create();

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
sound_kind_volume(1, game_config_get("audio_bgm") / 100);

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
sound_kind_volume(3, game_config_get("audio_bgm") / 100);

// Jingle handles:
jng_handle = -1;
drown_handle = -1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sound List

var i, pos;

for (i = 0; i < ds_list_size(sfx_list); i += 1)
{
    if (!sound_isplaying(ds_list_find_value(sfx_list, i)))
    {
        ds_list_delete(sfx_list, i);
    }
}
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
    audio_drown_fade(true);

    // Reset:
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
/// Cleanup

var i, j, audio_list, audio_index;

// Stop all audio:
audio_stop_all();
ds_list_destroy(sfx_list);

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
