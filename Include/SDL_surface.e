include std/ffi.e

include SDL_pixels.e
include SDL_rect.e
include SDL_blendmode.e
include SDL_rwops.e

include sdl.e

public constant SDL_SWSURFACE = 0,
				SDL_PREALLOC = 1,
				SDL_RLEACCEL = 2,
				SDL_DONTFREE = 4,
				SDL_SIMD_ALIGNED = 8
				
public constant SDL_Surface = define_c_type({
	C_UINT, --flags
	SDL_PixelFormat, --format
	C_INT, --w
	C_INT, --h
	C_INT, --pitch
	C_POINTER, --pixels
	C_POINTER, --userdata
	C_INT, --locked
	C_POINTER, --list_blitmap
	SDL_Rect, --clip_rect
	C_POINTER, --map info for fast blit mapping
	C_INT --refcount
})

public enum type SDL_YUV_CONVERSION_MODE
	SDL_YUV_CONVERSION_JPEG = 0,
	SDL_YUV_CONVERSION_BT601,
	SDL_YUV_CONVERSION_BT709,
	SDL_YUV_CONVERSION_AUTOMATIC
end type

export constant xSDL_CreateRGBSurface = define_c_func(sdl,"+SDL_CreateRGBSurface",{C_UINT,C_INT,C_INT,C_INT,C_UINT,C_UINT,C_UINT,C_UINT},C_POINTER)

public function SDL_CreateRGBSurface(atom flags,atom w,atom h,atom d,atom r,atom g,atom b,atom a)
	return c_func(xSDL_CreateRGBSurface,{flags,w,h,d,r,g,b,a})
end function

export constant xSDL_CreateRGBSurfaceWithFormat = define_c_func(sdl,"+SDL_CreateRGBSurfaceWithFormat",{C_UINT,C_INT,C_INT,C_INT,C_UINT},C_POINTER)

public function SDL_CreateRGBSurfaceWithFormat(atom flags,atom w,atom h,atom d,atom format)
	return c_func(xSDL_CreateRGBSurfaceWithFormat,{flags,w,h,d,format})
end function

export constant xSDL_CreateRGBSurfaceFrom = define_c_func(sdl,"+SDL_CreateRGBSurfaceFrom",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT,C_UINT,C_UINT,C_UINT},C_POINTER)

public function SDL_CreateRGBSurfaceFrom(atom pixels,atom w,atom h,atom d,atom p,atom r,atom g,atom b,atom a)
	return c_func(xSDL_CreateRGBSurfaceFrom,{pixels,w,h,d,p,r,g,b,a})
end function

export constant xSDL_CreateRGBSurfaceWithFormatFrom = define_c_func(sdl,"+SDL_CreateRGBSurfaceWithFormatFrom",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT},C_POINTER)

public function SDL_CreateRGBSurfaceWithFormatFrom(atom pixels,atom w,atom h,atom d,atom p,atom format)
	return c_func(xSDL_CreateRGBSurfaceWithFormatFrom,{pixels,w,h,d,p,format})
end function

export constant xSDL_FreeSurface = define_c_proc(sdl,"+SDL_FreeSurface",{SDL_Surface})

public procedure SDL_FreeSurface(sequence surface)
	c_proc(xSDL_FreeSurface,{surface})
end procedure

export constant xSDL_SetSurfacePalette = define_c_func(sdl,"+SDL_SetSurfacePalette",{SDL_Surface,SDL_Palette},C_INT)

public function SDL_SetSurfacePalette(sequence surface,sequence palette)
	return c_func(xSDL_SetSurfacePalette,{surface,palette})
end function

export constant xSDL_LockSurface = define_c_func(sdl,"+SDL_LockSurface",{SDL_Surface},C_INT)

public function SDL_LockSurface(sequence surface)
	return c_func(xSDL_LockSurface,{surface})
end function

export constant xSDL_UnlockSurface = define_c_proc(sdl,"+SDL_UnlockSurface",{SDL_Surface})

public procedure SDL_UnlockSurface(atom surface)
	c_proc(xSDL_UnlockSurface,{surface})
end procedure

export constant xSDL_LoadBMP_RW = define_c_func(sdl,"+SDL_LoadBMP_RW",{C_POINTER,C_INT},C_POINTER)

public function SDL_LoadBMP_RW(atom src,atom freesrc)
	return c_func(xSDL_LoadBMP_RW,{src,freesrc})
end function

export constant xSDL_LoadBMP = define_c_func(sdl,"+SDL_LoadBMP",{C_POINTER},C_POINTER)

public function SDL_LoadBMP(sequence file)
	return SDL_LoadBMP_RW(SDL_RWFromFile(file,"rb"),1)
end function

export constant xSDL_SaveBMP_RW = define_c_func(sdl,"+SDL_SaveBMP_RW",{SDL_Surface,C_POINTER,C_INT},C_INT)

public function SDL_SaveBMP_RW(atom surface,atom dst,atom freedst)
	return c_func(xSDL_SaveBMP_RW,{surface,dst,freedst})
