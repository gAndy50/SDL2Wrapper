include std/ffi.e
include std/math.e

include SDL_error.e
include SDL_joystick.e

include sdl.e

public constant SDL_HAPTIC_CONSTANT = shift_bits(1,0)

public constant SDL_HAPTIC_SINE = shift_bits(1,-1)

public constant SDL_HAPTIC_LEFTRIGHT = shift_bits(1,-2)

public constant SDL_HAPTIC_TRIANGLE = shift_bits(1,-3)

public constant SDL_HAPTIC_SAWTOOTHUP = shift_bits(1,-4)

public constant SDL_HAPTIC_SAWTOOTHDOWN = shift_bits(1,-5)

public constant SDL_HAPTIC_RAMP = shift_bits(1,-6)

public constant SDL_HAPTIC_SPRING = shift_bits(1,-7)

public constant SDL_HAPTIC_DAMPER = shift_bits(1,-8)

public constant SDL_HAPTIC_INERTIA = shift_bits(1,-9)

public constant SDL_HAPTIC_FRICTION = shift_bits(1,-10)

public constant SDL_HAPTIC_CUSTOM = shift_bits(1,-11)

public constant SDL_HAPTIC_GAIN = shift_bits(1,-12)

public constant SDL_HAPTIC_AUTOCENTER = shift_bits(1,-13)

public constant SDL_HAPTIC_STATUS = shift_bits(1,-14)

public constant SDL_HAPTIC_PAUSE = shift_bits(1,-15)

public constant SDL_HAPTIC_POLAR = 0,
				SDL_HAPTIC_CARTESIAN = 1,
				SDL_HAPTIC_SPHERICAL = 2,
				SDL_HAPTIC_STEERING_AXIS = 3,
				SDL_HAPTIC_INFINITY = 4294967295
				
public constant SDL_HapticDirection = define_c_type({
	C_UINT, --type
	{C_INT,3} --dir[3]
})

public constant SDL_HapticConstant = define_c_type({
	C_UINT, --type
	SDL_HapticDirection, --direction
	C_UINT, --length
	C_UINT, --delay
	C_UINT, --button
	C_UINT, --interval
	C_INT, --level
	C_UINT, --attack_length
	C_UINT, --attack_level
	C_UINT, --fade_length
	C_UINT --fade_level
})

public constant SDL_HapticPeriodic = define_c_type({
	C_UINT, --type
	SDL_HapticDirection, --direction
	C_UINT, --length
	C_UINT, --delay
	C_UINT, --button
	C_UINT, --interval
	C_UINT, --period
	C_INT, --magnitude
	C_INT, --offset
	C_UINT, --phase
	C_UINT, --attack_length
	C_UINT, --attack_level
	C_UINT, --fade_length
	C_UINT --fade_level
})

public constant SDL_HapticCondition = define_c_type({
	C_UINT, --type
	SDL_HapticDirection, --direction
	C_UINT, --length
	C_UINT, --delay
	C_UINT, --button
	C_UINT, --interval
	{C_UINT,3}, --right_sat[3]
	{C_UINT,3}, --left_sat[3]
	{C_INT,3}, --right_coeff[3]
	{C_INT,3}, --left_coeff[3]
	{C_UINT,3}, --deadband[3]
	{C_INT,3} --center[3]
})

public constant SDL_HapticRamp = define_c_type({
	C_UINT, --type
	SDL_HapticDirection, --direction
	C_UINT, --length
	C_UINT, --delay
	C_UINT, --button
	C_UINT, --interval,
	C_INT, --start
	C_INT, --end
	C_UINT, --attack_length
	C_UINT, --attack_level
	C_UINT, --fade_length
	C_UINT --fade_level
})

public constant SDL_HapticLeftRight = define_c_type({
	C_UINT, --type
	C_UINT, --length
	C_UINT, --large_mag
	C_UINT --small_mag
})

public constant SDL_HapticCustom = define_c_type({
	C_UINT, --type
	SDL_HapticDirection, --direction
	C_UINT, --length
	C_UINT, --delay
	C_UINT, --button
	C_UINT, --interval
	C_UINT, --channels
	C_UINT, --period
	C_UINT, --samples
	C_POINTER, --data
	C_UINT, --attack_length
	C_UINT, --attack_level
	C_UINT, --fade_length
	C_UINT --fade_level
})

