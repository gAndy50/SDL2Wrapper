include std/ffi.e

include sdl.e

export constant xSDL_GetBasePath = define_c_func(sdl,"+SDL_GetBasePath",{},C_STRING)

public function SDL_GetBasePath()
	return c_func(xSDL_GetBasePath,{})
end function

export constant xSDL_GetPrefPath = define_c_func(sdl,"+SDL_GetPrefPath",{C_STRING,C_STRING},C_STRING)

public function SDL_GetPrefPath(sequence org,sequence app)
	return c_func(xSDL_GetPrefPath,{org,app})
end function
­14.42