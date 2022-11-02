include std/ffi.e

include SDL_error.e
include SDL_keycode.e
include SDL_video.e
include SDL_rect.e

include sdl.e

public constant SDL_Keysym = define_c_type({
	C_INT, --scancode
	C_INT, --keycode
	C_UINT, --mod
	C_UINT --unused
})

export constant xSDL_GetKeyboardFocus = define_c_func(sdl,"+SDL_GetKeyboardFocus",{},C_POINTER)

public function SDL_GetKeyboardFocus()
	return c_func(xSDL_GetKeyboardFocus,{})
end function

export constant xSDL_GetKeyboardState = define_c_func(sdl,"+SDL_GetKeyboardState",{C_POINTER},C_POINTER)

public function SDL_GetKeyboardState(atom numkeys)
	return c_func(xSDL_GetKeyboardState,{numkeys})
end function

export constant xSDL_ResetKeyboard = define_c_proc(sdl,"+SDL_ResetKeyboard",{})

public procedure SDL_ResetKeyboard()
	c_proc(xSDL_ResetKeyboard,{})
end procedure

export constant xSDL_GetModState = define_c_func(sdl,"+SDL_GetModState",{},C_INT)

public function SDL_GetModState()
	return c_func(xSDL_GetModState,{})
end function

export constant xSDL_SetModState = define_c_proc(sdl,"+SDL_SetModState",{C_INT})

public procedure SDL_SetModState(atom mod)
	c_proc(xSDL_SetModState,{mod})
end procedure

export constant xSDL_GetKeyFromScancode = define_c_func(sdl,"+SDL_GetKeyFromScancode",{C_INT},C_INT)

public function SDL_GetKeyFromScancode(atom code)
	return c_func(xSDL_GetKeyFromScancode,{code})
end function

export constant xSDL_GetScancodeFromKey = define_c_func(sdl,"+SDL_GetScancodeFromKey",{C_INT},C_INT)

public function SDL_GetScancodeFromKey(atom key)
	return c_func(xSDL_GetScancodeFromKey,{key})
end function

export constant xSDL_GetScancodeName = define_c_func(sdl,"+SDL_GetScancodeName",{C_INT},C_STRING)

public function SDL_GetScancodeName(atom code)
	return c_func(xSDL_GetScancodeName,{code})
end function

export constant xSDL_GetScancodeFromName = define_c_func(sdl,"+SDL_GetScancodeFromName",{C_STRING},C_INT)

public function SDL_GetScancodeFromName(sequence name)
	return c_func(xSDL_GetScancodeFromName,{name})
end function

export constant xSDL_GetKeyName = define_c_func(sdl,"+SDL_GetKeyName",{C_INT},C_STRING)

public function SDL_GetKeyName(atom key)
	return c_func(xSDL_GetKeyName,{key})
end function

export constant xSDL_GetKeyFromName = define_c_func(sdl,"+SDL_GetKeyFromName",{C_STRING},C_INT)

public function SDL_GetKeyFromName(sequence name)
	return c_func(xSDL_GetKeyFromName,{name})
end function

export constant xSDL_StartTextInput = define_c_proc(sdl,"+SDL_StartTextInput",{})

public procedure SDL_StartTextInput()
	c_proc(xSDL_StartTextInput,{})
end procedure

export constant xSDL_IsTextInputActive = define_c_func(sdl,"+SDL_IsTextInputActive",{},C_BOOL)

public function SDL_IsTextInputActive()
	return c_func(xSDL_IsTextInputActive,{})
end function

export constant xSDL_StopTextInput = define_c_proc(sdl,"+SDL_StopTextInput",{})

public procedure SDL_StopTextInput()
	c_proc(xSDL_StopTextInput,{})
end procedure

export constant xSDL_ClearComposition = define_c_proc(sdl,"+SDL_ClearComposition",{})

public procedure SDL_ClearComposition()
	c_proc(xSDL_ClearComposition,{})
end procedure

export constant xSDL_IsTextInputShown = define_c_func(sdl,"+SDL_IsTextInputShown",{},C_BOOL)

public function SDL_IsTextInputShown()
	return c_func(xSDL_IsTextInputShown,{})
end function

export constant xSDL_SetTextInputRect = define_c_proc(sdl,"+SDL_SetTextInputRect",{SDL_Rect})

public procedure SDL_SetTextInputRect(sequence rect)
	c_proc(xSDL_SetTextInputRect,{rect})
end procedure

export constant xSDL_HasScreenKeyboardSupport = define_c_func(sdl,"+SDL_HasScreenKeyboardSupport",{},C_BOOL)

public function SDL_HasScreenKeyboardSupport()
	return c_func(xSDL_HasScreenKeyboardSupport,{})
end function

export constant xSDL_IsScreenKeyboardShown = define_c_func(sdl,"+SDL_IsScreenKeyboardShown",{C_POINTER},C_BOOL)

public function SDL_IsScreenKeyboardShown(atom win)
	return c_func(xSDL_IsScreenKeyboardShown,{win})
end function
­6.18