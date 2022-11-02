include std/ffi.e

include SDL_pixels.e
include SDL_rect.e
include SDL_surface.e
include SDL_video.e

include sdl.e

public constant SDL_NONSHAPEABLE_WINDOW = -1,
				SDL_INVALID_SHAPE_ARGUMENT = -2,
				SDL_WINDOW_LACKS_SHAPE = -3
				
export constant xSDL_CreateShapedWindow = define_c_func(sdl,"+SDL_CreateShapedWindow",{C_STRING,C_UINT,C_UINT,C_UINT,C_UINT,C_UINT},C_POINTER)

public function SDL_CreateShapedWindow(sequence title,atom x,atom y,atom w,atom h,atom flags)
	return c_func(xSDL_CreateShapedWindow,{title,x,y,w,h,flags})
end function

export constant xSDL_IsShapedWindow = define_c_func(sdl,"+SDL_IsShapedWindow",{C_POINTER},C_BOOL)

public function SDL_IsShapedWindow(atom win)
	return c_func(xSDL_IsShapedWindow,{win})
end function

public enum type WindowShapeMode
	ShapeModeDefault = 0,
	ShapeModeBinarizeAlpha,
	ShapeModeReverseBinarizeAlpha,
	ShapeModeColorKey
end type

public constant SDL_WindowShapeParams = define_c_type({
	C_UINT, --binarizationCutoff
	SDL_Color --colorKey
})

public constant SDL_WindowShapeMode = define_c_type({
	C_INT, --mode
	SDL_WindowShapeParams --parameters
})

export constant xSDL_SetWindowShape = define_c_func(sdl,"+SDL_SetWindowShape",{C_POINTER,SDL_Surface,SDL_WindowShapeMode},C_INT)

public function SDL_SetWindowShape(atom win,sequence shape,sequence mode)
	return c_func(xSDL_SetWindowShape,{win,shape,mode})
end function

export constant xSDL_GetShapedWindowMode = define_c_func(sdl,"+SDL_GetShapedWindowMode",{C_POINTER,SDL_WindowShapeMode},C_INT)

public function SDL_GetShapedWindowMode(atom win,sequence mode)
	return c_func(xSDL_GetShapedWindowMode,{win,mode})
end function
­7.0