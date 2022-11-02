include std/ffi.e

include sdl.e

public constant SDL_version = define_c_type({
	C_UINT, --major
	C_UINT, --minor
	C_UINT --patch
})

public constant SDL_MAJOR_VERSION = 2,
				SDL_MINOR_VERSION = 24,
				SDL_PATCHLEVEL = 1
				
export constant xSDL_GetVersion = define_c_proc(sdl,"+SDL_GetVersion",{SDL_version})

public procedure SDL_GetVersion(sequence ver)
	c_proc(xSDL_GetVersion,{ver})
end procedure

export constant xSDL_GetRevision = define_c_func(sdl,"+SDL_GetRevision",{},C_STRING)

public function SDL_GetRevision()
	return c_func(xSDL_GetRevision,{})
end function

export constant xSDL_GetRevisionNumber = define_c_func(sdl,"+SDL_GetRevisionNumber",{},C_INT)

public function SDL_GetRevisionNumber()
	return c_func(xSDL_GetRevisionNumber,{})
end function
­30.41