/// gravity_angle([obj])
// Returns the gravity direction of the calling instance rotated to standard unit circle projection.

var object_handle;

// Object handle:
object_handle = self;

// Assign object handle:
if (argument_count >= 1) {
    object_handle = argument[0];
}

return angle_wrap(object_handle.gravity_direction + 90);
