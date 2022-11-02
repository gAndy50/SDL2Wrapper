include std/ffi.e

include SDL_error.e
include sdl.e

public constant SDL_RWOPS_UNKNOWN = 0,
				SDL_RWOPS_WINFILE = 1,
				SDL_RWOPS_STDFILE = 2,
				SDL_RWOPS_JNIFILE = 3,
				SDL_RWOPS_MEMORY = 4,
				SDL_RWOPS_MEMORY_RO = 5
				
export constant xSDL_RWFromFile = define_c_func(sdl,"+SDL_RWFromFile",{C_STRING,C_STRING},C_POINTER)

public function SDL_RWFromFile(sequence file,sequence mode)
	return c_func(xSDL_RWFromFile,{file,mode})
end function

export constant xSDL_RWFromFP = define_c_func(sdl,"+SDL_RWFromFP",{C_POINTER,C_BOOL},C_POINTER)

public function SDL_RWFromFP(atom fp,atom autoclose)
	return c_func(xSDL_RWFromFP,{fp,autoclose})
end function

export constant xSDL_RWFromMem = define_c_func(sdl,"+SDL_RWFromMem",{C_POINTER,C_INT},C_POINTER)

public function SDL_RWFromMem(atom mem,atom size)
	return c_func(xSDL_RWFromMem,{mem,size})
end function

export constant xSDL_RWFromConstMem = define_c_func(sdl,"+SDL_RWFromConstMem",{C_POINTER,C_INT},C_POINTER)

public function SDL_RWFromConstMem(atom mem,atom size)
	return c_func(xSDL_RWFromConstMem,{mem,size})
end function

export constant xSDL_AllocRW = define_c_func(sdl,"+SDL_AllocRW",{},C_POINTER)

public function SDL_AllocRW()
	return c_func(xSDL_AllocRW,{})
end function

export constant xSDL_FreeRW = define_c_proc(sdl,"+SDL_FreeRW",{C_POINTER})

public procedure SDL_FreeRW(sequence area)
	c_proc(xSDL_FreeRW,{area})
end procedure

public constant RW_SEEK_SET = 0
public constant RW_SEEK_CUR = 1
public constant RW_SEEK_END = 2

export constant xSDL_RWsize = define_c_func(sdl,"+SDL_RWsize",{C_POINTER},C_LONG)

public function SDL_RWsize(sequence context)
	return c_func(xSDL_RWsize,{context})
end function

export constant xSDL_RWseek = define_c_func(sdl,"+SDL_RWseek",{C_POINTER,C_LONG,C_INT},C_LONG)

public function SDL_RWseek(sequence context,atom offset,atom whence)
	return c_func(xSDL_RWseek,{context,offset,whence})
end function

export constant xSDL_RWtell = define_c_func(sdl,"+SDL_RWtell",{C_POINTER},C_LONG)

public function SDL_RWtell(sequence context)
	return c_func(xSDL_RWtell,{context})
end function

export constant xSDL_RWread = define_c_func(sdl,"+SDL_RWread",{C_POINTER,C_POINTER,C_SIZE_T,C_SIZE_T},C_SIZE_T)

public function SDL_RWread(sequence context,atom ptr,atom size,atom maxnum)
	return c_func(xSDL_RWread,{context,ptr,size,maxnum})
end function

export constant xSDL_RWwrite = define_c_func(sdl,"+SDL_RWwrite",{C_POINTER,C_POINTER,C_SIZE_T,C_SIZE_T},C_SIZE_T)

public function SDL_RWwrite(sequence context,atom ptr,atom size,atom num)
	return c_func(xSDL_RWwrite,{context,ptr,size,num})
end function

export constant xSDL_RWclose = define_c_func(sdl,"+SDL_RWclose",{C_POINTER},C_INT)

public function SDL_RWclose(sequence context)
	return c_func(xSDL_RWclose,{context})
end function

export constant xSDL_LoadFile_RW = define_c_func(sdl,"+SDL_LoadFile_RW",{C_POINTER,C_POINTER,C_INT},C_POINTER)

