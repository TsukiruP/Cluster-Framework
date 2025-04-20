/// animation_add(character, form, variant, animation, sequence)
/// @desc Adds an animation to the animation controller.
/// @param {int} character
/// @param {int} form
/// @param {int} variant
/// @param {string} animation
/// @param {script} sequence
/// @returns {void}

var _character; _character = argument0;
var _form; _form = argument1;
var _variant; _variant = argument2;
var _animation; _animation = argument3;
var _sequence; _sequence = argument4;

// Form list:
if (ds_list_find_value(animation_list, _character) == 0) ds_list_replace(animation_list, _character, ds_list_create());
var form_list; form_list = ds_list_find_value(animation_list, _character);

// Variant list:
if (ds_list_size(form_list) < _form + 1) ds_list_add(form_list, ds_list_create());
var variant_list; variant_list = ds_list_find_value(form_list, _form);

// Animation maps:
if (ds_list_size(variant_list) < _variant + 1) ds_list_add(variant_list, ds_map_create());
var animation_map; animation_map  = ds_list_find_value(variant_list, _variant);
ds_map_set(animation_map, _animation, _sequence);
