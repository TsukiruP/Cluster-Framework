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

// Volume:
sound_kind_volume(1, 0);

// Music variables:
bgm_index = "";
bgm_handle = -1;

// Loop points:
sound_set_loop("bgm_debug", 2304672, 9984665, unit_samples);
sound_set_loop("bgm_basic_test_1", 1024258, 5121290, unit_samples);
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

// Jingle variables
jng_index = "";
jng_handle = -1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Music
/*
// Fade Out:
if (fade_out == true)
{
    if (sound_kind_get_volume(3) != 0)
    {
        sound_kind_volume(3, max(sound_kind_get_volume(3) - 0.01, 0));
    }
    else
    {
        // Discard music:
        if (music_instance != -1)
        {
            sound_stop(music_instance);
            sound_discard(music_instance);
            music_instance = -1;
        }

        // Discard jingle:
        if (jingle_instance != -1)
        {
            sound_stop(jingle_instance);
            sound_discard(jingle_instance);
            jingle_instance = -1;
        }

        // Reset flag:
        fade_out = false;
    }
}

// Fade In:
if (fade_out == false)
{
    // Don't if drowning is playing:
    if (!sound_isplaying("bgm_drown"))
    {
        // Fade in jingle first:
        if (jingle_instance != -1)
        {
            if (sound_get_volume(jingle_instance) != 1)
            {
                sound_volume(jingle_instance, min(1, sound_get_volume(jingle_instance) + 0.01));
            }
        }
        
        // Fade in music:
        else if (music_instance != -1)
        {
            if (sound_get_volume(music_instance) != 1)
            {
                sound_volume(music_instance, min(1, sound_get_volume(music_instance) + 0.01));
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Quiet Music
/*
// Drowning takes priority:
if (!sound_isplaying("bgm_drown"))
{
    // Next is the jingles:
    if (jingle_instance != -1)
    {
        if (music_instance != -1)
        {
            sound_volume(music_instance, 0);
        }
    }
}
else
{
    if (music_instance != -1)
    {
        sound_volume(music_instance, 0);
    }

    if (jingle_instance != -1)
    {
        sound_volume(jingle_instance, 0);
    }
}

// Clear jingle:
if (jingle_instance != -1 && !sound_isplaying("bgm_invin") && !sound_isplaying("bgm_speed"))
{
    sound_discard(jingle_instance)
    jingle_instance = -1;
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
