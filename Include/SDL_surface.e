include std/ffi.e
include std/machine.e

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
	C_UINT32, --flags
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

export constant xSDL_CreateSurface = define_c_func(sdl,"+SDL_CreateSurface",{C_INT,C_INT,C_UINT32},C_POINTER)

public function SDL_CreateSurface(atom w,atom h,atom format)
	return c_func(xSDL_CreateSurface,{w,h,format})
end function

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

export constant xSDL_FreeSurface = define_c_proc(sdl,"+SDL_FreeSurface",{C_POINTER})

public procedure SDL_FreeSurface(atom surface)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	c_proc(xSDL_FreeSurface,{res})
end procedure

export constant xSDL_SetSurfacePalette = define_c_func(sdl,"+SDL_SetSurfacePalette",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetSurfacePalette(atom surface,atom palette)
	surface = allocate_struct(SDL_Surface)
	palette = allocate_struct(SDL_Palette)
	sequence res = peek_struct(surface,SDL_Surface)
	sequence res2 = peek_struct(palette,SDL_Palette)
	free(surface)
	free(palette)
	return c_func(xSDL_SetSurfacePalette,{res,res2})
end function

export constant xSDL_LockSurface = define_c_func(sdl,"+SDL_LockSurface",{C_POINTER},C_INT)

public function SDL_LockSurface(atom surface)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_LockSurface,{res})
end function

export constant xSDL_UnlockSurface = define_c_proc(sdl,"+SDL_UnlockSurface",{C_POINTER})

public procedure SDL_UnlockSurface(atom surface)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	c_proc(xSDL_UnlockSurface,{res})
end procedure

export constant xSDL_LoadBMP_RW = define_c_func(sdl,"+SDL_LoadBMP_RW",{C_POINTER,C_INT},C_POINTER)

public function SDL_LoadBMP_RW(atom src,atom freesrc)
	return c_func(xSDL_LoadBMP_RW,{src,freesrc})
end function

export constant xSDL_LoadBMP = define_c_func(sdl,"+SDL_LoadBMP",{C_POINTER},C_POINTER)

public function SDL_LoadBMP(sequence file)
	return SDL_LoadBMP_RW(SDL_RWFromFile(file,"rb"),1)
end function

export constant xSDL_SaveBMP_RW = define_c_func(sdl,"+SDL_SaveBMP_RW",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_SaveBMP_RW(atom surface,atom dst,atom freedst)
	return c_func(xSDL_SaveBMP_RW,{surface,dst,freedst})
end function

export constant xSDL_SaveBMP = define_c_func(sdl,"+SDL_SaveBMP",{C_POINTER},C_POINTER)

public function SDL_SaveBMP(atom surf,sequence file)
	return SDL_SaveBMP_RW(surf, SDL_RWFromFile(file,"wb"),1)
end function

export constant xSDL_SetSurfaceRLE = define_c_func(sdl,"+SDL_SetSurfaceRLE",{C_POINTER,C_INT},C_INT)

public function SDL_SetSurfaceRLE(atom surface,atom flag)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_SetSurfaceRLE,{res,flag})
end function

export constant xSDL_HasSurfaceRLE = define_c_func(sdl,"+SDL_HasSurfaceRLE",{C_POINTER},C_BOOL)

public function SDL_HasSurfaceRLE(atom surface)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_HasSurfaceRLE,{res})
end function

export constant xSDL_SetColorKey = define_c_func(sdl,"+SDL_SetColorKey",{C_POINTER,C_INT,C_UINT},C_INT)

public function SDL_SetColorKey(atom surface,atom flag,atom key)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_SetColorKey,{res,flag,key})
end function

export constant xSDL_HasColorKey = define_c_func(sdl,"+SDL_HasColorKey",{C_POINTER},C_BOOL)

public function SDL_HasColorKey(atom surface)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_HasColorKey,{res})
end function

export constant xSDL_GetColorKey = define_c_func(sdl,"+SDL_GetColorKey",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetColorKey(atom surface,atom key)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_GetColorKey,{res,key})
end function

export constant xSDL_SetSurfaceColorMod = define_c_func(sdl,"+SDL_SetSurfaceColorMod",{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_SetSurfaceColorMod(atom surface,atom r,atom g,atom b)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_SetSurfaceColorMod,{res,r,g,b})
end function

export constant xSDL_GetSurfaceColorMod = define_c_func(sdl,"+SDL_GetSurfaceColorMod",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetSurfaceColorMod(atom surface,atom r,atom g,atom b)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_GetSurfaceColorMod,{res,r,g,b})
end function

export constant xSDL_SetSurfaceAlphaMod = define_c_func(sdl,"+SDL_SetSurfaceAlphaMod",{C_POINTER,C_UINT},C_INT)

public function SDL_SetSurfaceAlphaMod(atom surface,atom alpha)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_SetSurfaceAlphaMod,{res,alpha})
end function