public function SDL_LoadFile_RW(sequence src,atom size,atom freesrc)
	return c_func(xSDL_LoadFile_RW,{src,size,freesrc})
end function

export constant xSDL_LoadFile = define_c_func(sdl,"+SDL_LoadFile",{C_STRING,C_POINTER},C_POINTER)

public function SDL_LoadFile(sequence file,atom size)
	return c_func(xSDL_LoadFile,{file,size})
end function

export constant xSDL_ReadU8 = define_c_func(sdl,"+SDL_ReadU8",{C_POINTER},C_UINT)

public function SDL_ReadU8(sequence src)
	return c_func(xSDL_ReadU8,{src})
end function

export constant xSDL_ReadLE16 = define_c_func(sdl,"+SDL_ReadLE16",{C_POINTER},C_UINT)

public function SDL_ReadLE16(sequence src)
	return c_func(xSDL_ReadLE16,{src})
end function

export constant xSDL_ReadBE16 = define_c_func(sdl,"+SDL_ReadBE16",{C_POINTER},C_UINT)

public function SDL_ReadBE16(sequence src)
	return c_func(xSDL_ReadBE16,{src})
end function

export constant xSDL_ReadLE32 = define_c_func(sdl,"+SDL_ReadLE32",{C_POINTER},C_UINT)

public function SDL_ReadLE32(sequence src)
	return c_func(xSDL_ReadLE32,{src})
end function

export constant xSDL_ReadBE32 = define_c_func(sdl,"+SDL_ReadBE32",{C_POINTER},C_UINT)

public function SDL_ReadBE32(sequence src)
	return c_func(xSDL_ReadBE32,{src})
end function

export constant xSDL_ReadLE64 = define_c_func(sdl,"+SDL_ReadLE64",{C_POINTER},C_LONG)

public function SDL_ReadLE64(sequence src)
	return c_func(xSDL_ReadLE64,{src})
end function

export constant xSDL_ReadBE64 = define_c_func(sdl,"+SDL_ReadBE64",{C_POINTER},C_LONG)

public function SDL_ReadBE64(sequence src)
	return c_func(xSDL_ReadBE64,{src})
end function

export constant xSDL_WriteU8 = define_c_func(sdl,"+SDL_WriteU8",{C_POINTER,C_UINT},C_SIZE_T)

public function SDL_WriteU8(sequence dst,atom val)
	return c_func(xSDL_WriteU8,{dst,val})
end function

export constant xSDL_WriteLE16 = define_c_func(sdl,"+SDL_WriteLE16",{C_POINTER,C_UINT},C_SIZE_T)

public function SDL_WriteLE16(sequence dst,atom val)
	return c_func(xSDL_WriteLE16,{dst,val})
end function

export constant xSDL_WriteBE16 = define_c_func(sdl,"+SDL_WriteBE16",{C_POINTER,C_UINT},C_SIZE_T)

public function SDL_WriteBE16(sequence dst,atom val)
	return c_func(xSDL_WriteBE16,{dst,val})
end function

export constant xSDL_WriteLE32 = define_c_func(sdl,"+SDL_WriteLE32",{C_POINTER,C_UINT},C_SIZE_T)

public function SDL_WriteLE32(sequence dst,atom val)
	return c_func(xSDL_WriteLE32,{dst,val})
end function

export constant xSDL_WriteBE32 = define_c_func(sdl,"+SDL_WriteBE32",{C_POINTER,C_UINT},C_SIZE_T)

public function SDL_WriteBE32(sequence dst,atom val)
	return c_func(xSDL_WriteBE32,{dst,val})
end function

export constant xSDL_WriteLE64 = define_c_func(sdl,"+SDL_WriteLE64",{C_POINTER,C_LONG},C_SIZE_T)

public function SDL_WriteLE64(sequence dst,atom val)
	return c_func(xSDL_WriteLE64,{dst,val})
end function

export constant xSDL_WriteBE64 = define_c_func(sdl,"+SDL_WriteBE64",{C_POINTER,C_LONG},C_SIZE_T)

public function SDL_WriteBE64(sequence dst,atom val)
	return c_func(xSDL_WriteBE64,{dst,val})
end function
­182.40