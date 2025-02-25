/// input_queue_dequeue(queue)
/// @desc Returns a value from the head of the input queue.
/// @param {int} queue
/// @returns {any}

var _queue; _queue = argument0;

with (ctrl_input)
{
    if (queue_list == -1) return false;
    else return ds_queue_dequeue(ds_list_find_value(queue_list, _queue));
}
