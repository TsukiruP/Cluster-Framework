#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Font Initialization

global.font_system     = font_add_sprite(fnt_system, ord(" "), true, 0);
global.font_title_card = font_add_sprite(fnt_title_card_zone, ord(" "), true, -4);
global.font_hud        = font_add_sprite(fnt_hud, ord("0"), false, 1);
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Release fonts

font_delete(global.font_system);
font_delete(global.font_title_card);
font_delete(global.font_hud);
