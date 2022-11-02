include std/ffi.e

include SDL_error.e

include sdl.e

export constant xSDL_GetTicks = define_c_func(sdl,"+SDL_GetTicks",{},C_UINT)

public function SDL_GetTicks()
	return c_func(xSDL_GetTicks,{})
end function

export constant xSDL_GetTicks64 = define_c_func(sdl,"+SDL_GetTicks64",{},C_LONG)

public function SDL_GetTicks64()
	return c_func(xSDL_GetTicks64,{})
end function

export constant xSDL_GetPerformanceCounter = define_c_func(sdl,"+SDL_GetPerformanceCounter",{},C_LONG)

public function SDL_GetPerformanceCounter()
	return c_func(xSDL_GetPerformanceCounter,{})
end function

export constant xSDL_GetPerformanceFrequency = define_c_func(sdl,"+SDL_GetPerformanceFrequency",{},C_LONG)

public function SDL_GetPerformanceFrequency()
	return c_func(xSDL_GetPerformanceFrequency,{})
end function

export constant xSDL_Delay = define_c_proc(sdl,"+SDL_Delay",{C_UINT})

public procedure SDL_Delay(atom ms)
	c_proc(xSDL_Delay,{ms})
end procedure

export constant xSDL_AddTimer = define_c_func(sdl,"+SDL_AddTimer",{C_UINT,C_POINTER,C_POINTER},C_INT)

public function SDL_AddTimer(atom iv,atom cb,atom parm)
	return c_func(xSDL_AddTimer,{iv,cb,parm})
end function

export constant xSDL_RemoveTimer = define_c_func(sdl,"+SDL_RemoveTimer",{C_INT},C_BOOL)

public function SDL_RemoveTimer(atom id)
	return c_func(xSDL_RemoveTimer,{id})
end function
­28.43