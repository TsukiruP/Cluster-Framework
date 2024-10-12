/// gravity_angle([obj])
// Returns the gravity direction of the calling instance rotated to standard unit circle projection.

var inst;

// Object handle:
inst = self;

// Assign object handle:
if (argument_count >= 1)
{
    inst = argument[0];
}

return angle_wrap(inst.gravity_direction + 90);
