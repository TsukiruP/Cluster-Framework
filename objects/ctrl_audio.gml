#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Audio Initialization

// Add character SFX:
sound_add_directory("data\audio\sfx\character\common", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\sonic", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\miles", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\knuckles", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\shield", ".wav", 0, true);
sound_add_directory("data\audio\sfx\character\tag action", ".wav", 0, true);

// Add prop SFX:
sound_add_directory("data\audio\sfx\prop", ".wav", 0, true);

// Add BGM:
sound_add_directory("data\audio\bgm", ".wav", 1, false);

// Ring pan:
ring_pan = 1;

// BGM variables:
bgm_instance = -1;
bgm_muteki   = -1
bgm_speed_up = -1;
bgm_current  =  "none";
bgm_fade     =  false;

// Set volume:
sound_kind_volume(0, global.audio_sfx_volume / 100);
sound_kind_volume(1, global.audio_bgm_volume / 100);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Panning

if(sound_get_pan("snd_ring") != ring_pan) sound_pan("snd_ring", ring_pan);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade BGM

// Fade Out:
if(bgm_fade == true) {
    // BGM:
    if(bgm_instance != -1) {
        if(sound_get_volume(bgm_instance) != 0) sound_volume(bgm_instance, max(0, sound_get_volume(bgm_instance) - 0.01));
        else {
            sound_discard(bgm_instance);
            bgm_instance = -1;
        }
    }

    // Fade Out Invincibility:
    if(bgm_muteki != -1) {
        if(sound_get_volume(bgm_muteki) != 0) sound_volume(bgm_muteki, max(0, sound_get_volume(bgm_muteki) - 0.01));
        else {
            sound_discard(bgm_muteki);
            bgm_muteki = -1;
        }
    }

    // Fade Out Speed Up:
    if(bgm_muteki != -1) {
        if(sound_get_volume(bgm_muteki) != 0) sound_volume(bgm_muteki, max(0, sound_get_volume(bgm_muteki) - 0.01));
        else {
            sound_discard(bgm_muteki);
            bgm_muteki = -1;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Quiet BGM

if(bgm_instance != -1) {
    if(sound_isplaying("bgm_muteki")) {
        sound_pause(bgm_instance);
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Room BGM

// Set BGM:
switch(room) {
    // Basic Test:
    case rm_basic_test_1:
        bgm_current = "bgm_dev_title";
        break;

    default:
        bgm_current = "none";
        break;
}

// Play BGM:
if(bgm_current != "none") bgm_instance = sound_play_ex(bgm_current);
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Play Invincibility Jingle

// Clear variable:
if(bgm_muteki != -1) {
    sound_discard(bgm_muteki);
    bgm_muteki = -1;
};

//if(bgm_muteki == -1) {
    //bgm_muteki =
    sound_play_single("bgm_muteki");

    //if(bgm_speed_up != -1) {
        //sound_volume(bgm_speed_up, 0);
    //}
//}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Play Speed Up Jingle

// Clear variable:
if(bgm_speed_up != -1) {
    sound_discard(bgm_speed_up);
    bgm_speed_up = -1;
};

if(bgm_speed_up == -1) {
    bgm_speed_up = sound_play_single("bgm_speed_up");

    if(bgm_muteki != -1) {
        sound_volume(bgm_muteki, 0);
    }
}
#define KeyPress_32
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
sound_kind_volume(1, 0);
