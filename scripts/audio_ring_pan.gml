/// audio_ring_pan()
/// @desc Returns the ring pan after inverting it.
/// @returns {int}

with (ctrl_audio)
{
    ring_pan = !ring_pan;
    return ring_pan;
}
