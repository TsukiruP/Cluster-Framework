#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Initialization

animation_list = ds_list_create();
repeat (CHAR_CLASSIC + 1) ds_list_add(animation_list, 0);
animation_init_sonic();
animation_init_miles();
animation_init_classic();
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

for ({var i; i = 0}; i < ds_list_size(animation_list); i += 1)
{
    var form_list; form_list = ds_list_find_value(animation_list, i);

    if (form_list == 0) continue;
    else
    {
        for ({var j; j = 0}; j < ds_list_size(form_list); j += 1)
        {
            var variant_list; variant_list = ds_list_find_value(form_list, j);

            for ({var k; k = 0}; k < ds_list_size(variant_list); k += 1)
            {
                var animation_map; animation_map = ds_list_find_value(variant_list, k);

                ds_map_destroy(animation_map);
            }

            ds_list_destroy(variant_list);
        }

        ds_list_destroy(form_list);
    }
}

ds_list_destroy(animation_list);
