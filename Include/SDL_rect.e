include std/ffi.e

include sdl.e

public constant SDL_Point = define_c_type({
	C_INT, --x
	C_INT --y
})

public constant SDL_FPoint = define_c_type({
	C_FLOAT, --x
	C_FLOAT --y
})

public constant SDL_Rect = define_c_type({
	C_INT, --x
	C_INT, --y
	C_INT, --w
	C_INT --h
})

public constant SDL_FRect = define_c_type({
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --w
	C_FLOAT --h
})

public function SDL_PointInRect(sequence p = SDL_Point, sequence r = SDL_Rect)
	--p[1] is x, p[2] is y
	--r[1] is, r[2] is y, r[3] is w, r[4] is h
	return p[1] >= r[1] and p[1] < r[1] + r[4] and p[2] >= r[2] and p[2] < r[2] + r[4]
end function

public function SDL_RectEmpty(sequence r = SDL_Rect)
	return not r or r[3] <= 0 or r[4] <= 0
end function

public function SDL_RectEquals(sequence a = SDL_Rect, sequence b = SDL_Rect)
	return a and b and a[1] = b[1] and a[2] = b[2] and a[3] = b[3] and a[4] = b[4]
end function


export constant xSDL_HasIntersection = define_c_func(sdl,"+SDL_HasIntersection",{SDL_Rect,SDL_Rect},C_BOOL)

public function SDL_HasIntersection(atom a,atom b)
	return c_func(xSDL_HasIntersection,{a,b})
end function

export constant xSDL_IntersectRect = define_c_func(sdl,"+SDL_IntersectRect",{SDL_Rect,SDL_Rect,SDL_Rect},C_BOOL)

public function SDL_IntersectRect(atom a,atom b,atom result)
	return c_func(xSDL_IntersectRect,{a,b,result})
end function

export constant xSDL_UnionRect = define_c_proc(sdl,"+SDL_UnionRect",{SDL_Rect,SDL_Rect,SDL_Rect})

public procedure SDL_UnionRect(atom a,atom b,sequence result)
	c_proc(xSDL_UnionRect,{a,b,result})
end procedure

export constant xSDL_EnclosePoints = define_c_func(sdl,"+SDL_EnclosePoints",{SDL_Rect,C_INT,SDL_Rect,SDL_Rect},C_BOOL)

public function SDL_EnclosePoints(atom points,atom count,atom clip,atom result)
	return c_func(xSDL_EnclosePoints,{points,count,clip,result})
end function

export constant xSDL_IntersectRectAndLine = define_c_func(sdl,"+SDL_IntersectRectAndLine",{SDL_Rect,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_IntersectRectAndLine(atom rect,atom x,atom y,atom x2,atom y2)
	return c_func(xSDL_IntersectRectAndLine,{rect,x,y,x2,y2})
end function

public function SDL_PointInFRect(sequence p = SDL_FPoint, sequence r = SDL_FRect)
	return p[1] >= r[1] and p[1] < r[1] + r[3] and p[2] >= r[2] and p[2] < r[2] + r[4]
end function

public function SDL_FRectEmpty(sequence r = SDL_FRect)
	return not r or r[3] <= 0.0 or r[4] <= 0.0
end function

export constant xSDL_HasIntersectionF = define_c_func(sdl,"+SDL_HasIntersectionF",{SDL_FRect,SDL_FRect},C_BOOL)

public function SDL_HasIntersectionF(atom a,atom b)
	return c_func(xSDL_HasIntersectionF,{a,b})
end function

export constant xSDL_IntersectFRect = define_c_func(sdl,"+SDL_IntersectFRect",{SDL_FRect,SDL_FRect,SDL_FRect},C_BOOL)

public function SDL_IntersectFRect(atom a,atom b,atom result)
	return c_func(xSDL_IntersectFRect,{a,b,result})
end function

export constant xSDL_UnionFRect = define_c_proc(sdl,"+SDL_UnionFRect",{SDL_FRect,SDL_FRect,SDL_FRect})

public procedure SDL_UnionFRect(atom a,atom b,atom result)
	c_proc(xSDL_UnionFRect,{a,b,result})
end procedure

export constant xSDL_EncloseFPoints = define_c_func(sdl,"+SDL_EncloseFPoints",{SDL_FRect,C_INT,SDL_FRect,SDL_FRect},C_BOOL)

public function SDL_EncloseFPoints(atom points,atom count,atom clip,atom result)
	return c_func(xSDL_EncloseFPoints,{points,count,clip,result})
end function

export constant xSDL_IntersectFRectAndLine = define_c_func(sdl,"+SDL_IntersectFRectAndLine",{SDL_FRect,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_IntersectFRectAndLine(atom rect,atom x,atom y,atom x2,atom y2)
	return c_func(xSDL_IntersectFRectAndLine,{rect,x,y,x2,y2})
end function
­108.46