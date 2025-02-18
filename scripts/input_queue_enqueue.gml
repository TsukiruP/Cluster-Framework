/// input_queue_enqueue(queue, value)
/// @desc Queues a value into the input queue.
/// @param {queue} queue
/// @param {any} value
/// @returns {void}

var _queue; _queue = argument0;
var _value; _value = argument1;

with (ctrl_input)
{
    if (queue_list == -1) exit;
    else ds_queue_enqueue(ds_list_find_value(queue_list, _queue), _value);
}
