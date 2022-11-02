include std/ffi.e

include sdl.e

public enum type SDL_SensorType
	SDL_SENSOR_INVALID = -1,
	SDL_SENSOR_UNKNOWN = 0,
	SDL_SENSOR_ACCEL,
	SDL_SENSOR_GYRO
end type

public constant SDL_STANDARD_GRAVITY = 9.80665

export constant xSDL_LockSensors = define_c_proc(sdl,"+SDL_LockSensors",{}),
				xSDL_UnlockSensors = define_c_proc(sdl,"+SDL_UnlockSensors",{})
				
public procedure SDL_LockSensors()
	c_proc(xSDL_LockSensors,{})
end procedure

public procedure SDL_UnlockSensors()
	c_proc(xSDL_UnlockSensors,{})
end procedure

export constant xSDL_NumSensors = define_c_func(sdl,"+SDL_NumSensors",{},C_INT)

public function SDL_NumSensors()
	return c_func(xSDL_NumSensors,{})
end function

export constant xSDL_SensorGetDeviceName = define_c_func(sdl,"+SDL_SensorGetDeviceName",{C_INT},C_STRING)

public function SDL_SensorGetDeviceName(atom di)
	return c_func(xSDL_SensorGetDeviceName,{di})
end function

export constant xSDL_SensorGetDeviceType = define_c_func(sdl,"+SDL_SensorGetDeviceType",{C_INT},C_INT)

public function SDL_SensorGetDeviceType(atom di)
	return c_func(xSDL_SensorGetDeviceType,{di})
end function

export constant xSDL_SensorGetDeviceNonPortableType = define_c_func(sdl,"+SDL_SensorGetDeviceNonPortableType",{C_INT},C_INT)

public function SDL_SensorGetDeviceNonPortableType(atom di)
	return c_func(xSDL_SensorGetDeviceNonPortableType,{di})
end function

export constant xSDL_SensorGetDeviceInstanceID = define_c_func(sdl,"+SDL_SensorGetDeviceInstanceID",{C_INT},C_INT)

public function SDL_SensorGetDeviceInstanceID(atom di)
	return c_func(xSDL_SensorGetDeviceInstanceID,{di})
end function

export constant xSDL_SensorOpen = define_c_func(sdl,"+SDL_SensorOpen",{C_INT},C_POINTER)

public function SDL_SensorOpen(atom di)
	return c_func(xSDL_SensorOpen,{di})
end function

export constant xSDL_SensorFromInstanceID = define_c_func(sdl,"+SDL_SensorFromInstanceID",{C_INT},C_POINTER)

public function SDL_SensorFromInstanceID(atom id)
	return c_func(xSDL_SensorFromInstanceID,{id})
end function

export constant xSDL_SensorGetName = define_c_func(sdl,"+SDL_SensorGetName",{C_POINTER},C_STRING)

public function SDL_SensorGetName(atom sen)
	return c_func(xSDL_SensorGetName,{sen})
end function

export constant xSDL_SensorGetType = define_c_func(sdl,"+SDL_SensorGetType",{C_POINTER},C_INT)

public function SDL_SensorGetType(atom sen)
	return c_func(xSDL_SensorGetType,{sen})
end function

export constant xSDL_SensorGetNonPortableType = define_c_func(sdl,"+SDL_SensorGetNonPortableType",{C_POINTER},C_INT)

public function SDL_SensorGetNonPortableType(atom sen)
	return c_func(xSDL_SensorGetNonPortableType,{sen})
end function

export constant xSDL_SensorGetInstanceID = define_c_func(sdl,"+SDL_SensorGetInstanceID",{C_POINTER},C_INT)

public function SDL_SensorGetInstanceID(atom sen)
	return c_func(xSDL_SensorGetInstanceID,{sen})
end function

export constant xSDL_SensorGetData = define_c_func(sdl,"+SDL_SensorGetData",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_SensorGetData(atom sen,atom data,atom num)
	return c_func(xSDL_SensorGetData,{sen,data,num})
end function

export constant xSDL_SensorClose = define_c_proc(sdl,"+SDL_SensorClose",{C_POINTER})

public procedure SDL_SensorClose(atom sen)
	c_proc(xSDL_SensorClose,{sen})
end procedure

export constant xSDL_SensorUpdate = define_c_proc(sdl,"+SDL_SensorUpdate",{})

public procedure SDL_SensorUpdate()
	c_proc(xSDL_SensorUpdate,{})
end procedure
­106.29