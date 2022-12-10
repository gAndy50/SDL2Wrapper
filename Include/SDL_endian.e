include std/ffi.e

include sdl.e

export constant xSDL_Swap16 = define_c_func(sdl,"+SDL_Swap16",{C_UINT16},C_UINT16)

public function SDL_Swap16(atom x)
	return c_func(xSDL_Swap16,{x})
end function

export constant xSDL_Swap32 = define_c_func(sdl,"+SDL_Swap32",{C_UINT32},C_UINT32)

public function SDL_Swap32(atom x)
	return c_func(xSDL_Swap32,{x})
end function

export constant xSDL_Swap64 = define_c_func(sdl,"+SDL_Swap64",{C_UINT64},C_UINT64)

public function SDL_Swap64(atom x)
	return c_func(xSDL_Swap64,{x})
end function

export constant xSDL_SwapBE16 = define_c_func(sdl,"+SDL_SwapBE16",{C_UINT16},C_UINT16)

public function SDL_SwapBE16(atom x)
	return c_func(xSDL_SwapBE16,{x})
end function

export constant xSDL_SwapBE32 = define_c_func(sdl,"+SDL_SwapBE32",{C_UINT32},C_UINT32)

public function SDL_SwapBE32(atom x)
	return c_func(xSDL_SwapBE32,{x})
end function

export constant xSDL_SwapBE64 = define_c_func(sdl,"+SDL_SwapBE64",{C_UINT64},C_UINT64)

public function SDL_SwapBE64(atom x)
	return c_func(xSDL_SwapBE64,{x})
end function

export constant xSDL_SwapFloat = define_c_func(sdl,"+SDL_SwapFloat",{C_FLOAT},C_FLOAT)

public function SDL_SwapFloat(atom x)
	return c_func(xSDL_SwapFloat,{x})
end function

export constant xSDL_SwapFloatBE = define_c_func(sdl,"+SDL_SwapFloatBE",{C_FLOAT},C_FLOAT)

public function SDL_SwapFloatBE(atom x)
	return c_func(xSDL_SwapFloatBE,{x})
end function

export constant xSDL_SwapFloatLE = define_c_func(sdl,"+SDL_SwapFloatLE",{C_FLOAT},C_FLOAT)

public function SDL_SwapFloatLE(atom x)
	return c_func(xSDL_SwapFloatLE,{x})
end function

export constant xSDL_SwapLE16 = define_c_func(sdl,"+SDL_SwapLE16",{C_UINT16},C_UINT16)

public function SDL_SwapLE16(atom x)
	return c_func(xSDL_SwapLE16,{x})
end function

export constant xSDL_SwapLE32 = define_c_func(sdl,"+SDL_SwapLE32",{C_UINT32},C_UINT32)

public function SDL_SwapLE32(atom x)
	return c_func(xSDL_SwapLE32,{x})
end function

export constant xSDL_SwapLE64 = define_c_func(sdl,"+SDL_SwapLE64",{C_UINT64},C_UINT64)

public function SDL_SwapLE64(atom x)
	return c_func(xSDL_SwapLE64,{x})
end function
­71.85