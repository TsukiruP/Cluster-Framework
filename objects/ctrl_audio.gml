#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Audio Initialization

// Load SFX:
sfx_map = audio_load_directory("data\audio\sfx");

/*
// Add character SFX:
sound_add_directory("data\audio\sfx\character\common", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\sonic", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\classic", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\shield", ".wav", 0, true);

// Add prop SFX:
sound_add_directory("data\audio\sfx\prop", ".wav", 0, true);

// Add BGM:
sound_add_directory("data\audio\bgm", ".ogg", 3, false);

// Ring pan:
ring_pan = 1;

// Music variables:
music_instance = -1;
jingle_instance = -1;
fade_out = false;

// Set volume:
sound_kind_volume(0, global.audio_sfx / 100);
sound_kind_volume(3, global.audio_bgm / 100);

// Set loop points:
sound_set_loop("bgm_dev_title", 2304672, 9984665, unit_samples);
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
/*
// Sound list:
sound_list = sound_kind_list(0);

for (i = 0; i < ds_list_size(sound_list); i += 1)
{
    ds_list_find_value(sound_list, i);
    ds_list_delete(sound_list, i);
}

ds_list_destroy(sound_list);

// Music list:
music_list = sound_kind_list(3);

for (i = 0; i < ds_list_size(music_list); i += 1)
{
    ds_list_find_value(music_list, i);
    ds_list_delete(music_list, i);
}

ds_list_destroy(music_list);
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
