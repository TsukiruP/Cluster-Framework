/// gravity_angle([obj])
// Returns the gravity direction of the calling instance rotated to standard unit circle projection.

var obj_handle;

// Object handle:
obj_handle = self;

// Assign object handle:
if (argument_count >= 1) {
    obj_handle = argument[0];
}

return wrap_angle(obj_handle.gravity_direction + 90);
