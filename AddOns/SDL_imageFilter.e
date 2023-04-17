include std/ffi.e
include SDL_gfx.e

export constant xSDL_imageFilterMMXdetect = define_c_func(gfx,"+SDL_imageFilterMMXdetect",{},C_INT)

public function SDL_imageFilterMMXdetect()
	return c_func(xSDL_imageFilterMMXdetect,{})
end function

export constant xSDL_imageFilterMMXoff = define_c_proc(gfx,"+SDL_imageFilterMMXoff",{}),
				xSDL_imageFilterMMXon = define_c_proc(gfx,"+SDL_imageFilterMMXon",{})
				
public procedure SDL_imageFilterMMXoff()
	c_proc(xSDL_imageFilterMMXoff,{})
end procedure

public procedure SDL_imageFilterMMXon()
	c_proc(xSDL_imageFilterMMXon,{})
end procedure

export constant xSDL_imageFilterAdd = define_c_func(gfx,"+SDL_imageFilterAdd",{C_POINTER,C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_imageFilterAdd(atom src,atom src2,atom dst,atom len)
	return c_func(xSDL_imageFilterAdd,{src,src2,dst,len})
end function

export constant xSDL_imageFilterMean = define_c_func(gfx,"+SDL_imageFilterMean",{C_POINTER,C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_imageFilterMean(atom src,atom src2,atom dst,atom len)
	return c_func(xSDL_imageFilterMean,{src,src2,dst,len})
end function

export constant xSDL_imageFilterAbsDiff = define_c_func(gfx,"+SDL_imageFilterAbsDiff",{C_POINTER,C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_imageFilterAbsDiff(atom src,atom src2,atom dst,atom len)
	return c_func(xSDL_imageFilterAbsDiff,{src,src2,dst,len})
end function

export constant xSDL_imageFilterMult = define_c_func(gfx,"+SDL_imageFilterMult",{C_POINTER,C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_imageFilterMult(atom src,atom src2,atom dst,atom len)
	return c_func(xSDL_imageFilterMult,{src,src2,dst,len})
end function

export constant xSDL_imageFilterMultDivby2 = define_c_func(gfx,"+SDL_imageFilterMultDivby2",{C_POINTER,C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_imageFilterMultDivby2(atom src,atom src2,atom dst,atom len)
	return c_func(xSDL_imageFilterMultDivby2,{src,src2,dst,len})
end function

export constant xSDL_imageFilterMultDivby4 = define_c_func(gfx,"+SDL_imageFilterMultDivby4",{C_POINTER,C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_imageFilterMultDivby4(atom src,atom src2,atom dst,atom len)
	return c_func(xSDL_imageFilterMultDivby4,{src,src2,dst,len})
end function

export constant xSDL_imageFilterBitAnd = define_c_func(gfx,"+SDL_imageFilterAnd",{C_POINTER,C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_imageFilterBitAnd(atom src,atom src2,atom dst,atom len)
	return c_func(xSDL_imageFilterBitAnd,{src,src2,dst,len})
end function

export constant xSDL_imageFilterBitOr = define_c_func(gfx,"+SDL_imageFilterOr",{C_POINTER,C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_imageFilterBitOr(atom src,atom src2,atom dst,atom len)
	return c_func(xSDL_imageFilterBitOr,{src,src2,dst,len})
end function

export constant xSDL_imageFilterBitNegation = define_c_func(gfx,"+SDL_imageFilterNegation",{C_POINTER,C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_imageFilterBitNegation(atom src,atom src2,atom dst,atom len)
	return c_func(xSDL_imageFilterBitNegation,{src,src2,dst,len})
end function

export constant xSDL_imageFilterAddByte = define_c_func(gfx,"+SDL_imageFilterAddByte",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterAddByte(atom src,atom dst,atom len,atom c)
	return c_func(xSDL_imageFilterAddByte,{src,dst,len,c})
end function

export constant xSDL_imageFilterAddUint = define_c_func(gfx,"+SDL_imageFilterAddUint",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterAddUint(atom src,atom dst,atom len,atom c)
	return c_func(xSDL_imageFilterAddUint,{src,dst,len,c})
end function

export constant xSDL_imageFilterAddByteToHalf = define_c_func(gfx,"+SDL_imageFilterAddByteToHalf",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterAddByteToHalf(atom src,atom dst,atom len,atom c)
	return c_func(xSDL_imageFilterAddByteToHalf,{src,dst,len,c})
end function

export constant xSDL_imageFilterSubByte = define_c_func(gfx,"+SDL_imageFilterSubByte",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterSubByte(atom src,atom dst,atom len,atom c)
	return c_func(xSDL_imageFilterSubByte,{src,dst,len,c})
end function

export constant xSDL_imageFilterSubUint = define_c_func(gfx,"+SDL_imageFilterSubUint",{C_POINTER,C_POINTER,C_UINT,C_UINT},C_INT)

public function SDL_imageFilterSubUint(atom src,atom dst,atom len,atom c)
	return c_func(xSDL_imageFilterSubUint,{src,dst,len,c})
end function

export constant xSDL_imageFilterShiftRight = define_c_func(gfx,"+SDL_imageFilterShiftRight",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterShiftRight(atom src,atom dst,atom len,atom c)
	return c_func(xSDL_imageFilterShiftRight,{src,dst,len,c})
end function

export constant xSDL_imageFilterShiftRightUint = define_c_func(gfx,"+SDL_imageFilterShiftRightUint",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterShiftRightUint(atom src,atom dst,atom len,atom c)
	return c_func(xSDL_imageFilterShiftRightUint,{src,dst,len,c})
end function

export constant xSDL_imageFilterMultByByte = define_c_func(gfx,"+SDL_imageFilterMultByByte",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterMultByByte(atom src,atom dst,atom len,atom c)
	return c_func(xSDL_imageFilterMultByByte,{src,dst,len,c})
end function

export constant xSDL_imageFilterShiftRightAndMultByByte = define_c_func(gfx,"+SDL_imageFilterShiftRightAndMultByByte",{C_POINTER,C_POINTER,C_UINT,C_UCHAR,C_UCHAR},C_INT)

public function SDL_imageFilterShiftRightAndMultByByte(atom src,atom dst,atom len,atom n,atom c)
	return c_func(xSDL_imageFilterShiftRightAndMultByByte,{src,dst,len,n,c})
end function

export constant xSDL_imageFilterShiftLeftByte = define_c_func(gfx,"+SDL_imageFilterShiftLeftByte",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterShiftLeftByte(atom src,atom dst,atom len,atom n)
	return c_func(xSDL_imageFilterShiftLeftByte,{src,dst,len,n})
end function

export constant xSDL_imageFilterShiftLeftUint = define_c_func(gfx,"+SDL_imageFilterShiftLeftUint",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterShiftLeftUint(atom src,atom dst,atom len,atom n)
	return c_func(xSDL_imageFilterShiftLeftUint,{src,dst,len,n})
end function

export constant xSDL_imageFilterShiftLeft = define_c_func(gfx,"+SDL_imageFilterShiftLeft",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterShiftLeft(atom src,atom dst,atom len,atom n)
	return c_func(xSDL_imageFilterShiftLeft,{src,dst,len,n})
end function

export constant xSDL_imageFilterBinarizeUsingThreshold = define_c_func(gfx,"+SDL_imageFilterBinarizeUsingThreshold",{C_POINTER,C_POINTER,C_UINT,C_UCHAR},C_INT)

public function SDL_imageFilterBinarizeUsingThreshold(atom src,atom dst,atom len,atom t)
	return c_func(xSDL_imageFilterBinarizeUsingThreshold,{src,dst,len,t})
end function

export constant xSDL_imageFilterClipToRange = define_c_func(gfx,"+SDL_imageFilterClipToRange",{C_POINTER,C_POINTER,C_UINT,C_UCHAR,C_UCHAR},C_INT)

public function SDL_imageFilterClipToRange(atom src,atom dst,atom len,atom min,atom max)
	return c_func(xSDL_imageFilterClipToRange,{src,dst,len,min,max})
end function

export constant xSDL_imageFilterNormalizeLinear = define_c_func(gfx,"+SDL_imageFilterNormalizeLinear",{C_POINTER,C_POINTER,C_UINT,C_INT,C_INT,C_INT,C_INT},C_INT)

public function SDL_imageFilterNormalizeLinear(atom src,atom dst,atom len,atom cmin,atom cmax,atom nmin,atom nmax)
	return c_func(xSDL_imageFilterNormalizeLinear,{src,dst,len,cmin,cmax,nmin,nmax})
end function
­1.0