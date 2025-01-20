/// string_bool(val, [toggle])
/* Returns a string depending on the value. */

if (argument_count > 1)
{
    if (argument[1]) return pick(argument0, "Off", "On");
}

return pick(argument0, "False", "True");
