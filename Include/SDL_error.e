include std/ffi.e

include sdl.e

export constant xSDL_SetError = define_c_func(sdl,"+SDL_SetError",{C_STRING,C_POINTER},C_INT)

public function SDL_SetError(sequence fmt,object func)
	return c_func(xSDL_SetError,{fmt,func})
end function

export constant xSDL_GetError = define_c_func(sdl,"+SDL_GetError",{},C_STRING)

public function SDL_GetError()
	return c_func(xSDL_GetError,{})
end function

export constant xSDL_GetErrorMsg = define_c_func(sdl,"+SDL_GetErrorMsg",{C_STRING,C_INT},C_STRING)

public function SDL_GetErrorMsg(sequence err,atom len)
	return c_func(xSDL_GetErrorMsg,{err,len})
end function

export constant xSDL_ClearError = define_c_proc(sdl,"+SDL_ClearError",{})

public procedure SDL_ClearError()
	c_proc(xSDL_ClearError,{})
end procedure

public enum type SDL_errorcode
	SDL_ENOMEM = 0,
	SDL_EFREAD,
	SDL_EFWRITE,
	SDL_EFSEEK,
	SDL_UNSUPPORTED,
	SDL_LASTERROR
end type

export constant xSDL_Error = define_c_func(sdl,"+SDL_Error",{C_INT},C_INT)

public function SDL_Error(atom code)
	return c_func(xSDL_Error,{code})
end function
­41.33