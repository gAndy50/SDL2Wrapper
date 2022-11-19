include std/ffi.e

include SDL_endian.e

include sdl.e

public constant SDL_ALPHA_OPAQUE = 255
public constant SDL_ALPHA_TRANSPARENT = 0

public enum type SDL_PixelType
	SDL_PIXELTYPE_UNKNOWN = 0,
	SDL_PIXELTYPE_INDEX1,
	SDL_PIXELTYPE_INDEX4,
	SDL_PIXELTYPE_INDEX8,
	SDL_PIXELTYPE_PACKED8,
	SDL_PIXELTYPE_PACKED16,
	SDL_PIXELTYPE_PACKED32,
	SDL_PIXELTYPE_ARRAYU8,
	SDL_PIXELTYPE_ARRAYU16,
	SDL_PIXELTYPE_ARRAYU32,
	SDL_PIXELTYPE_ARRAYF16,
	SDL_PIXELTYPE_ARRAYF32
end type

public enum type SDL_BitmapOrder
	SDL_BITMAPORDER_NONE = 0,
	SDL_BITMAPORDER_4321,
	SDL_BITMAPORDER_1234
end type

public enum type SDL_PackedOrder
	SDL_PACKEDORDER_NONE = 0,
	SDL_PACKEDORDER_XRGB,
	SDL_PACKEDORDER_RGBX,
	SDL_PACKEDORDER_ARGB,
	SDL_PACKEDORDER_RGBA,
	SDL_PACKEDORDER_XBGR,
	SDL_PACKEDORDER_BGRX,
	SDL_PACKEDORDER_ABGR,
	SDL_PACKEDORDER_BGRA
end type

public enum type SDL_ArrayOrder
	SDL_ARRAYORDER_NONE = 0,
	SDL_ARRAYORDER_RGB,
	SDL_ARRAYORDER_RGBA,
	SDL_ARRAYORDER_ARGB,
	SDL_ARRAYORDER_BGR,
	SDL_ARRAYORDER_BGRA,
	SDL_ARRAYORDER_ABGR
end type

public enum type SDL_PackedLayout
	SDL_PACKEDLAYOUT_NONE = 0,
	SDL_PACKEDLAYOUT_332,
	SDL_PACKEDLAYOUT_4444,
	SDL_PACKEDLAYOUT_1555,
	SDL_PACKEDLAYOUT_5551,
	SDL_PACKEDLAYOUT_565,
	SDL_PACKEDLAYOUT_8888,
	SDL_PACKEDLAYOUT_2101010,
	SDL_PACKEDLAYOUT_1010102
end type

export constant SDL_Color = define_c_type({
	C_UINT, --r
	C_UINT, --g
	C_UINT, --b
	C_UINT --a
})

public constant SDL_Palette = define_c_type({
	C_INT, --ncolors
	SDL_Color, --colors
	C_UINT, --version
	C_INT --refcount
})

export constant SDL_PixelFormat = define_c_type({
	C_UINT, --format
	SDL_Palette, --palette
	C_UINT, --BitsPerPixel
	C_UINT, --BytesPerPixel
	{C_UINT,2}, --padding[2]
	C_UINT, --Rmask
	C_UINT, --Gmask
	C_UINT, --Bmask
	C_UINT, --Amask
	C_UINT, --Rloss
	C_UINT, --Gloss
	C_UINT, --Bloss
	C_UINT, --Aloss
	C_UINT, --Rshift
	C_UINT, --Gshift
	C_UINT, --Bshift
	C_UINT, --Ashift
	C_INT, --refcount
	C_POINTER --next
})

export constant xSDL_GetPixelFormatName = define_c_func(sdl,"+SDL_GetPixelFormatName",{C_UINT},C_STRING)

public function SDL_GetPixelFormatName(atom format)
	return c_func(xSDL_GetPixelFormatName,{format})
end function