public constant SDL_HapticEffect = define_c_type({
	C_UINT, --type
	SDL_HapticConstant, --constant
	SDL_HapticPeriodic, --periodic
	SDL_HapticCondition, --condition
	SDL_HapticRamp, --ramp
	SDL_HapticLeftRight, --leftright
	SDL_HapticCustom --custom
})

export constant xSDL_NumHaptics = define_c_func(sdl,"+SDL_NumHaptics",{},C_INT)

public function SDL_NumHaptics()
	return c_func(xSDL_NumHaptics,{})
end function 

export constant xSDL_HapticName = define_c_func(sdl,"+SDL_HapticName",{C_INT},C_STRING)

public function SDL_HapticName(atom idx)
	return c_func(xSDL_HapticName,{idx})
end function

export constant xSDL_HapticOpen = define_c_func(sdl,"+SDL_HapticOpen",{C_INT},C_POINTER)

public function SDL_HapticOpen(atom idx)
	return c_func(xSDL_HapticOpen,{idx})
end function

export constant xSDL_HapticOpened = define_c_func(sdl,"+SDL_HapticOpened",{C_INT},C_INT)

public function SDL_HapticOpened(atom idx)
	return c_func(xSDL_HapticOpened,{idx})
end function

export constant xSDL_HapticIndex = define_c_func(sdl,"+SDL_HapticIndex",{C_POINTER},C_INT)

public function SDL_HapticIndex(atom hap)
	return c_func(xSDL_HapticIndex,{hap})
end function

export constant xSDL_MouseIsHaptic = define_c_func(sdl,"+SDL_MouseIsHaptic",{},C_INT)

public function SDL_MouseIsHaptic()
	return c_func(xSDL_MouseIsHaptic,{})
end function

export constant xSDL_HapticOpenFromMouse = define_c_func(sdl,"+SDL_HapticOpenFromMouse",{},C_POINTER)

public function SDL_HapticOpenFromMouse()
	return c_func(xSDL_HapticOpenFromMouse,{})
end function

export constant xSDL_JoystickIsHaptic = define_c_func(sdl,"+SDL_JoystickIsHaptic",{C_POINTER},C_INT)

public function SDL_JoystickIsHaptic(atom joy)
	return c_func(xSDL_JoystickIsHaptic,{joy})
end function

export constant xSDL_HapticOpenFromJoystick = define_c_func(sdl,"+SDL_HapticOpenFromJoystick",{C_POINTER},C_POINTER)

public function SDL_HapticOpenFromJoystick(atom joy)
	return c_func(xSDL_HapticOpenFromJoystick,{joy})
end function

export constant xSDL_HapticClose = define_c_proc(sdl,"+SDL_HapticClose",{C_POINTER})

public procedure SDL_HapticClose(atom hap)
	c_proc(xSDL_HapticClose,{hap})
end procedure

export constant xSDL_HapticNumEffects = define_c_func(sdl,"+SDL_HapticNumEffects",{C_POINTER},C_INT)

public function SDL_HapticNumEffects(atom hap)
	return c_func(xSDL_HapticNumEffects,{hap})
end function

export constant xSDL_HapticNumEffectsPlaying = define_c_func(sdl,"+SDL_HapticNumEffectsPlaying",{C_POINTER},C_INT)

public function SDL_HapticNumEffectsPlaying(atom hap)
	return c_func(xSDL_HapticNumEffectsPlaying,{hap})
end function

export constant xSDL_HapticQuery = define_c_func(sdl,"+SDL_HapticQuery",{C_POINTER},C_UINT)

public function SDL_HapticQuery(atom hap)
	return c_func(xSDL_HapticQuery,{hap})
end function

export constant xSDL_HapticNumAxes = define_c_func(sdl,"+SDL_HapticNumAxes",{C_POINTER},C_INT)

public function SDL_HapticNumAxes(atom hap)
	return c_func(xSDL_HapticNumAxes,{hap})
end function

export constant xSDL_HapticEffectSupported = define_c_func(sdl,"+SDL_HapticEffectSupported",{C_POINTER,SDL_HapticEffect},C_INT)

public function SDL_HapticEffectSupported(atom hap,sequence effect)
	return c_func(xSDL_HapticEffectSupported,{hap,effect})
end function

export constant xSDL_HapticNewEffect = define_c_func(sdl,"+SDL_HapticNewEffect",{C_POINTER,SDL_HapticEffect},C_INT)

