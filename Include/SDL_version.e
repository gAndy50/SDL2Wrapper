include std/ffi.e
include std/machine.e

include sdl.e

public constant SDL_VERSION = define_c_struct({
	C_UINT8, --major
	C_UINT8, --minor
	C_UINT8 --patch
})

public constant SDL_MAJOR_VERSION = 2,
				SDL_MINOR_VERSION = 28,
				SDL_PATCHLEVEL = 5
				
export constant xSDL_GetVersion = define_c_proc(sdl,"+SDL_GetVersion",{C_POINTER})

public function SDL_GetVersion()

	atom ver = allocate_struct(SDL_VERSION)
	
	c_proc(xSDL_GetVersion,{ver})
	
	sequence res = peek_struct(ver,SDL_VERSION)
	
	free(ver)
	
	return res
	
end function

export constant xSDL_GetRevision = define_c_func(sdl,"+SDL_GetRevision",{},C_STRING)

public function SDL_GetRevision()
	return c_func(xSDL_GetRevision,{})
end function

export constant xSDL_GetRevisionNumber = define_c_func(sdl,"+SDL_GetRevisionNumber",{},C_INT)

public function SDL_GetRevisionNumber()
	return c_func(xSDL_GetRevisionNumber,{})
end function
­14.22