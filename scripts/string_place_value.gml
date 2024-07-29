/// string_place_value(val, places)
// Returns a string with the given value with additional place values.

var value, place;

value = string(argument0);
place = argument1 - string_length(value);

while (place) {
    value  = string(0) + value;
    place -= 1;
}

return value;
