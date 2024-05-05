#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Omochao Initialization

// Image speed:
image_speed = 0;

// Size:
prop_width    = 10.5;
prop_height   = 10.5;
prop_offset_x = 1;
prop_offset_y = 5;

// Player handle:
player_handle = noone;

// Omochao variables:
omochao_message = "";
omochao_topic   = "";

draw_x = x;
draw_y = y;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Activate

if (player_handle != noone) {
    if (ctrl_text.text_clear == false && player_handle.animation_reverse != true) text_message_set("OMOCHAO#Bro visited his friend.");
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

// Don't bother if the game is paused:
if (game_paused(ctrl_pause)) exit;

// Match player:
if (player_handle != noone) {
    // Put down Omochao:
    if (ctrl_text.text_clear && player_handle.animation_current == "omochao" && player_handle.animation_reverse == false) {
        player_handle.animation_trigger = true;
        player_handle.animation_reverse = true;
    }

    // Change sprite index:
    switch (player_handle.character_data) {
        default:
            sprite_index = spr_omochao_sonic;
    }

    // Match image index:
    image_index = player_handle.image_index;
    
    // Attach to player:
    draw_x = floor(player_handle.x);
    draw_y = floor(player_handle.y);
    
    // Update direction:
    image_xscale = player_handle.animation_direction;
    
    // Reset Omochao:
    if (player_handle.animation_current != "omochao") player_handle = noone;
}

// Execute timeline:
if (player_handle == noone) {
    draw_x = x;
    draw_y = y;
    
    sprite_index = spr_omochao_idle;
    image_index  = floor(global.object_time) div 3;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Omochao

// Omochao:
draw_sprite_ext(sprite_index, image_index, draw_x + (image_xscale < 0), draw_y, image_xscale, 1, 0, c_white, 1);

// Size:
event_inherited();
