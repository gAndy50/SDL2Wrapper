include std/ffi.e
include SDL_gfx.e

public constant FPS_UPPER_LIMIT = 200

public constant FPS_LOWER_LIMIT = 1

public constant FPS_DEFAULT = 30

public constant FPSmanager = define_c_struct({
	C_UINT32, --framecount
	C_FLOAT, --rateticks
	C_UINT32, --baseticks
	C_UINT32, --lastticks
	C_UINT32 --rate
})

export constant xSDL_initFramerate = define_c_proc(gfx,"+SDL_initFramerate",{C_POINTER}),
				xSDL_setFramerate = define_c_func(gfx,"+SDL_setFramerate",{C_POINTER,C_UINT32},C_INT),
				xSDL_getFramerate = define_c_func(gfx,"+SDL_getFramerate",{C_POINTER},C_INT),
				xSDL_getFramecount = define_c_func(gfx,"+SDL_getFramecount",{C_POINTER},C_INT),
				xSDL_framerateDelay = define_c_func(gfx,"+SDL_framerateDelay",{C_POINTER},C_UINT32)
				
public function SDL_initFramerate(atom m)
	return c_func(xSDL_initFramerate,{m})
end function

public function SDL_setFramerate(atom m,atom r)
	return c_func(xSDL_setFramerate,{m,r})
end function

public function SDL_getFramerate(atom m)
	return c_func(xSDL_getFramerate,{m})
end function

public function SDL_getFramecount(atom m)
	return c_func(xSDL_getFramecount,{m})
end function

public function SDL_framerateDelay(atom m)
	return c_func(xSDL_framerateDelay,{m})
end function
­1.0