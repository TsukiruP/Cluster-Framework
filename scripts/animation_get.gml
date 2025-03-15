/// animation_get(character, form, variant, animation)
/// @desc Returns a sequence from the animation controller.
/// @param {int} character
/// @param {int} form
/// @param {int} variant
/// @param {string} animation
/// @returns {script}

var _character; _character = argument0;
var _form; _form = argument1;
var _variant; _variant = argument2;
var _animation; _animation = argument3;

with (ctrl_animation)
{
    // Evaluate all characters:
    for ({var i; i = min(_character, ds_list_size(animation_list) - 1)}; i > -1;  i -= 1)
    {
        var form_list; form_list = ds_list_find_value(animation_list, i);

        // Abort if the character has no forms:
        if (form_list == 0) continue;
        else
        {
            // Evaluate all forms:
            for ({var j; j = min(_form, ds_list_size(form_list) - 1)}; j > -1; j -= 1)
            {
                var variant_list; variant_list = ds_list_find_value(form_list, j);
                var animation_map; animation_map = ds_list_find_value(variant_list, min(_variant, ds_list_size(variant_list) - 1));
                var animation_sequence; animation_sequence = ds_map_get(animation_map, _animation);

                if (!is_undefined(animation_sequence)) return animation_sequence;
            }
        }
    }
}

return seq_sonic_stand;
