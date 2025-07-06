/// classic_get_sequence(animation)
/// @desc Returns a sequence.
/// @param {string} animation
/// @returns {script}

var _animation; _animation = argument0;

switch (_animation)
{
    case "cliff_front":
        return seq_classic_cliff_front;
    
    case "cliff_back":
        return seq_classic_cliff_back;
    
    case "wait_leader":
        return seq_classic_wait_leader;
    
    case "wait_partner":
        return seq_classic_wait_partner;
    
    case "standby":
        return seq_classic_standby;
    
    case "run_0":
        return seq_classic_run_0;
    
    case "run_1":
        return seq_classic_run_1;
    
    case "look":
        return seq_classic_look;
    
    case "crouch":
        return seq_classic_crouch;
    
    case "spin_dash":
        return seq_classic_spin_dash;
    
    case "roll":
        return seq_classic_roll;
    
    case "brake":
        return seq_classic_brake;
    
    case "hurt":
        return seq_classic_hurt;
    
    case "death":
        if (drown) return seq_classic_drown;
        return seq_classic_death;
    
    case "push":
        return seq_classic_push;
    
    case "spring":
        return seq_classic_spring;
    
    case "breathe":
        return seq_classic_breathe;
    
    case "insta":
        return seq_classic_insta;
    
    default:
        return seq_classic_stand;
}