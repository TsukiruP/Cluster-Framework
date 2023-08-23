/// angle_wrap(angle)
// Returns an equivalent angle between 0-360.

while(argument0 < 0) argument0 += 360;
while(argument0 >= 360) argument0 -= 360;

return argument0;
