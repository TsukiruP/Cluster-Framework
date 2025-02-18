/// input_queue_dequeue(queue)
/// @desc Returns a value from the head of the input queue.
/// @param {ds_queue} queue
/// @returns {void}

var _queue; _queue = argument0;

with (ctrl_input)
{
    if (queue_list == -1) return false;
    else return ds_queue_dequeue(ds_list_find_value(queue_list, _queue));
}
