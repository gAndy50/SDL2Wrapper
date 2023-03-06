include std/ffi.e

--include SDL_video.e

include sdl.e

public enum type SDL_MessageBoxFlags
	SDL_MESSAGEBOX_ERROR = 0x00000010,
	SDL_MESSAGEBOX_WARNING = 0x00000020,
	SDL_MESSAGEBOX_INFORMATION = 0x00000040,
	SDL_MESSAGEBOX_BUTTONS_LEFT_TO_RIGHT = 0x00000080,
	SDL_MESSAGEBOX_BUTTONS_RIGHT_TO_LEFT = 0x00000100
end type

public enum type SDL_MessageBoxButtonFlags
	SDL_MESSABEBOX_BUTTON_RETURNKEY_DEFAULT = 1,
	SDL_MESSAGEBOX_BUTTON_ESCAPEKEY_DEFAULT = 2
end type

public constant SDL_MessageBoxButtonData = define_c_struct({
	C_UINT, --flags
	C_INT, --buttonid
	C_STRING --text
})

public constant SDL_MessageBoxColor = define_c_struct({
	C_UINT, --r
	C_UINT, --g
	C_UINT --b
})

public enum type SDL_MessageBoxColorType
	SDL_MESSAGEBOX_COLOR_BACKGROUND = 0,
	SDL_MESSAGEBOX_COLOR_TEXT,
	SDL_MESSAGEBOX_COLOR_BUTTON_BORDER,
	SDL_MESSAGEBOX_COLOR_BUTTON_BACKGROUND,
	SDL_MESSAGEBOX_COLOR_BUTTON_SELECTED,
	SDL_MESSAGEBOX_COLOR_MAX
end type

public constant SDL_MessageBoxColorScheme = define_c_struct({
	SDL_MessageBoxColor --colors
})

public constant SDL_MessageBoxData = define_c_struct({
	C_UINT, --flags
	C_POINTER, --window
	C_STRING, --title
	C_STRING, --message
	C_INT, --numbuttons
	SDL_MessageBoxButtonData, --buttons
	SDL_MessageBoxColorScheme
})

export constant xSDL_ShowMessageBox = define_c_func(sdl,"+SDL_ShowMessageBox",{SDL_MessageBoxData,C_POINTER},C_INT)

public function SDL_ShowMessageBox(sequence mbdata,atom id)
	return c_func(xSDL_ShowMessageBox,{mbdata,id})
end function

export constant xSDL_ShowSimpleMessageBox = define_c_func(sdl,"+SDL_ShowSimpleMessageBox",{C_UINT,C_STRING,C_STRING,C_POINTER},C_INT)

public function SDL_ShowSimpleMessageBox(atom flags,sequence title,sequence msg,atom win)
	return c_func(xSDL_ShowSimpleMessageBox,{flags,title,msg,win})
end function
­41.59