/// approach_roundto(val, go, step, round)
/// @desc A merge of approach and roundto.
/// @param {number} val
/// @param {number} go
/// @param {number} step
/// @param {number} round
/// @returns {number}

var _val; _val = argument0;
var _go; _go = argument1;
var _step; _step = argument2;
var _round; _round = argument3;

if (_round == 0) _round = 1;

if (_val < _go) return roundto(min(_go, _val + _step), _round);
return roundto(max(_go, _val - _step), _round);