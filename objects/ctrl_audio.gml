#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sound Initialization

sound_add_directory("data\audio\sfx\character\common", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\sonic", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\classic", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\shield", ".wav", 0, true);
sound_add_directory("data\audio\sfx\prop", ".wav", 0, true);
sound_add_directory("data\audio\sfx\menu", ".wav", 0, true);

sound_kind_volume(0, game_get_config("audio_sfx") / 100);
sfx_list = ds_list_create();
ring_pan = 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Music Initialization

sound_add_directory("data\audio\bgm", ".ogg", 1, true);

sound_set_loop("bgm_debug", 2304672, 9984665, unit_samples);
sound_set_loop("bgm_basic_test_1", 1024258, 5121290, unit_samples);

sound_kind_volume(1, game_get_config("audio_bgm") / 100);
bgm_inst = -1;
fade_out = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Jingle Initialization

sound_add_directory("data\audio\jng", ".ogg", 3, true);

sound_kind_volume(3, game_get_config("audio_bgm") / 100);
jng_inst = -1;
drown_inst = -1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sound List

for ({var i; i = 0}; i < ds_list_size(sfx_list); i += 1)
{
    if (!sound_isplaying(ds_list_find_value(sfx_list, i))) ds_list_delete(sfx_list, i);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Music Priority

if (audio_drown_isplaying())
{
    audio_mute_bgm();
    audio_mute_jng();
}
else if (audio_jng_isplaying()) audio_mute_bgm();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Music Fade

// Fade out:
if (fade_out)
{
    audio_fade_bgm(true);
    audio_fade_jng(true);
    audio_drown_fade(true);
    if (bgm_inst == -1 && !audio_jng_isplaying()) fade_out = false;
}
else if (!audio_drown_isplaying())
{
    if (audio_jng_isplaying()) audio_fade_jng(false);
    else audio_fade_bgm(false);
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

audio_stop_all();
ds_list_destroy(sfx_list);
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Discard Audio

audio_stop_jng();
audio_stop_drown();
