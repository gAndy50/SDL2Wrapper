include std/ffi.e

include SDL_error.e
include SDL_video.e

include SDL_touch.e

include sdl.e

export constant xSDL_RecordGesture = define_c_func(sdl,"+SDL_RecordGesture",{C_LONG},C_INT)

public function SDL_RecordGesture(atom id)
	return c_func(xSDL_RecordGesture,{id})
end function

export constant xSDL_SaveAllDollarTemplates = define_c_func(sdl,"+SDL_SaveAllDollarTemplates",{C_POINTER},C_INT)

public function SDL_SaveAllDollarTemplates(atom dst)
	return c_func(xSDL_SaveAllDollarTemplates,{dst})
end function

export constant xSDL_SaveDollarTemplate = define_c_func(sdl,"+SDL_SaveDollarTemplate",{C_LONG,C_POINTER},C_INT)

public function SDL_SaveDollarTemplate(atom id,atom dst)
	return c_func(xSDL_SaveDollarTemplate,{id,dst})
end function

export constant xSDL_LoadDollarTemplates = define_c_func(sdl,"+SDL_LoadDollarTemplates",{C_LONG,C_POINTER},C_INT)

public function SDL_LoadDollarTemplates(atom id,atom src)
	return c_func(xSDL_LoadDollarTemplates,{id,src})
end function
­32.12