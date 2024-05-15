#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Omochao Initialization

event_inherited();

// Image speed:
image_speed = 0;

// Size:
main_left     = 11;
main_right    = 10;
main_top      = 11;
main_bottom   = 10;
main_offset_x = 2;
main_offset_y = 5;

// Player handle:
player_handle = noone;

// Omochao variables:
omochao_current = -1;
omochao_target  =  0;

// Draw variables:
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
    // Check current:
    if (omochao_current != omochao_target) {
        // Update text controller:
        switch (omochao_target) {
            case 1:
                text_message_set("Kuuga, Agito, Ryuki, Faiz, Blade~");
                break;

            default:
                text_message_set("OMOCHAO#Bro visited his friend.");
        }

        // Set current:
        omochao_current = omochao_target;
    }
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
    // Reset current:
    omochao_current = -1;
    
    // Reset draw:
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
