/// input_queue_enqueue(queue, val)
/// @desc Queues a value into the input queue.
/// @param {int} queue
/// @param {any} val
/// @returns {void}

var _queue; _queue = argument0;
var _val; _val = argument1;

with (ctrl_input)
{
    if (queue_list == -1) exit;
    else ds_queue_enqueue(ds_list_find_value(queue_list, _queue), _val);
}