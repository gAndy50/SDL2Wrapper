include std/ffi.e

include SDL_error.e
include SDL_video.e
include SDL_rect.e

include sdl.e

include SDL_surface.e

public enum type SDL_SystemCursor
	SDL_SYSTEM_CURSOR_ARROW = 0,
	SDL_SYSTEM_CURSOR_IBEAM,
	SDL_SYSTEM_CURSOR_WAIT,
	SDL_SYSTEM_CURSOR_CROSSHAIR,
	SDL_SYSTEM_CURSOR_WAITARROW,
	SDL_SYSTEM_CURSOR_SIZENWSE,
	SDL_SYSTEM_CURSOR_SIZENESW,
	SDL_SYSTEM_CURSOR_SIZEWE,
	SDL_SYSTEM_CURSOR_SIZENS,
	SDL_SYSTEM_CURSOR_SIZEALL,
	SDL_SYSTEM_CURSOR_NO,
	SDL_SYSTEM_CURSOR_HAND,
	SDL_NUM_SYSTEM_CURSORS
end type


public enum type SDL_MouseWheelDirection
	SDL_MOUSEWHEEL_NORMAL = 0,
	SDL_MOUSEWHEEL_FLIPPED
end type

export constant xSDL_GetMouseFocus = define_c_func(sdl,"+SDL_GetMouseFocus",{},C_POINTER)

public function SDL_GetMouseFocus()
	return c_func(xSDL_GetMouseFocus,{})
end function

export constant xSDL_GetMouseState = define_c_func(sdl,"+SDL_GetMouseState",{C_POINTER,C_POINTER},C_UINT)

public function SDL_GetMouseState(atom x,atom y)
	return c_func(xSDL_GetMouseState,{x,y})
end function

export constant xSDL_GetGlobalMouseState = define_c_func(sdl,"+SDL_GetGlobalMouseState",{C_POINTER,C_POINTER},C_UINT)

public function SDL_GetGlobalMouseState(atom x,atom y)
	return c_func(xSDL_GetGlobalMouseState,{x,y})
end function

export constant xSDL_GetRelativeMouseState = define_c_func(sdl,"+SDL_GetRelativeMouseState",{C_POINTER,C_POINTER},C_UINT)

public function SDL_GetRelativeMouseState(atom x,atom y)
	return c_func(xSDL_GetRelativeMouseState,{x,y})
end function

export constant xSDL_WarpMouseInWindow = define_c_proc(sdl,"+SDL_WarpMouseInWindow",{C_POINTER,C_INT,C_INT})

public procedure SDL_WarpMouseInWindow(atom win,atom x,atom y)
	c_proc(xSDL_WarpMouseInWindow,{win,x,y})
end procedure

export constant xSDL_WarpMouseGlobal = define_c_func(sdl,"+SDL_WarpMouseGlobal",{C_INT,C_INT},C_INT)

public function SDL_WarpMouseGlobal(atom x,atom y)
	return c_func(xSDL_WarpMouseGlobal,{x,y})
end function

export constant xSDL_SetRelativeMouseMode = define_c_func(sdl,"+SDL_SetRelativeMouseMode",{C_BOOL},C_INT)

public function SDL_SetRelativeMouseMode(atom en)
	return c_func(xSDL_SetRelativeMouseMode,{en})
end function

export constant xSDL_GetRelativeMouseMode = define_c_func(sdl,"+SDL_GetRelativeMouseMode",{},C_BOOL)

public function SDL_GetRelativeMouseMode()
	return c_func(xSDL_GetRelativeMouseMode,{})
end function

export constant xSDL_CreateCursor = define_c_func(sdl,"+SDL_CreateCursor",{C_POINTER,C_POINTER,C_INT,C_INT,C_INT,C_INT},C_POINTER)

public function SDL_CreateCursor(atom data,atom mask,atom w,atom h,atom x,atom y)
	return c_func(xSDL_CreateCursor,{data,mask,w,h,x,y})
end function

export constant xSDL_CreateColorCursor = define_c_func(sdl,"+SDL_CreateColorCursor",{SDL_Surface,C_INT,C_INT},C_POINTER)

public function SDL_CreateColorCursor(sequence surface,atom x,atom y)
	return c_func(xSDL_CreateColorCursor,{surface,x,y})
end function

export constant xSDL_CreateSystemCursor = define_c_func(sdl,"+SDL_CreateSystemCursor",{C_INT},C_POINTER)

public function SDL_CreateSystemCursor(atom id)
	return c_func(xSDL_CreateSystemCursor,{id})
end function

export constant xSDL_SetCursor = define_c_proc(sdl,"+SDL_SetCursor",{C_POINTER})

public procedure SDL_SetCursor(atom cur)
	c_proc(xSDL_SetCursor,{cur})
end procedure

export constant xSDL_GetCursor = define_c_func(sdl,"+SDL_GetCursor",{},C_POINTER)

public function SDL_GetCursor()
	return c_func(xSDL_GetCursor,{})
end function

export constant xSDL_GetDefaultCursor = define_c_func(sdl,"+SDL_GetDefaultCursor",{},C_POINTER)

public function SDL_GetDefaultCursor()
	return c_func(xSDL_GetDefaultCursor,{})
end function

export constant xSDL_FreeCursor = define_c_proc(sdl,"+SDL_FreeCursor",{C_POINTER})

public procedure SDL_FreeCursor(atom cur)
	c_proc(xSDL_FreeCursor,{cur})
end procedure

export constant xSDL_ShowCursor = define_c_func(sdl,"+SDL_ShowCursor",{C_INT},C_INT)

public function SDL_ShowCursor(atom toggle)
	return c_func(xSDL_ShowCursor,{toggle})
end function

public constant SDL_BUTTON = -1
public constant SDL_BUTTON_LEFT = 1,
				SDL_BUTTON_MIDDLE = 2,
				SDL_BUTTON_RIGHT = 3,
				SDL_BUTTON_X1 = 4,
				SDL_BUTTON_X2 = 5
				
public constant SDL_BUTTON_LMASK = SDL_BUTTON_LEFT,
				SDL_BUTTON_MMASK = SDL_BUTTON_MIDDLE,
				SDL_BUTTON_RMASK = SDL_BUTTON_RIGHT,
				SDL_BUTTON_X1MASK = SDL_BUTTON_X1,
				SDL_BUTTON_X2MASK = SDL_BUTTON_X2
­140.37