public function SDL_HapticNewEffect(atom hap,sequence effect)
	return c_func(xSDL_HapticNewEffect,{hap,effect})
end function

export constant xSDL_HapticUpdateEffect = define_c_func(sdl,"+SDL_HapticUpdateEffect",{C_POINTER,C_INT,SDL_HapticEffect},C_INT)

public function SDL_HapticUpdateEffect(atom hap,atom eft,sequence data)
	return c_func(xSDL_HapticUpdateEffect,{hap,eft,data})
end function

export constant xSDL_HapticRunEffect = define_c_func(sdl,"+SDL_HapticRunEffect",{C_POINTER,C_INT,C_UINT},C_INT)

public function SDL_HapticRunEffect(atom hap,atom eft,atom its)
	return c_func(xSDL_HapticRunEffect,{hap,eft,its})
end function

export constant xSDL_HapticStopEffect = define_c_func(sdl,"+SDL_HapticStopEffect",{C_POINTER,C_INT},C_INT)

public function SDL_HapticStopEffect(atom hap,atom eft)
	return c_func(xSDL_HapticStopEffect,{hap,eft})
end function

export constant xSDL_HapticDestroyEffect = define_c_proc(sdl,"+SDL_HapticDestroyEffect",{C_POINTER,C_INT})

public procedure SDL_HapticDestroyEffect(atom hap,atom eft)
	c_proc(xSDL_HapticDestroyEffect,{hap,eft})
end procedure

export constant xSDL_HapticGetEffectStatus = define_c_func(sdl,"+SDL_HapticGetEffectStatus",{C_POINTER,C_INT},C_INT)

public function SDL_HapticGetEffectStatus(atom hap,atom eft)
	return c_func(xSDL_HapticGetEffectStatus,{hap,eft})
end function

export constant xSDL_HapticSetGain = define_c_func(sdl,"+SDL_HapticSetGain",{C_POINTER,C_INT},C_INT)

public function SDL_HapticSetGain(atom hap,atom g)
	return c_func(xSDL_HapticSetGain,{hap,g})
end function

export constant xSDL_HapticSetAutocenter = define_c_func(sdl,"+SDL_HapticSetAutocenter",{C_POINTER,C_INT},C_INT)

public function SDL_HapticSetAutocenter(atom hap,atom auto)
	return c_func(xSDL_HapticSetAutocenter,{hap,auto})
end function

export constant xSDL_HapticPause = define_c_func(sdl,"+SDL_HapticPause",{C_POINTER},C_INT)

public function SDL_HapticPause(atom hap)
	return c_func(xSDL_HapticPause,{hap})
end function

export constant xSDL_HapticUnpause = define_c_func(sdl,"+SDL_HapticUnpause",{C_POINTER},C_INT)

public function SDL_HapticUnpause(atom hap)
	return c_func(xSDL_HapticUnpause,{hap})
end function

export constant xSDL_HapticStopAll = define_c_func(sdl,"+SDL_HapticStopAll",{C_POINTER},C_INT)

public function SDL_HapticStopAll(atom hap)
	return c_func(xSDL_HapticStopAll,{hap})
end function

export constant xSDL_HapticRumbleSupported = define_c_func(sdl,"+SDL_HapticRumbleSupported",{C_POINTER},C_INT)

public function SDL_HapticRumbleSupported(atom hap)
	return c_func(xSDL_HapticRumbleSupported,{hap})
end function

export constant xSDL_HapticRumbleInit = define_c_func(sdl,"+SDL_HapticRumbleInit",{C_POINTER},C_INT)

public function SDL_HapticRumbleInit(atom hap)
	return c_func(xSDL_HapticRumbleInit,{hap})
end function

export constant xSDL_HapticRumblePlay = define_c_func(sdl,"+SDL_HapticRumblePlay",{C_POINTER,C_FLOAT,C_UINT},C_INT)

public function SDL_HapticRumblePlay(atom hap,atom str,atom len)
	return c_func(xSDL_HapticRumblePlay,{hap,str,len})
end function

export constant xSDL_HapticRumbleStop = define_c_func(sdl,"+SDL_HapticRumbleStop",{C_POINTER},C_INT)

public function SDL_HapticRumbleStop(atom hap)
	return c_func(xSDL_HapticRumbleStop,{hap})
end function
­324.43