/// instance_exists_ext(obj)
/// @desc Returns whether an instance of type obj exists. On first failure, activates obj to check again.
/// @param {object} obj
/// @returns {bool}

var _obj; _obj = argument0;

var exists; exists = instance_exists(_obj);

if (!exists)
{
    instance_activate_object(_obj);
    exists = instance_exists(_obj);
    instance_deactivate_object(_obj);
}

return exists;
