// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function approach(start, target, shift) {
    if (start < target) {
        return min(start+shift, target);
    } else {
        return max(start-shift, target);
    }
}

