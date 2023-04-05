--SDL TTF Euphoria Wrapper 
--Written by Andy P.
--Icy Viking Games Copyright (c) 2023

without warning

include std/ffi.e
include std/os.e
include std/machine.e

public include sdl.e

atom ttf = 0

ifdef WINDOWS then
	ttf = open_dll("SDL2_ttf.dll")
	elsifdef LINUX or FREEBSD then
	ttf = open_dll("libSDL2_ttf.so")
end ifdef

if ttf = -1 then
	puts(1,"Failed to load TTF!\n")
	abort(0)
end if

public constant SDL_TTF_MAJOR_VERSION = 2,
				SDL_TTF_MINOR_VERSION = 20,
				SDL_TTF_PATCHLEVEL = 1
				
export constant xTTF_Linked_Version = define_c_func(ttf,"+TTF_Linked_Version",{},C_POINTER)

public function TTF_Linked_Version()
	return c_func(xTTF_Linked_Version,{})
end function

export constant xTTF_GetFreeTypeVersion = define_c_proc(ttf,"+TTF_GetFreeTypeVersion",{C_POINTER,C_POINTER,C_POINTER})

public procedure TTF_GetFreeTypeVersion(atom maj,atom min,atom pat)
	c_proc(xTTF_GetFreeTypeVersion,{maj,min,pat})
end procedure

export constant xTTF_GetHarfBuzzVersion = define_c_proc(ttf,"+TTF_GetHarfBuzzVersion",{C_POINTER,C_POINTER,C_POINTER})

public procedure TTF_GetHarfBuzzVersion(atom maj,atom min,atom pat)
	c_proc(xTTF_GetHarfBuzzVersion,{maj,min,pat})
end procedure

public constant UNICODE_BOM_NATIVE = 0xFEFF
public constant UNICODE_BOM_SWAPPED = 0xFFFE

export constant xTTF_ByteSwappedUNICODE = define_c_proc(ttf,"+TTF_ByteSwappedUNICODE",{C_BOOL})

public procedure TTF_ByteSwappedUNICODE(atom swap)
	c_proc(xTTF_ByteSwappedUNICODE,{swap})
end procedure

export constant xTTF_Init = define_c_func(ttf,"+TTF_Init",{},C_INT)

public function TTF_Init()
	return c_func(xTTF_Init,{})
end function

export constant xTTF_OpenFont = define_c_func(ttf,"+TTF_OpenFont",{C_STRING,C_INT},C_POINTER)

public function TTF_OpenFont(sequence file,atom size)
	return c_func(xTTF_OpenFont,{file,size})
end function

export constant xTTF_OpenFontIndex = define_c_func(ttf,"+TTF_OpenFontIndex",{C_STRING,C_INT,C_LONG},C_POINTER)

public function TTF_OpenFontIndex(sequence file,atom size,atom index)
	return c_func(xTTF_OpenFontIndex,{file,size,index})
end function

export constant xTTF_OpenFontRW = define_c_func(ttf,"+TTF_OpenFontRW",{C_POINTER,C_INT,C_INT},C_POINTER)

public function TTF_OpenFontRW(atom src,atom fsrc,atom size)
	return c_func(xTTF_OpenFontRW,{src,fsrc,size})
end function

export constant xTTF_OpenFontIndexRW = define_c_func(ttf,"+TTF_OpenFontIndexRW",{C_POINTER,C_INT,C_INT,C_LONG},C_POINTER)

public function TTF_OpenFontIndexRW(atom src,atom fsrc,atom size,atom index)
	return c_func(xTTF_OpenFontIndexRW,{src,fsrc,size,index})
end function

export constant xTTF_OpenFontDPI = define_c_func(ttf,"+TTF_OpenFontDPI",{C_STRING,C_INT,C_UINT,C_UINT},C_POINTER)

public function TTF_OpenFontDPI(sequence file,atom size,atom hdpi,atom vdpi)
	return c_func(xTTF_OpenFontDPI,{file,size,hdpi,vdpi})
end function

export constant xTTF_OpenFontIndexDPI = define_c_func(ttf,"+TTF_OpenFontIndexDPI",{C_STRING,C_INT,C_LONG,C_UINT,C_UINT},C_POINTER)

public function TTF_OpenFontIndexDPI(sequence file,atom size,atom index,atom hdpi,atom vdpi)
	return c_func(xTTF_OpenFontIndexDPI,{file,size,index,hdpi,vdpi})
