include std/ffi.e

include SDL_error.e
include SDL_video.e

include sdl.e

public enum type SDL_TouchDeviceType
	SDL_TOUCH_DEVICE_INVALID = -1,
	SDL_TOUCH_DEVICE_DIRECT = 0,
	SDL_TOUCH_DEVICE_INDIRECT_ABSOLUTE,
	SDL_TOUCH_DEVICE_INDIRECT_RELATIVE
end type

public constant SDL_Finger = define_c_struct({
	C_LONG, --id
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT --pressure
})

public constant SDL_TOUCH_MOUSEID = -1
public constant SDL_MOUSE_TOUCHID = -1

export constant xSDL_GetNumTouchDevices = define_c_func(sdl,"+SDL_GetNumTouchDevices",{},C_INT)

public function SDL_GetNumTouchDevices()
	return c_func(xSDL_GetNumTouchDevices,{})
end function

export constant xSDL_GetTouchDevice = define_c_func(sdl,"+SDL_GetTouchDevice",{C_INT},C_LONG)

public function SDL_GetTouchDevice(atom idx)
	return c_func(xSDL_GetTouchDevice,{idx})
end function

export constant xSDL_GetTouchName = define_c_func(sdl,"+SDL_GetTouchName",{C_INT},C_STRING)

public function SDL_GetTouchName(atom idx)
	return c_func(xSDL_GetTouchName,{idx})
end function

export constant xSDL_GetTouchDeviceType = define_c_func(sdl,"+SDL_GetTouchDeviceType",{C_LONG},C_INT)

public function SDL_GetTouchDeviceType(atom id)
	return c_func(xSDL_GetTouchDeviceType,{id})
end function

export constant xSDL_GetNumTouchFingers = define_c_func(sdl,"+SDL_GetNumTouchFingers",{C_LONG},C_INT)

public function SDL_GetNumTouchFingers(atom id)
	return c_func(xSDL_GetNumTouchFingers,{id})
end function

export constant xSDL_GetTouchFinger = define_c_func(sdl,"+SDL_GetTouchFinger",{C_LONG,C_INT},SDL_Finger)

public function SDL_GetTouchFinger(atom id,atom idx)
	return c_func(xSDL_GetTouchFinger,{id,idx})
end function
­15.44