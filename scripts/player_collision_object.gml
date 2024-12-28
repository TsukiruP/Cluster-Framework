/// player_collision_object()
/* Checks if any interactable objects are colliding with the player's bounding box, triggering their reactions if so.
Returns whether the player's current state should be aborted or not. */

var player, collision_list, kind, result, total_objects;

// Initialize:
player = id;
collision_list = ds_list_create();

// Evaluate culled objects:
with (par_culled)
{
    // Continue if it's not interactable:
    if (!object_is_child_of(par_prop) && !object_is_child_of(par_obstacle))
    {
        continue;
    }
    
    // Evaluate collision:
    with (player)
    {
        kind = player_get_collision(other);
    }
    
    // Continue if not colliding:
    if (kind == 0)
    {
        continue;
    }
    
    // Add to collision list:
    ds_list_add(collision_list, id);
}

// Trigger reactions:
result = false;
total_objects = ds_list_size(collision_list);

if (total_objects > 0)
{
    var inst, n;
    for (n = 0; n < total_objects; n += 1)
    {
        inst = ds_list_find_value(collision_list, n);
        
        player_react(inst);
        
        if (state_changed == true)
        {
            result = true;
            break;
        }
    }
}

ds_list_destroy(collision_list);
return result;