end function

export constant xTTF_OpenFontDPIRW = define_c_func(ttf,"+TTF_OpenFontDPIRW",{C_POINTER,C_INT,C_INT,C_UINT,C_UINT},C_POINTER)

public function TTF_OpenFontDPIRW(atom src,atom fsrc,atom hdpi,atom vdpi)
	return c_func(xTTF_OpenFontDPIRW,{src,fsrc,hdpi,vdpi})
end function

export constant xTTF_OpenFontIndexDPIRW = define_c_func(ttf,"+TTF_OpenFontIndexDPIRW",{C_POINTER,C_INT,C_INT,C_LONG,C_UINT,C_UINT},C_POINTER)

public function TTF_OpenFontIndexDPIRW(atom src,atom fsrc,atom size,atom index,atom hdpi,atom vdpi)
	return c_func(xTTF_OpenFontIndexDPIRW,{src,fsrc,size,index,hdpi,vdpi})
end function

export constant xTTF_SetFontSize = define_c_func(ttf,"+TTF_SetFontSize",{C_POINTER,C_INT},C_INT)

public function TTF_SetFontSize(atom font,atom size)
	return c_func(xTTF_SetFontSize,{font,size})
end function

export constant xTTF_SetFontSizeDPI = define_c_func(ttf,"+TTF_SetFontSizeDPI",{C_POINTER,C_INT,C_UINT,C_UINT},C_INT)

public function TTF_SetFontSizeDPI(atom font,atom size,atom hdpi,atom vdpi)
	return c_func(xTTF_SetFontSizeDPI,{font,size,hdpi,vdpi})
end function

public constant TTF_STYLE_NORMAL = 0x00,
				TTF_STYLE_BOLD = 0x01,
				TTF_STYLE_ITALIC = 0x02,
				TTF_STYLE_UNDERLINE = 0x04,
				TTF_STYLE_STRIKETHROUGH = 0x08
				
export constant xTTF_GetFontStyle = define_c_func(ttf,"+TTF_GetFontStyle",{C_POINTER},C_INT)

public function TTF_GetFontStyle(atom font)
	return c_func(xTTF_GetFontStyle,{font})
end function

export constant xTTF_SetFontStyle = define_c_proc(ttf,"+TTF_SetFontStyle",{C_POINTER,C_INT})

public procedure TTF_SetFontStyle(atom font,atom style)
	c_proc(xTTF_SetFontStyle,{font,style})
end procedure

export constant xTTF_GetFontOutline = define_c_func(ttf,"+TTF_GetFontOutline",{C_POINTER},C_INT)

public function TTF_GetFontOutline(atom font)
	return c_func(xTTF_GetFontOutline,{font})
end function

export constant xTTF_SetFontOutline = define_c_proc(ttf,"+TTF_SetFontOutline",{C_POINTER,C_INT})

public procedure TTF_SetFontOutline(atom font,atom ol)
	c_proc(xTTF_SetFontOutline,{font,ol})
end procedure

public constant TTF_HINTING_NORMAL = 0,
				TTF_HINTING_LIGHT = 1,
				TTF_HINTING_MONO = 2,
				TTF_HINTING_NONE = 3,
				TTF_HINTING_LIGHT_SUBPIXEL = 4
				
export constant xTTF_GetFontHinting = define_c_func(ttf,"+TTF_GetFontHinting",{C_POINTER},C_INT)

public function TTF_GetFontHinting(atom font)
	return c_func(xTTF_GetFontHinting,{font})
end function

export constant xTTF_SetFontHinting = define_c_proc(ttf,"+TTF_SetFontHinting",{C_POINTER,C_INT})

public procedure TTF_SetFontHinting(atom font,atom hint)
	c_proc(xTTF_SetFontHinting,{font,hint})
end procedure

public constant TTF_WRAPPED_ALIGN_LEFT = 0,
				TTF_WRAPPED_ALIGN_CENTER = 1,
				TTF_WRAPPED_ALIGN_RIGHT = 2
				
export constant xTTF_GetFontWrappedAlign = define_c_func(ttf,"+TTF_GetFontWrappedAlign",{C_POINTER},C_INT)

public function TTF_GetFontWrappedAlign(atom font)
	return c_func(xTTF_GetFontWrappedAlign,{font})