end function

export constant xSDL_SaveBMP = define_c_func(sdl,"+SDL_SaveBMP",{C_POINTER},C_POINTER)

public function SDL_SaveBMP(atom surf,sequence file)
	return SDL_SaveBMP_RW(surf, SDL_RWFromFile(file,"wb"),1)
end function

export constant xSDL_SetSurfaceRLE = define_c_func(sdl,"+SDL_SetSurfaceRLE",{SDL_Surface,C_INT},C_INT)

public function SDL_SetSurfaceRLE(atom surface,atom flag)
	return c_func(xSDL_SetSurfaceRLE,{surface,flag})
end function

export constant xSDL_HasSurfaceRLE = define_c_func(sdl,"+SDL_HasSurfaceRLE",{SDL_Surface},C_BOOL)

public function SDL_HasSurfaceRLE(atom surface)
	return c_func(xSDL_HasSurfaceRLE,{surface})
end function

export constant xSDL_SetColorKey = define_c_func(sdl,"+SDL_SetColorKey",{SDL_Surface,C_INT,C_UINT},C_INT)

public function SDL_SetColorKey(atom surface,atom flag,atom key)
	return c_func(xSDL_SetColorKey,{surface,flag,key})
end function

export constant xSDL_HasColorKey = define_c_func(sdl,"+SDL_HasColorKey",{SDL_Surface},C_BOOL)

public function SDL_HasColorKey(atom surface)
	return c_func(xSDL_HasColorKey,{surface})
end function

export constant xSDL_GetColorKey = define_c_func(sdl,"+SDL_GetColorKey",{SDL_Surface,C_POINTER},C_INT)

public function SDL_GetColorKey(atom surface,atom key)
	return c_func(xSDL_GetColorKey,{surface,key})
end function

