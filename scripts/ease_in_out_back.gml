/// ease_in_out_back(inputvalue, outputmin, outputmax, inputmax)
/// @desc http://www.davetech.co.uk/gamemakereasingandtweeningfunctions
/// @param inputvalue
/// @param outputmin
/// @param outputmax
/// @param inputmax
/// @returns {number}

var _inputvalue; _inputvalue = argument0;
var _outputmin; _outputmin = argument1;
var _outputmax; _outputmax = argument2;
var _inputmax; _inputmax = argument3;

var _s; _s = 1.70158;

_inputvalue = _inputvalue / _inputmax * 2

if (_inputvalue < 1)
{
    _s *= 1.525;
    return _outputmax * 0.5 * (_inputvalue * _inputvalue * ((_s + 1) * _inputvalue - _s)) + _outputmin;
}

_inputvalue -= 2;
_s *= 1.525

return _outputmax * 0.5 * (_inputvalue * _inputvalue * ((_s + 1) * _inputvalue + _s) + 2) + _outputmin;