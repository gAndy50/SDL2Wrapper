include std/ffi.e

include sdl.e

export constant xSDL_OpenURL = define_c_func(sdl,"+SDL_OpenURL",{C_STRING},C_INT)

public function SDL_OpenURL(sequence url)
	return c_func(xSDL_OpenURL,{url})
end function
­8.34