export constant xSDL_SetSurfaceColorMod = define_c_func(sdl,"+SDL_SetSurfaceColorMod",{SDL_Surface,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_SetSurfaceColorMod(atom surface,atom r,atom g,atom b)
	return c_func(xSDL_SetSurfaceColorMod,{surface,r,g,b})
end function

export constant xSDL_GetSurfaceColorMod = define_c_func(sdl,"+SDL_GetSurfaceColorMod",{SDL_Surface,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetSurfaceColorMod(atom surface,atom r,atom g,atom b)
	return c_func(xSDL_GetSurfaceColorMod,{surface,r,g,b})
end function

export constant xSDL_SetSurfaceAlphaMod = define_c_func(sdl,"+SDL_SetSurfaceAlphaMod",{SDL_Surface,C_UINT},C_INT)

public function SDL_SetSurfaceAlphaMod(atom surface,atom alpha)
	return c_func(xSDL_SetSurfaceAlphaMod,{surface,alpha})
end function

export constant xSDL_GetSurfaceAlphaMod = define_c_func(sdl,"+SDL_GetSurfaceAlphaMod",{SDL_Surface,C_POINTER},C_INT)

public function SDL_GetSurfaceAlphaMod(atom surface,atom alpha)
	return c_func(xSDL_GetSurfaceAlphaMod,{surface,alpha})
end function

export constant xSDL_SetSurfaceBlendMode = define_c_func(sdl,"+SDL_SetSurfaceBlendMode",{SDL_Surface,C_INT},C_INT)

public function SDL_SetSurfaceBlendMode(atom surface,atom mode)
	return c_func(xSDL_SetSurfaceBlendMode,{surface,mode})
end function

export constant xSDL_GetSurfaceBlendMode = define_c_func(sdl,"+SDL_GetSurfaceBlendMode",{SDL_Surface,C_POINTER},C_INT)

public function SDL_GetSurfaceBlendMode(atom surface,atom mode)
	return c_func(xSDL_GetSurfaceBlendMode,{surface,mode})	
end function

export constant xSDL_SetClipRect = define_c_func(sdl,"+SDL_SetClipRect",{SDL_Surface,SDL_Rect},C_BOOL)

public function SDL_SetClipRect(atom surface,atom rect)
	return c_func(xSDL_SetClipRect,{surface,rect})
end function

export constant xSDL_GetClipRect = define_c_proc(sdl,"+SDL_GetClipRect",{SDL_Surface,C_POINTER})

public procedure SDL_GetClipRect(atom surface,atom rect)
	c_proc(xSDL_GetClipRect,{surface,rect})
end procedure

export constant xSDL_DuplicateSurface = define_c_func(sdl,"+SDL_DuplicateSurface",{SDL_Surface},C_POINTER)

public function SDL_DuplicateSurface(atom surface)
	return c_func(xSDL_DuplicateSurface,{surface})
end function

export constant xSDL_ConvertSurface = define_c_func(sdl,"+SDL_ConvertSurface",{SDL_Surface,SDL_PixelFormat,C_UINT},C_POINTER)

public function SDL_ConvertSurface(atom src,atom fmt,atom flags)
	return c_func(xSDL_ConvertSurface,{src,fmt,flags})
end function

export constant xSDL_ConvertSurfaceFormat = define_c_func(sdl,"+SDL_ConvertSurfaceFormat",{SDL_Surface,C_UINT,C_UINT},C_POINTER)

public function SDL_ConvertSurfaceFormat(atom src,atom format,atom flags)
	return c_func(xSDL_ConvertSurfaceFormat,{src,format,flags})
end function

export constant xSDL_ConvertPixels = define_c_func(sdl,"+SDL_ConvertPixels",{C_INT,C_INT,C_UINT,C_POINTER,C_INT,C_UINT,C_POINTER,C_INT},C_INT)

public function SDL_ConvertPixels(atom w,atom h,atom src_format,atom src,atom src_pitch,atom dst_format,atom dst,atom dst_pitch)
	return c_func(xSDL_ConvertPixels,{w,h,src_format,src,src_pitch,dst_format,dst,dst_pitch})
end function

export constant xSDL_PremultiplyAlpha = define_c_func(sdl,"+SDL_PremultiplyAlpha",{C_INT,C_INT,C_UINT,C_POINTER,C_INT,C_UINT,C_POINTER,C_INT},C_INT)

public function SDL_PremultiplyAlpha(atom w,atom h,atom src_format,atom src,atom src_pitch,atom dst_format,atom dst,atom dst_pitch)
	return c_func(xSDL_PremultiplyAlpha,{w,h,src_format,src,src_pitch,dst_format,dst,dst_pitch})
end function

export constant xSDL_FillRect = define_c_func(sdl,"+SDL_FillRect",{SDL_Surface,SDL_Rect,C_UINT},C_INT)

public function SDL_FillRect(atom dst,atom rect,atom col)
	return c_func(xSDL_FillRect,{dst,rect,col})
end function

export constant xSDL_FillRects = define_c_func(sdl,"+SDL_FillRects",{SDL_Surface,SDL_Rect,C_INT,C_UINT},C_INT)

public function SDL_FillRects(atom dst,atom rects,atom count,atom col)
	return c_func(xSDL_FillRects,{dst,rects,count,col})
end function

export constant xSDL_UpperBlit = define_c_func(sdl,"+SDL_UpperBlit",{SDL_Surface,SDL_Rect,SDL_Surface,SDL_Rect},C_INT)

public function SDL_UpperBlit(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_UpperBlit,{src,srcrect,dst,dstrect})
end function

export constant xSDL_LowerBlit = define_c_func(sdl,"+SDL_LowerBlit",{SDL_Surface,SDL_Rect,SDL_Surface,SDL_Rect},C_INT)

public function SDL_LowerBlit(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_LowerBlit,{src,srcrect,dst,dstrect})
end function

export constant xSDL_SoftStretch = define_c_func(sdl,"+SDL_SoftStretch",{SDL_Surface,SDL_Rect,SDL_Surface,SDL_Rect},C_INT)

public function SDL_SoftStretch(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_SoftStretch,{src,srcrect,dst,dstrect})
end function

export constant xSDL_SoftStretchLinear = define_c_func(sdl,"+SDL_SoftStretchLinear",{SDL_Surface,SDL_Rect,SDL_Surface,SDL_Rect},C_INT)

public function SDL_SoftStretchLinear(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_SoftStretchLinear,{src,srcrect,dst,dstrect})
end function

export constant xSDL_UpperBlitScaled = define_c_func(sdl,"+SDL_UpperBlitScaled",{SDL_Surface,SDL_Rect,SDL_Surface,SDL_Rect},C_INT)

public function SDL_UpperBlitScaled(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_UpperBlitScaled,{src,srcrect,dst,dstrect})
end function

export constant xSDL_LowerBlitScaled = define_c_func(sdl,"+SDL_LowerBlitScaled",{SDL_Surface,SDL_Rect,SDL_Surface,SDL_Rect},C_INT)

public function SDL_LowerBlitScaled(atom src,atom srcrect,atom dst,atom dstrect)
	return c_func(xSDL_LowerBlitScaled,{src,srcrect,dst,dstrect})
end function

export constant xSDL_SetYUVConversionMode = define_c_proc(sdl,"+SDL_SetYUVConversionMode",{C_INT})

public procedure SDL_SetYUVConversionMode(atom mode)
	c_proc(xSDL_SetYUVConversionMode,{mode})
end procedure

export constant xSDL_GetYUVConversionMode = define_c_func(sdl,"+SDL_GetYUVConversionMode",{},C_INT)

public function SDL_GetYUVConversionMode()
	return c_func(xSDL_GetYUVConversionMode,{})
end function

export constant xSDL_GetYUVConversionModeForResolution = define_c_func(sdl,"+SDL_GetYUVConversionModeForResolution",{C_INT,C_INT},C_INT)

public function SDL_GetYUVConversionModeForResolution(atom w,atom h)
	return c_func(xSDL_GetYUVConversionModeForResolution,{w,h})
end function
­262.71