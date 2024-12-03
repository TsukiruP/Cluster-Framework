/// audio_ring_pan()
// Inverses and returns the ring pan.

with (mgr_audio)
{
    ring_pan = !ring_pan;

    // Return:
    return ring_pan;
}
