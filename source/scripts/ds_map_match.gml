/// ds_map_match(id, source)
/// @desc Copies values of shared keys from the map source into the map with the given id.
/// @param id
/// @param source
/// @returns {void}

var _id; _id = argument0;
var _source; _source = argument1;

var key; key = ds_map_find_first(_id);

for ({var i; i = 0}; i < ds_map_size(_id); i += 1)
{
    if (ds_map_exists(_source, key)) ds_map_replace(_id, key, ds_map_find_value(_source, key));
    key = ds_map_find_next(_id, key);
}