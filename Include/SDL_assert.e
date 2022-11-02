include std/ffi.e

include sdl.e

public enum type SDL_AssertState
	SDL_ASSERTION_RETRY = 0,
	SDL_ASSERTION_BREAK,
	SDL_ASSERTION_ABORT,
	SDL_ASSERTION_IGNORE,
	SDL_ASSERTION_ALWAYS_IGNORE
end type

public constant SDL_AssertData = define_c_type({
	C_INT, --always_ignore
	C_UINT, --trigger_count
	C_STRING, --condition
	C_STRING, --filename
	C_INT, --linenum
	C_STRING, --function
	C_POINTER --next
})


public constant SDL_AssertionHandler = define_c_type({
	C_POINTER, --data
	C_POINTER --userdata
})


export constant xSDL_SetAssertionHandler = define_c_proc(sdl,"+SDL_SetAssertionHandler",{SDL_AssertionHandler,C_POINTER})

public procedure SDL_SetAssertionHandler(sequence handler,atom data)
	c_proc(xSDL_SetAssertionHandler,{handler,data})
end procedure

export constant xSDL_GetDefaultAssertionHandler = define_c_func(sdl,"+SDL_GetDefaultAssertionHandler",{},SDL_AssertionHandler)

public function SDL_GetDefaultAssertionHandler()
	return c_func(xSDL_GetDefaultAssertionHandler,{})
end function

export constant xSDL_GetAssertionHandler = define_c_func(sdl,"+SDL_GetAssertionHandler",{C_POINTER},SDL_AssertionHandler)

public function SDL_GetAssertionHandler(atom data)
	return c_func(xSDL_GetAssertionHandler,{data})
end function

export constant xSDL_GetAssertionReport = define_c_func(sdl,"+SDL_GetAssertionReport",{},SDL_AssertData)

public function SDL_GetAssertionReport()
	return c_func(xSDL_GetAssertionReport,{})
end function

export constant xSDL_ResetAssertionReport = define_c_proc(sdl,"+SDL_ResetAssertionReport",{})

public procedure SDL_ResetAssertionReport()
	c_proc(xSDL_ResetAssertionReport,{})
end procedure
­57.37