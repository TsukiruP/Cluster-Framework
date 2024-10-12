/// player_collision_object()
// IDK yet.

var player, collision_list, result, total_objects, inst, n;

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
        result = player_get_collision(other);
    }
    
    // Continue if not colliding:
    if (result == 0)
    {
        continue;
    }
    
    // Add to collision list:
    ds_list_add(collision_list, id);
}

// React:
total_objects = ds_list_size(collision_list);
for (n = 0; n < total_objects; n += 1)
{
    inst = ds_list_find_value(collision_list, n);
    
    player_react(inst);
    
    if (state_changed == true)
    {
        return true;
    }
}

return false;
