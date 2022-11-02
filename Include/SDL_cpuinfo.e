include std/ffi.e

include sdl.e

public constant SDL_CACHELINE_SIZE = 128

export constant xSDL_GetCPUCount = define_c_func(sdl,"+SDL_GetCPUCount",{},C_INT)

public function SDL_GetCPUCount()
	return c_func(xSDL_GetCPUCount,{})
end function

export constant xSDL_GetCPUCacheLineSize = define_c_func(sdl,"+SDL_GetCPUCacheLineSize",{},C_INT)

public function SDL_GetCPUCacheLineSize()
	return c_func(xSDL_GetCPUCacheLineSize,{})
end function

export constant xSDL_HasRDTSC = define_c_func(sdl,"+SDL_HasRDTSC",{},C_BOOL)

public function SDL_HasRDTSC()
	return c_func(xSDL_HasRDTSC,{})
end function

export constant xSDL_HasAltiVec = define_c_func(sdl,"+SDL_HasAltiVec",{},C_BOOL)

public function SDL_HasAltiVec()
	return c_func(xSDL_HasAltiVec,{})
end function

export constant xSDL_HasMMX = define_c_func(sdl,"+SDL_HasMMX",{},C_BOOL)

public function SDL_HasMMX()
	return c_func(xSDL_HasMMX,{})
end function

export constant xSDL_Has3DNow = define_c_func(sdl,"+SDL_Has3DNow",{},C_BOOL)

public function SDL_Has3DNow()
	return c_func(xSDL_Has3DNow,{})
end function

export constant xSDL_HasSSE = define_c_func(sdl,"+SDL_HasSSE",{},C_BOOL)

public function SDL_HasSSE()
	return c_func(xSDL_HasSSE,{})
end function

export constant xSDL_HasSSE2 = define_c_func(sdl,"+SDL_HasSSE2",{},C_BOOL)

public function SDL_HasSSE2()
	return c_func(xSDL_HasSSE2,{})
end function

export constant xSDL_HasSSE3 = define_c_func(sdl,"+SDL_HasSSE3",{},C_BOOL)

public function SDL_HasSSE3()
	return c_func(xSDL_HasSSE3,{})
end function

export constant xSDL_HasSSE41 = define_c_func(sdl,"+SDL_HasSSE41",{},C_BOOL)

public function SDL_HasSSE41()
	return c_func(xSDL_HasSSE41,{})
end function

export constant xSDL_HasSSE42 = define_c_func(sdl,"+SDL_HasSSE42",{},C_BOOL)

public function SDL_HasSSE42()
	return c_func(xSDL_HasSSE42,{})
end function

export constant xSDL_HasAVX = define_c_func(sdl,"+SDL_HasAVX",{},C_BOOL)

public function SDL_HasAVX()
	return c_func(xSDL_HasAVX,{})
end function

export constant xSDL_HasAVX2 = define_c_func(sdl,"+SDL_HasAVX2",{},C_BOOL)

public function SDL_HasAVX2()
	return c_func(xSDL_HasAVX2,{})
end function

export constant xSDL_HasAVX512F = define_c_func(sdl,"+SDL_HasAVX512F",{},C_BOOL)

public function SDL_HasAVX512F()
	return c_func(xSDL_HasAVX512F,{})
end function

export constant xSDL_HasARMSIMD = define_c_func(sdl,"+SDL_HasARMSIMD",{},C_BOOL)

public function SDL_HasARMSIMD()
	return c_func(xSDL_HasARMSIMD,{})
end function

export constant xSDL_HasNEON = define_c_func(sdl,"+SDL_HasNEON",{},C_BOOL)

public function SDL_HasNEON()
	return c_func(xSDL_HasNEON,{})
end function

export constant xSDL_HasLSX = define_c_func(sdl,"+SDL_HasLSX",{},C_BOOL)

public function SDL_HasLSX()
	return c_func(xSDL_HasLSX,{})
end function

export constant xSDL_HasLASX = define_c_func(sdl,"+SDL_HasLASX",{},C_BOOL)

public function SDL_HasLASX()
	return c_func(xSDL_HasLASX,{})
end function

export constant xSDL_GetSystemRAM = define_c_func(sdl,"+SDL_GetSystemRAM",{},C_INT)

public function SDL_GetSystemRAM()
	return c_func(xSDL_GetSystemRAM,{})
end function

export constant xSDL_SIMDGetAlignment = define_c_func(sdl,"+SDL_SIMDGetAlignment",{},C_SIZE_T)

public function SDL_SIMDGetAlignment()
	return c_func(xSDL_SIMDGetAlignment,{})
end function

export constant xSDL_SIMDAlloc = define_c_func(sdl,"+SDL_SIMDAlloc",{C_SIZE_T},C_POINTER)

public function SDL_SIMDAlloc(atom len)
	return c_func(xSDL_SIMDAlloc,{len})
end function

export constant xSDL_SIMDRealloc = define_c_func(sdl,"+SDL_SIMDRealloc",{C_POINTER,C_SIZE_T},C_POINTER)

public function SDL_SIMDRealloc(atom mem,atom len)
	return c_func(xSDL_SIMDRealloc,{mem,len})
end function

export constant xSDL_SIMDFree = define_c_proc(sdl,"+SDL_SIMDFree",{C_POINTER})

public procedure SDL_SIMDFree(atom ptr)
	c_proc(xSDL_SIMDFree,{ptr})
end procedure
­142.28