export constant xSDL_GetSurfaceAlphaMod = define_c_func(sdl,"+SDL_GetSurfaceAlphaMod",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetSurfaceAlphaMod(atom surface,atom alpha)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_GetSurfaceAlphaMod,{res,alpha})
end function

export constant xSDL_SetSurfaceBlendMode = define_c_func(sdl,"+SDL_SetSurfaceBlendMode",{C_POINTER,C_INT},C_INT)

public function SDL_SetSurfaceBlendMode(atom surface,atom mode)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_SetSurfaceBlendMode,{res,mode})
end function

export constant xSDL_GetSurfaceBlendMode = define_c_func(sdl,"+SDL_GetSurfaceBlendMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetSurfaceBlendMode(atom surface,atom mode)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_GetSurfaceBlendMode,{res,mode})	
end function

export constant xSDL_SetClipRect = define_c_func(sdl,"+SDL_SetClipRect",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_SetClipRect(atom surface,atom rect)
	surface = allocate_struct(SDL_Surface)
	rect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(surface,SDL_Surface)
	sequence res2 = peek_struct(rect,SDL_Rect)
	free(surface)
	free(rect)
	return c_func(xSDL_SetClipRect,{res,res2})
end function

export constant xSDL_GetClipRect = define_c_proc(sdl,"+SDL_GetClipRect",{C_POINTER,C_POINTER})

public procedure SDL_GetClipRect(atom surface,atom rect)
	surface = allocate_struct(SDL_Surface)
	rect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(surface,SDL_Surface)
	sequence res2 = peek_struct(rect,SDL_Rect)
	free(surface)
	free(rect)
	c_proc(xSDL_GetClipRect,{res,res2})
end procedure

export constant xSDL_DuplicateSurface = define_c_func(sdl,"+SDL_DuplicateSurface",{C_POINTER},C_POINTER)

public function SDL_DuplicateSurface(atom surface)
	surface = allocate_struct(SDL_Surface)
	sequence res = peek_struct(surface,SDL_Surface)
	free(surface)
	return c_func(xSDL_DuplicateSurface,{res})
end function

export constant xSDL_ConvertSurface = define_c_func(sdl,"+SDL_ConvertSurface",{C_POINTER,C_POINTER,C_UINT},C_POINTER)

public function SDL_ConvertSurface(atom src,atom fmt,atom flags)
	src = allocate_struct(SDL_Surface)
	fmt = allocate_struct(SDL_PixelFormat)
	sequence res = peek_struct(src,SDL_Surface)
	sequence res2 = peek_struct(fmt,SDL_PixelFormat)
	free(src)
	free(fmt)
	return c_func(xSDL_ConvertSurface,{res,res2,flags})
end function

export constant xSDL_ConvertSurfaceFormat = define_c_func(sdl,"+SDL_ConvertSurfaceFormat",{C_POINTER,C_UINT,C_UINT},C_POINTER)

public function SDL_ConvertSurfaceFormat(atom src,atom format,atom flags)
	src = allocate_struct(SDL_Surface)
	sequence res = peek_struct(src,SDL_Surface)
	free(src)
	return c_func(xSDL_ConvertSurfaceFormat,{res,format,flags})
end function

export constant xSDL_ConvertPixels = define_c_func(sdl,"+SDL_ConvertPixels",{C_INT,C_INT,C_UINT,C_POINTER,C_INT,C_UINT,C_POINTER,C_INT},C_INT)

public function SDL_ConvertPixels(atom w,atom h,atom src_format,atom src,atom src_pitch,atom dst_format,atom dst,atom dst_pitch)
	return c_func(xSDL_ConvertPixels,{w,h,src_format,src,src_pitch,dst_format,dst,dst_pitch})
end function

export constant xSDL_PremultiplyAlpha = define_c_func(sdl,"+SDL_PremultiplyAlpha",{C_INT,C_INT,C_UINT,C_POINTER,C_INT,C_UINT,C_POINTER,C_INT},C_INT)

public function SDL_PremultiplyAlpha(atom w,atom h,atom src_format,atom src,atom src_pitch,atom dst_format,atom dst,atom dst_pitch)
	return c_func(xSDL_PremultiplyAlpha,{w,h,src_format,src,src_pitch,dst_format,dst,dst_pitch})
end function

export constant xSDL_FillRect = define_c_func(sdl,"+SDL_FillRect",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_FillRect(atom dst,atom rect,atom col)
	dst = allocate_struct(SDL_Surface)
	rect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(dst,SDL_Surface)
	sequence res2 = peek_struct(rect,SDL_Rect)
	free(dst)
	free(rect)
	return c_func(xSDL_FillRect,{res,res2,col})
end function

export constant xSDL_FillRects = define_c_func(sdl,"+SDL_FillRects",{C_POINTER,C_POINTER,C_INT,C_UINT},C_INT)

public function SDL_FillRects(atom dst,atom rects,atom count,atom col)
	dst = allocate_struct(SDL_Surface)
	rects = allocate_struct(SDL_Rect)
	sequence res = peek_struct(dst,SDL_Surface)
	sequence res2 = peek_struct(rects,SDL_Rect)
	free(dst)
	free(rects)
	return c_func(xSDL_FillRects,{res,res2,count,col})
end function

export constant xSDL_UpperBlit = define_c_func(sdl,"+SDL_UpperBlit",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_UpperBlit(atom src,atom srcrect,atom dst,atom dstrect)
	src = allocate_struct(SDL_Surface)
	srcrect = allocate_struct(SDL_Rect)
	dst = allocate_struct(SDL_Surface)
	dstrect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(src,SDL_Surface)
	sequence res2 = peek_struct(srcrect,SDL_Rect)
	sequence res3 = peek_struct(dst,SDL_Surface)
	sequence res4 = peek_struct(dstrect,SDL_Rect)
	free(src)
	free(srcrect)
	free(dst)
	free(dstrect)
	return c_func(xSDL_UpperBlit,{res,res2,res3,res4})
end function

export constant xSDL_LowerBlit = define_c_func(sdl,"+SDL_LowerBlit",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_LowerBlit(atom src,atom srcrect,atom dst,atom dstrect)
	src = allocate_struct(SDL_Surface)
	srcrect = allocate_struct(SDL_Rect)
	dst = allocate_struct(SDL_Surface)
	dstrect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(src,SDL_Surface)
	sequence res2 = peek_struct(srcrect,SDL_Rect)
	sequence res3 = peek_struct(dst,SDL_Surface)
	sequence res4 = peek_struct(dstrect,SDL_Rect)
	free(src)
	free(srcrect)
	free(dst)
	free(dstrect)
	return c_func(xSDL_LowerBlit,{res,res2,res3,res4})
end function

export constant xSDL_SoftStretch = define_c_func(sdl,"+SDL_SoftStretch",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SoftStretch(atom src,atom srcrect,atom dst,atom dstrect)
	src = allocate_struct(SDL_Surface)
	srcrect = allocate_struct(SDL_Rect)
	dst = allocate_struct(SDL_Surface)
	dstrect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(src,SDL_Surface)
	sequence res2 = peek_struct(srcrect,SDL_Rect)
	sequence res3 = peek_struct(dst,SDL_Surface)
	sequence res4 = peek_struct(dstrect,SDL_Rect)
	free(src)
	free(srcrect)
	free(dst)
	free(dstrect)
	return c_func(xSDL_SoftStretch,{res,res2,res3,res4})
end function

export constant xSDL_SoftStretchLinear = define_c_func(sdl,"+SDL_SoftStretchLinear",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SoftStretchLinear(atom src,atom srcrect,atom dst,atom dstrect)
		src = allocate_struct(SDL_Surface)
	srcrect = allocate_struct(SDL_Rect)
	dst = allocate_struct(SDL_Surface)
	dstrect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(src,SDL_Surface)
	sequence res2 = peek_struct(srcrect,SDL_Rect)
	sequence res3 = peek_struct(dst,SDL_Surface)
	sequence res4 = peek_struct(dstrect,SDL_Rect)
	free(src)
	free(srcrect)
	free(dst)
	free(dstrect)
	return c_func(xSDL_SoftStretchLinear,{res,res2,res3,res4})
end function

export constant xSDL_UpperBlitScaled = define_c_func(sdl,"+SDL_UpperBlitScaled",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_UpperBlitScaled(atom src,atom srcrect,atom dst,atom dstrect)
		src = allocate_struct(SDL_Surface)
	srcrect = allocate_struct(SDL_Rect)
	dst = allocate_struct(SDL_Surface)
	dstrect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(src,SDL_Surface)
	sequence res2 = peek_struct(srcrect,SDL_Rect)
	sequence res3 = peek_struct(dst,SDL_Surface)
	sequence res4 = peek_struct(dstrect,SDL_Rect)
	free(src)
	free(srcrect)
	free(dst)
	free(dstrect)
	return c_func(xSDL_UpperBlitScaled,{res,res2,res3,res4})
end function

export constant xSDL_LowerBlitScaled = define_c_func(sdl,"+SDL_LowerBlitScaled",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_LowerBlitScaled(atom src,atom srcrect,atom dst,atom dstrect)
		src = allocate_struct(SDL_Surface)
	srcrect = allocate_struct(SDL_Rect)
	dst = allocate_struct(SDL_Surface)
	dstrect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(src,SDL_Surface)
	sequence res2 = peek_struct(srcrect,SDL_Rect)
	sequence res3 = peek_struct(dst,SDL_Surface)
	sequence res4 = peek_struct(dstrect,SDL_Rect)
	free(src)
	free(srcrect)
	free(dst)
	free(dstrect)
	return c_func(xSDL_LowerBlitScaled,{res,res2,res3,res4})
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
­426.55