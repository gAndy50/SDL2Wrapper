include std/ffi.e

include sdl.e

public enum type SDL_HintPriority
	SDL_HINT_DEFAULT = 0,
	SDL_HINT_NORMAL,
	SDL_HINT_OVERRIDE
end type

export constant xSDL_SetHintWithPriority = define_c_func(sdl,"+SDL_SetHintWithPriority",{C_STRING,C_STRING,C_INT},C_BOOL)

public function SDL_SetHintWithPriority(sequence name,sequence val,atom priority)
	return c_func(xSDL_SetHintWithPriority,{name,val,priority})
end function

export constant xSDL_SetHint = define_c_func(sdl,"+SDL_SetHint",{C_STRING,C_STRING},C_BOOL)

public function SDL_SetHint(sequence name,sequence val)
	return c_func(xSDL_SetHint,{name,val})
end function

export constant xSDL_ResetHint = define_c_func(sdl,"+SDL_ResetHint",{C_STRING},C_BOOL)

public function SDL_ResetHint(sequence name)
	return c_func(xSDL_ResetHint,{name})
end function

export constant xSDL_ResetHints = define_c_proc(sdl,"+SDL_ResetHints",{})

public procedure SDL_ResetHints()
	c_proc(xSDL_ResetHints,{})
end procedure

export constant xSDL_GetHint = define_c_func(sdl,"+SDL_GetHint",{C_STRING},C_STRING)

public function SDL_GetHint(sequence name)
	return c_func(xSDL_GetHint,{name})
end function

export constant xSDL_GetHintBoolean = define_c_func(sdl,"+SDL_GetHintBoolean",{C_STRING,C_BOOL},C_BOOL)

public function SDL_GetHintBoolean(sequence name,atom def_val)
	return c_func(xSDL_GetHintBoolean,{name,def_val})
end function

--TODO: Callback Functions

export constant xSDL_ClearHints = define_c_proc(sdl,"+SDL_ClearHints",{})

public procedure SDL_ClearHints()
	c_proc(xSDL_ClearHints,{})
end procedure
­52.27