end function

export constant xTTF_SetFontWrappedAlign = define_c_proc(ttf,"+TTF_SetFontWrappedAlign",{C_POINTER,C_INT})

public procedure TTF_SetFontWrappedAlign(atom font,atom align)
	c_proc(xTTF_SetFontWrappedAlign,{font,align})
end procedure

export constant xTTF_FontHeight = define_c_func(ttf,"+TTF_FontHeight",{C_POINTER},C_INT)

public function TTF_FontHeight(atom font)
	return c_func(xTTF_FontHeight,{font})
end function

export constant xTTF_FontAscent = define_c_func(ttf,"+TTF_FontAscent",{C_POINTER},C_INT)

public function TTF_FontAscent(atom font)
	return c_func(xTTF_FontAscent,{font})
end function

export constant xTTF_FontDescent = define_c_func(ttf,"+TTF_FontDescent",{C_POINTER},C_INT)

public function TTF_FontDescent(atom font)
	return c_func(xTTF_FontDescent,{font})
end function

export constant xTTF_FontLineSkip = define_c_func(ttf,"+TTF_FontLineSkip",{C_POINTER},C_INT)

public function TTF_FontLineSkip(atom font)
	return c_func(xTTF_FontLineSkip,{font})
end function

export constant xTTF_GetFontKerning = define_c_func(ttf,"+TTF_GetFontKerning",{C_POINTER},C_INT)

public function TTF_GetFontKerning(atom font)
	return c_func(xTTF_GetFontKerning,{font})
end function

export constant xTTF_SetFontKerning = define_c_proc(ttf,"+TTF_SetFontKerning",{C_POINTER,C_INT})

public procedure TTF_SetFontKerning(atom font,atom allow)
	c_proc(xTTF_SetFontKerning,{font,allow})
end procedure

export constant xTTF_FontFaces = define_c_func(ttf,"+TTF_FontFaces",{C_POINTER},C_LONG)

public function TTF_FontFaces(atom font)
	return c_func(xTTF_FontFaces,{font})
end function

export constant xTTF_FontFaceIsFixedWidth = define_c_func(ttf,"+TTF_FontFaceIsFixedWidth",{C_POINTER},C_INT)

public function TTF_FontFaceIsFixedWidth(atom font)
	return c_func(xTTF_FontFaceIsFixedWidth,{font})
end function

export constant xTTF_FontFaceFamilyName = define_c_func(ttf,"+TTF_FontFaceFamilyName",{C_POINTER},C_STRING)

public function TTF_FontFaceFamilyName(atom font)
	return c_func(xTTF_FontFaceFamilyName,{font})
end function

export constant xTTF_FontFaceStyleName = define_c_func(ttf,"+TTF_FontFaceStyleName",{C_POINTER},C_STRING)

public function TTF_FontFaceStyleName(atom font)
	return c_func(xTTF_FontFaceStyleName,{font})
end function

export constant xTTF_GlyphIsProvided = define_c_func(ttf,"+TTF_GlyphIsProvided",{C_POINTER,C_UINT16},C_INT)

public function TTF_GlyphIsProvided(atom font,atom ch)
	return c_func(xTTF_GlyphIsProvided,{font,ch})
end function

export constant xTTF_GlyphIsProvided32 = define_c_func(ttf,"+TTF_GlyphIsProvided32",{C_POINTER,C_UINT32},C_INT)

public function TTF_GlyphIsProvided32(atom font,atom ch)
	return c_func(xTTF_GlyphIsProvided32,{font,ch})
end function

