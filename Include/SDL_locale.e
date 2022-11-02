include std/ffi.e

include SDL_error.e

include sdl.e

public constant SDL_Locale = define_c_type({
	C_STRING, --language
	C_STRING --country
})

export constant xSDL_GetPreferredLocales = define_c_func(sdl,"+SDL_GetPreferredLocales",{},SDL_Locale)

public function SDL_GetPreferredLocales()
	return c_func(xSDL_GetPreferredLocales,{})
end function
­15.43