include std/ffi.e
include std/machine.e

include SDL_error.e

include sdl.e

public constant SDL_GUID = define_c_struct({
	{C_UINT,16} --data
})

export constant xSDL_GUIDToString = define_c_proc(sdl,"+SDL_GUIDToString",{C_POINTER,C_STRING,C_INT})

public procedure SDL_GUIDToString(atom guid,sequence sz,atom cb)

	c_proc(xSDL_GUIDToString,{guid,sz,cb})
end procedure

export constant xSDL_GUIDFromString = define_c_func(sdl,"+SDL_GUIDFromString",{C_STRING},SDL_GUID)

public function SDL_GUIDFromString(sequence pch)
	return c_func(xSDL_GUIDFromString,{pch})
end function
­16.31