export constant xSDL_PixelFormatEnumToMasks = define_c_func(sdl,"+SDL_PixelFormatEnumToMasks",{C_UINT,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_PixelFormatEnumToMasks(atom format,atom bpp,atom r,atom g,atom b,atom a)
	return c_func(xSDL_PixelFormatEnumToMasks,{format,bpp,r,g,b,a})
end function

export constant xSDL_MasksToPixelFormatEnum = define_c_func(sdl,"+SDL_MasksToPixelFormatEnum",{C_INT,C_UINT,C_UINT,C_UINT,C_UINT},C_UINT)

public function SDL_MasksToPixelFormatEnum(atom bpp,atom r,atom g,atom b,atom a)
	return c_func(xSDL_MasksToPixelFormatEnum,{bpp,r,g,b,a})
end function

export constant xSDL_AllocFormat = define_c_func(sdl,"+SDL_AllocFormat",{C_UINT},SDL_PixelFormat)

public function SDL_AllocFormat(atom pixel_format)
	return c_func(xSDL_AllocFormat,{pixel_format})
end function

export constant xSDL_FreeFormat = define_c_proc(sdl,"+SDL_FreeFormat",{SDL_PixelFormat})

public procedure SDL_FreeFormat(atom format)
	c_proc(xSDL_FreeFormat,{format})
end procedure

export constant xSDL_AllocPalette = define_c_func(sdl,"+SDL_AllocPalette",{C_INT},SDL_Palette)

public function SDL_AllocPalette(atom ncolors)
	return c_func(xSDL_AllocPalette,{ncolors})
end function

export constant xSDL_SetPixelFormatPalette = define_c_func(sdl,"+SDL_SetPixelFormatPalette",{SDL_PixelFormat,SDL_Palette},C_INT)

public function SDL_SetPixelFormatPalette(atom format,atom palette)
	return c_func(xSDL_SetPixelFormatPalette,{format,palette})
end function

export constant xSDL_SetPaletteColors = define_c_func(sdl,"+SDL_SetPaletteColors",{SDL_Palette,SDL_Color,C_INT,C_INT},C_INT)

public function SDL_SetPaletteColors(atom palette,atom colors,atom first,atom ncol)
	return c_func(xSDL_SetPaletteColors,{palette,colors,first,ncol})
end function

export constant xSDL_FreePalette = define_c_proc(sdl,"+SDL_FreePalette",{SDL_Palette})

public procedure SDL_FreePalette(atom pal)
	c_proc(xSDL_FreePalette,{pal})
end procedure

export constant xSDL_MapRGB = define_c_func(sdl,"+SDL_MapRGB",{SDL_PixelFormat,C_UINT,C_UINT,C_UINT},C_UINT)

public function SDL_MapRGB(atom format,atom r,atom g,atom b)
	return c_func(xSDL_MapRGB,{format,r,g,b})
end function

export constant xSDL_MapRGBA = define_c_func(sdl,"+SDL_MapRGBA",{SDL_PixelFormat,C_UINT,C_UINT,C_UINT,C_UINT},C_UINT)

public function SDL_MapRGBA(atom format,atom r,atom g,atom b,atom a)
	return c_func(xSDL_MapRGBA,{format,r,g,b,a})
end function

export constant xSDL_GetRGB = define_c_proc(sdl,"+SDL_GetRGB",{C_UINT,SDL_PixelFormat,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetRGB(atom pixel,atom format,atom r,atom g,atom b)
	c_proc(xSDL_GetRGB,{pixel,format,r,g,b})
end procedure

export constant xSDL_GetRGBA = define_c_proc(sdl,"+SDL_GetRGBA",{C_UINT,SDL_PixelFormat,C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetRGBA(atom pixel,atom format,atom r,atom g,atom b,atom a)
	c_proc(xSDL_GetRGBA,{pixel,format,r,g,b,a})
end procedure

export constant xSDL_CalculateGammaRamp = define_c_proc(sdl,"+SDL_CalculateGammaRamp",{C_FLOAT,C_POINTER})

public procedure SDL_CalculateGammaRamp(atom gamma,atom ramp)
	c_proc(xSDL_CalculateGammaRamp,{gamma,ramp})
end procedure
­175.44