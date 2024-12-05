#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// SFX Initialization

// Character SFX:
sound_add_directory("data\audio\sfx\character\common", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\sonic", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\shield", ".wav", 0, true);

// Prop SFX:
sound_add_directory("data\audio\sfx\prop", ".wav", 0, true);

// Ring pan:
ring_pan = 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// BGM Initialization

// Room BGM:
sound_add_directory("data\audio\bgm", ".ogg", 1, true);

// BGM variables:
bgm_index = "";
bgm_handle = -1;

// BGM loops:
sound_set_loop("bgm_debug", 2304672, 9984665, unit_samples);
sound_set_loop("bgm_basic_test_1", 1024258, 5121290, unit_samples);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Pan
/*
if (sound_get_pan("snd_ring") != ring_pan)
{
    sound_pan("snd_ring", ring_pan);
}
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

        // Delete:
        sound_delete(audio_index);
        ds_list_delete(audio_list, i);
    }

    // Destroy:
    ds_list_destroy(audio_list);
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Play Invincibility Jingle
/*
// Clear jingle:
if (jingle_instance != -1)
{
    sound_stop(jingle_instance);
    sound_discard(jingle_instance);
    jingle_instance = -1;
}

// Set jingle:
if (jingle_instance == -1)
{
    jingle_instance = sound_play_single("bgm_invin");
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Play Speed Jingle
/*
// Clear jingle:
if (jingle_instance != -1)
{
    sound_stop(jingle_instance);
    sound_discard(jingle_instance);
    jingle_instance = -1;
}

// Set jingle:
if (jingle_instance == -1)
{
    jingle_instance = sound_play_single("bgm_speed");
}
#define Other_12
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Clear Jingle
/*
// Clear:
if (sound_isplaying("bgm_invin"))
{
    sound_stop("bgm_invin");
}

//
if (sound_isplaying("bgm_speed"))
{
    sound_stop("bgm_speed");
}