export constant xTTF_GlyphMetrics = define_c_func(ttf,"+TTF_GlyphMetrics",{C_POINTER,C_UINT16,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function TTF_GlyphMetrics(atom font,atom ch,atom minx,atom maxx,atom miny,atom maxy,atom adv)
	return c_func(xTTF_GlyphMetrics,{font,ch,minx,maxx,miny,maxy,adv})
end function

export constant xTTF_GlyphMetrics32 = define_c_func(ttf,"+TTF_GlyphMetrics32",{C_POINTER,C_UINT32,C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function TTF_GlyphMetrics32(atom font,atom ch,atom minx,atom maxx,atom miny,atom maxy,atom adv)
	return c_func(xTTF_GlyphMetrics32,{font,ch,minx,maxx,miny,maxy,adv})
end function

export constant xTTF_SizeText = define_c_func(ttf,"+TTF_SizeText",{C_POINTER,C_STRING,C_POINTER,C_POINTER},C_INT)

public function TTF_SizeText(atom font,sequence txt,atom w,atom h)
	return c_func(xTTF_SizeText,{font,txt,w,h})
end function

export constant xTTF_SizeUTF8 = define_c_func(ttf,"+TTF_SizeUTF8",{C_POINTER,C_STRING,C_POINTER,C_POINTER},C_INT)

public function TTF_SizeUTF8(atom font,sequence txt,atom w,atom h)
	return c_func(xTTF_SizeUTF8,{font,txt,w,h})
end function

export constant xTTF_SizeUNICODE = define_c_func(ttf,"+TTF_SizeUNICODE",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function TTF_SizeUNICODE(atom font,object txt,atom w,atom h)
	return c_func(xTTF_SizeUNICODE,{font,txt,w,h})
end function

export constant xTTF_MeasureText = define_c_func(ttf,"+TTF_MeasureText",{C_POINTER,C_STRING,C_INT,C_POINTER,C_POINTER},C_INT)

public function TTF_MeasureText(atom font,sequence txt,atom mw,atom ext,atom cnt)
	return c_func(xTTF_MeasureText,{font,txt,mw,ext,cnt})
end function

export constant xTTF_MeasureUTF8 = define_c_func(ttf,"+TTF_MeasureUTF8",{C_POINTER,C_STRING,C_INT,C_POINTER,C_POINTER},C_INT)

public function TTF_MeasureUTF8(atom font,sequence txt,atom mw,atom ext,atom cnt)
	return c_func(xTTF_MeasureUTF8,{font,txt,mw,ext,cnt})
end function

export constant xTTF_MeasureUNICODE = define_c_func(ttf,"+TTF_MeasureUNICODE",{C_POINTER,C_POINTER,C_INT,C_POINTER,C_POINTER},C_INT)

public function TTF_MeasureUNICODE(atom font,object txt,atom mw,atom ext,atom cnt)
	return c_func(xTTF_MeasureUNICODE,{font,txt,mw,ext,cnt})
end function

export constant xTTF_RenderText_Solid = define_c_func(ttf,"+TTF_RenderText_Solid",{C_POINTER,C_STRING,SDL_Color},C_POINTER)

public function TTF_RenderText_Solid(atom font,sequence text,sequence fg)
	return c_func(xTTF_RenderText_Solid,{font,text,fg})
end function

export constant xTTF_RenderUTF8_Solid = define_c_func(ttf,"+TTF_RenderUTF8_Solid",{C_POINTER,C_STRING,SDL_Color},C_POINTER)

public function TTF_RenderUTF8_Solid(atom font,sequence text,sequence fg)
	return c_func(xTTF_RenderUTF8_Solid,{font,text,fg})
end function

export constant xTTF_RenderUNICODE_Solid = define_c_func(ttf,"+TTF_RenderUNICODE_Solid",{C_POINTER,C_POINTER,SDL_Color},C_POINTER)

public function TTF_RenderUNICODE_Solid(atom font,object text,sequence fg)
	return c_func(xTTF_RenderUNICODE_Solid,{font,text,fg})
end function

export constant xTTF_RenderText_Solid_Wrapped = define_c_func(ttf,"+TTF_RenderText_Solid_Wrapped",{C_POINTER,C_STRING,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderText_Solid_Wrapped(atom font,sequence text,sequence fg,atom wlen)
	return c_func(xTTF_RenderText_Solid_Wrapped,{font,text,fg,wlen})
end function

export constant xTTF_RenderUTF8_Solid_Wrapped = define_c_func(ttf,"+TTF_RenderUTF8_Solid_Wrapped",{C_POINTER,C_STRING,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderUTF8_Solid_Wrapped(atom font,sequence text,sequence fg,atom wlen)
	return c_func(xTTF_RenderUTF8_Solid_Wrapped,{font,text,fg,wlen})
end function

export constant xTTF_RenderUNICODE_Solid_Wrapped = define_c_func(ttf,"+TTF_RenderUNICODE_Solid_Wrapped",{C_POINTER,C_POINTER,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderUNICODE_Solid_Wrapped(atom font,object text,sequence fg,atom wlen)
	return c_func(xTTF_RenderUNICODE_Solid_Wrapped,{font,text,fg,wlen})
end function

export constant xTTF_RenderGlyph_Solid = define_c_func(ttf,"+TTF_RenderGlyph_Solid",{C_POINTER,C_UINT16,SDL_Color},C_POINTER)

public function TTF_RenderGlyph_Solid(atom font,atom ch,sequence fg)
	return c_func(xTTF_RenderGlyph_Solid,{font,ch,fg})
end function

export constant xTTF_RenderGlyph32_Solid = define_c_func(ttf,"+TTF_RenderGlyph32_Solid",{C_POINTER,C_UINT32,SDL_Color},C_POINTER)

public function TTF_RenderGlyph32_Solid(atom font,atom ch,sequence fg)
	return c_func(xTTF_RenderGlyph32_Solid,{font,ch,fg})
end function

export constant xTTF_RenderText_Shaded = define_c_func(ttf,"+TTF_RenderText_Shaded",{C_POINTER,C_STRING,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderText_Shaded(atom font,sequence text,sequence fg,sequence bg)
	return c_func(xTTF_RenderText_Shaded,{font,text,fg,bg})
end function

export constant xTTF_RenderUTF8_Shaded = define_c_func(ttf,"+TTF_RenderUTF8_Shaded",{C_POINTER,C_STRING,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderUTF8_Shaded(atom font,sequence text,sequence fg,sequence bg)
	return c_func(xTTF_RenderUTF8_Shaded,{font,text,fg,bg})
end function

export constant xTTF_RenderUNICODE_Shaded = define_c_func(ttf,"+TTF_RenderUNICODE_Shaded",{C_POINTER,C_POINTER,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderUNICODE_Shaded(atom font,object text,sequence fg,sequence bg)
	return c_func(xTTF_RenderUNICODE_Shaded,{font,text,fg,bg})
end function

export constant xTTF_RenderText_Shaded_Wrapped = define_c_func(ttf,"+TTF_RenderText_Shaded_Wrapped",{C_POINTER,C_STRING,SDL_Color,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderText_Shaded_Wrapped(atom font,sequence text,sequence fg,sequence bg,atom wlen)
	return c_func(xTTF_RenderText_Shaded_Wrapped,{font,text,fg,bg,wlen})
end function

export constant xTTF_RenderUTF8_Shaded_Wrapped = define_c_func(ttf,"+TTF_RenderUTF8_Shaded_Wrapped",{C_POINTER,C_STRING,SDL_Color,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderUTF8_Shaded_Wrapped(atom font,sequence text,sequence fg,sequence bg,atom wlen)
	return c_func(xTTF_RenderUTF8_Shaded_Wrapped,{font,text,fg,bg,wlen})
end function

export constant xTTF_RenderUNICODE_Shaded_Wrapped = define_c_func(ttf,"+TTF_RenderUNICODE_Shaded_Wrapped",{C_POINTER,C_POINTER,SDL_Color,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderUNICODE_Shaded_Wrapped(atom font,object text,sequence fg,sequence bg,atom wlen)
	return c_func(xTTF_RenderUNICODE_Shaded_Wrapped,{font,text,fg,bg,wlen})	
end function

export constant xTTF_RenderGlyph_Shaded = define_c_func(ttf,"+TTF_RenderGlyph_Shaded",{C_POINTER,C_UINT16,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderGlyph_Shaded(atom font,atom ch,sequence fg,sequence bg)
	return c_func(xTTF_RenderGlyph_Shaded,{font,ch,fg,bg})
end function

export constant xTTF_RenderGlyph32_Shaded = define_c_func(ttf,"+TTF_RenderGlyph32_Shaded",{C_POINTER,C_UINT32,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderGlyph32_Shaded(atom font,atom ch,sequence fg,sequence bg)
	return c_func(xTTF_RenderGlyph32_Shaded,{font,ch,fg,bg})
end function

export constant xTTF_RenderText_Blended = define_c_func(ttf,"+TTF_RenderText_Blended",{C_POINTER,C_STRING,SDL_Color},C_POINTER)

public function TTF_RenderText_Blended(atom font,sequence text,sequence fg)
	return c_func(xTTF_RenderText_Blended,{font,text,fg})
end function

export constant xTTF_RenderUTF8_Blended = define_c_func(ttf,"+TTF_RenderUTF8_Blended",{C_POINTER,C_STRING,SDL_Color},C_POINTER)

public function TTF_RenderUTF8_Blended(atom font,sequence text,sequence fg)
	return c_func(xTTF_RenderUTF8_Blended,{font,text,fg})
end function

export constant xTTF_RenderUNICODE_Blended = define_c_func(ttf,"+TTF_RenderUNICODE_Blended",{C_POINTER,C_POINTER,SDL_Color},C_POINTER)

public function TTF_RenderUNICODE_Blended(atom font,atom text,sequence fg)
	return c_func(xTTF_RenderUNICODE_Blended,{font,text,fg})
end function

export constant xTTF_RenderText_Blended_Wrapped = define_c_func(ttf,"+TTF_RenderText_Blended_Wrapped",{C_POINTER,C_STRING,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderText_Blended_Wrapped(atom font,sequence text,sequence fg,atom wlen)
	return c_func(xTTF_RenderText_Blended_Wrapped,{font,text,fg,wlen})
end function

export constant xTTF_RenderUTF8_Blended_Wrapped = define_c_func(ttf,"+TTF_RenderUTF8_Blended_Wrapped",{C_POINTER,C_STRING,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderUTF8_Blended_Wrapped(atom font,sequence text,sequence fg,atom wlen)
	return c_func(xTTF_RenderUTF8_Blended_Wrapped,{font,text,fg,wlen})
end function

export constant xTTF_RenderUNICODE_Blended_Wrapped = define_c_func(ttf,"+TTF_RenderUNICODE_Blended_Wrapped",{C_POINTER,C_POINTER,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderUNICODE_Blended_Wrapped(atom font,object text,sequence fg,atom wlen)
	return c_func(xTTF_RenderUNICODE_Blended_Wrapped,{font,text,fg,wlen})
end function

export constant xTTF_RenderGlyph_Blended = define_c_func(ttf,"+TTF_RenderGlyph_Blended",{C_POINTER,C_UINT16,SDL_Color},C_POINTER)

public function TTF_RenderGlyph_Blended(atom font,atom ch,sequence fg)
	return c_func(xTTF_RenderGlyph_Blended,{font,ch,fg})
end function

export constant xTTF_RenderGlyph32_Blended = define_c_func(ttf,"+TTF_RenderGlyph32_Blended",{C_POINTER,C_UINT32,SDL_Color},C_POINTER)

public function TTF_RenderGlyph32_Blended(atom font,atom ch,sequence fg)
	return c_func(xTTF_RenderGlyph32_Blended,{font,ch,fg})
end function

export constant xTTF_RenderText_LCD = define_c_func(ttf,"+TTF_RenderText_LCD",{C_POINTER,C_STRING,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderText_LCD(atom font,sequence text,sequence fg,sequence bg)
	return c_func(xTTF_RenderText_LCD,{font,text,fg,bg})
end function

export constant xTTF_RenderUTF8_LCD = define_c_func(ttf,"+TTF_RenderUTF8_LCD",{C_POINTER,C_STRING,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderUTF8_LCD(atom font,sequence text,sequence fg,sequence bg)
	return c_func(xTTF_RenderUTF8_LCD,{font,text,fg,bg})
end function

export constant xTTF_RenderUNICODE_LCD = define_c_func(ttf,"+TTF_RenderUNICODE_LCD",{C_POINTER,C_POINTER,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderUNICODE_LCD(atom font,object text,sequence fg,sequence bg)
	return c_func(xTTF_RenderUNICODE_LCD,{font,text,fg,bg})
end function

export constant xTTF_RenderText_LCD_Wrapped = define_c_func(ttf,"+TTF_RenderText_LCD_Wrapped",{C_POINTER,C_STRING,SDL_Color,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderText_LCD_Wrapped(atom font,sequence text,sequence fg,sequence bg,atom wlen)
	return c_func(xTTF_RenderText_LCD_Wrapped,{font,text,fg,bg,wlen})
end function

export constant xTTF_RenderUTF8_LCD_Wrapped = define_c_func(ttf,"+TTF_RenderUTF8_LCD_Wrapped",{C_POINTER,C_STRING,SDL_Color,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderUTF8_LCD_Wrapped(atom font,sequence text,sequence fg,sequence bg,atom wlen)
	return c_func(xTTF_RenderUTF8_LCD_Wrapped,{font,text,fg,bg,wlen})
end function

export constant xTTF_RenderUNICODE_LCD_Wrapped = define_c_func(ttf,"+TTF_RenderUNICODE_LCD_Wrapped",{C_POINTER,C_POINTER,SDL_Color,SDL_Color,C_UINT32},C_POINTER)

public function TTF_RenderUNICODE_LCD_Wrapped(atom font,object text,sequence fg,sequence bg,atom wlen)
	return c_func(xTTF_RenderUNICODE_LCD_Wrapped,{font,text,fg,bg,wlen})
end function

export constant xTTF_RenderGlyph_LCD = define_c_func(ttf,"+TTF_RenderGlyph_LCD",{C_POINTER,C_UINT16,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderGlyph_LCD(atom font,atom ch,sequence fg,sequence bg)
	return c_func(xTTF_RenderGlyph_LCD,{font,ch,fg,bg})
end function

export constant xTTF_RenderGlyph32_LCD = define_c_func(ttf,"+TTF_RenderGlyph32_LCD",{C_POINTER,C_UINT32,SDL_Color,SDL_Color},C_POINTER)

public function TTF_RenderGlyph32_LCD(atom font,atom ch,sequence fg,sequence bg)
	return c_func(xTTF_RenderGlyph32_LCD,{font,ch,fg,bg})
end function

export constant xTTF_CloseFont = define_c_proc(ttf,"+TTF_CloseFont",{C_POINTER})

public procedure TTF_CloseFont(atom font)
	c_proc(xTTF_CloseFont,{font})
end procedure

export constant xTTF_Quit = define_c_proc(ttf,"+TTF_Quit",{})

public procedure TTF_Quit()
	c_proc(xTTF_Quit,{})
end procedure

export constant xTTF_WasInit = define_c_func(ttf,"+TTF_WasInit",{},C_INT)

public function TTF_WasInit()
	return c_func(xTTF_WasInit,{})
end function

export constant xTTF_GetFontKerningSize = define_c_func(ttf,"+TTF_GetFontKerningSize",{C_POINTER,C_INT,C_INT},C_INT)

public function TTF_GetFontKerningSize(atom font,atom prev,atom idx)
	return c_func(xTTF_GetFontKerningSize,{font,prev,idx})
end function

export constant xTTF_GetFontKerningSizeGlyphs = define_c_func(ttf,"+TTF_GetFontKerningSizeGlyphs",{C_POINTER,C_UINT16,C_UINT16},C_INT)

public function TTF_GetFontKerningSizeGlyphs(atom font,atom prev,atom ch)
	return c_func(xTTF_GetFontKerningSizeGlyphs,{font,prev,ch})
end function

export constant xTTF_GetFontKerningSizeGlyphs32 = define_c_func(ttf,"+TTF_GetFontKerningSizeGlyphs32",{C_POINTER,C_UINT32,C_UINT32},C_INT)

public function TTF_GetFontKerningSizeGlyphs32(atom font,atom prev,atom ch)
	return c_func(xTTF_GetFontKerningSizeGlyphs32,{font,prev,ch})
end function

export constant xTTF_SetFontSDF = define_c_func(ttf,"+TTF_SetFontSDF",{C_POINTER,C_BOOL},C_INT)

public function TTF_SetFontSDF(atom font,atom on_off)
	return c_func(xTTF_SetFontSDF,{font,on_off})
end function

export constant xTTF_GetFontSDF = define_c_func(ttf,"+TTF_GetFontSDF",{C_POINTER},C_BOOL)

public function TTF_GetFontSDF(atom font)
	return c_func(xTTF_GetFontSDF,{font})
end function

public enum type TTF_Direction
	TTF_DIRECTION_LTR = 0,
	TTF_DIRECTION_RTL,
	TTF_DIRECTION_TTB,
	TTF_DIRECTION_BTT
end type

export constant xTTF_SetFontDirection = define_c_func(ttf,"+TTF_SetFontDirection",{C_POINTER,C_INT},C_INT)

public function TTF_SetFontDirection(atom font,TTF_Direction xdir)
	return c_func(xTTF_SetFontDirection,{font,xdir})
end function

export constant xTTF_SetFontScriptName = define_c_func(ttf,"+TTF_SetFontScriptName",{C_POINTER,C_STRING},C_INT)

public function TTF_SetFontScriptName(atom font,sequence script)
	return c_func(xTTF_SetFontScriptName,{font,script})
end function
­18.24