/// instance_create_single(x, y, obj)
// Creates an instance of obj at position (x,y). The function returns the id of the new instance.

if (!instance_exists(argument2))
{
    return instance_create(argument0, argument1, argument2);
}
