include std/ffi.e

include sdl.e

export constant xSDL_SetClipboardText = define_c_func(sdl,"+SDL_SetClipboardText",{C_STRING},C_INT)

public function SDL_SetClipboardText(sequence text)
	return c_func(xSDL_SetClipboardText,{text})
end function

export constant xSDL_GetClipboardText = define_c_func(sdl,"+SDL_GetClipboardText",{},C_POINTER)

public function SDL_GetClipboardText()
	return c_func(xSDL_GetClipboardText,{})
end function

export constant xSDL_HasClipboardText = define_c_func(sdl,"+SDL_HasClipboardText",{},C_BOOL)

public function SDL_HasClipboardText()
	return c_func(xSDL_HasClipboardText,{})
end function
­20.40