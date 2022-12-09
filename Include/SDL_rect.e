include std/ffi.e
include std/machine.e

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


export constant xSDL_HasIntersection = define_c_func(sdl,"+SDL_HasIntersection",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_HasIntersection(atom a,atom b)
	a = allocate_struct(SDL_Rect)
	b = allocate_struct(SDL_Rect)
	sequence res = peek_struct(a,SDL_Rect)
	sequence res2 = peek_struct(b,SDL_Rect)
	free(a)
	free(b)
	return c_func(xSDL_HasIntersection,{res,res2})
end function

export constant xSDL_IntersectRect = define_c_func(sdl,"+SDL_IntersectRect",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_IntersectRect(atom a,atom b,atom result)
	a = allocate_struct(SDL_Rect)
	b = allocate_struct(SDL_Rect)
	result = allocate_struct(SDL_Rect)
	sequence res = peek_struct(a,SDL_Rect)
	sequence res2 = peek_struct(b,SDL_Rect)
	sequence res3 = peek_struct(result,SDL_Rect)
	free(a)
	free(b)
	free(result)
	return c_func(xSDL_IntersectRect,{res,res2,res3})
end function

export constant xSDL_UnionRect = define_c_proc(sdl,"+SDL_UnionRect",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_UnionRect(atom a,atom b,sequence result)
	a = allocate_struct(SDL_Rect)
	b = allocate_struct(SDL_Rect)
	result = allocate_struct(SDL_Rect)
	sequence res = peek_struct(a,SDL_Rect)
	sequence res2 = peek_struct(b,SDL_Rect)
	sequence res3 = peek_struct(result,SDL_Rect)
	free(a)
	free(b)
	free(result)
	c_proc(xSDL_UnionRect,{res,res2,res3})
end procedure

export constant xSDL_EnclosePoints = define_c_func(sdl,"+SDL_EnclosePoints",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_EnclosePoints(atom points,atom count,atom clip,atom result)
	points = allocate_struct(SDL_Point)
	clip = allocate_struct(SDL_Rect)
	result = allocate_struct(SDL_Rect)
	sequence res = peek_struct(points,SDL_Point)
	sequence res2 = peek_struct(clip,SDL_Rect)
	sequence res3 = peek_struct(result,SDL_Rect)
	free(points)
	free(clip)
	free(result)
	return c_func(xSDL_EnclosePoints,{res,count,res2,res3})
end function

export constant xSDL_IntersectRectAndLine = define_c_func(sdl,"+SDL_IntersectRectAndLine",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_IntersectRectAndLine(atom rect,atom x,atom y,atom x2,atom y2)
	rect = allocate_struct(SDL_Rect)
	sequence res = peek_struct(rect,SDL_Rect)
	free(rect)
	return c_func(xSDL_IntersectRectAndLine,{res,x,y,x2,y2})
end function

public function SDL_PointInFRect(sequence p = SDL_FPoint, sequence r = SDL_FRect)
	return p[1] >= r[1] and p[1] < r[1] + r[3] and p[2] >= r[2] and p[2] < r[2] + r[4]
end function

public function SDL_FRectEmpty(sequence r = SDL_FRect)
	return not r or r[3] <= 0.0 or r[4] <= 0.0
end function

export constant xSDL_HasIntersectionF = define_c_func(sdl,"+SDL_HasIntersectionF",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_HasIntersectionF(atom a,atom b)
	a = allocate_struct(SDL_FRect)
	b = allocate_struct(SDL_FRect)
	sequence res = peek_struct(a,SDL_FRect)
	sequence res2 = peek_struct(b,SDL_FRect)
	free(a)
	free(b)
	return c_func(xSDL_HasIntersectionF,{res,res2})
end function

export constant xSDL_IntersectFRect = define_c_func(sdl,"+SDL_IntersectFRect",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_IntersectFRect(atom a,atom b,atom result)
	a = allocate_struct(SDL_FRect)
	b = allocate_struct(SDL_FRect)
	result = allocate_struct(SDL_FRect)
	sequence res = peek_struct(a,SDL_FRect)
	sequence res2 = peek_struct(b,SDL_FRect)
	sequence res3 = peek_struct(result,SDL_FRect)
	free(a)
	free(b)
	free(result)
	return c_func(xSDL_IntersectFRect,{res,res2,res3})
end function

export constant xSDL_UnionFRect = define_c_proc(sdl,"+SDL_UnionFRect",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_UnionFRect(atom a,atom b,atom result)
	a = allocate_struct(SDL_FRect)
	b = allocate_struct(SDL_FRect)
	result = allocate_struct(SDL_FRect)
	sequence res = peek_struct(a,SDL_FRect)
	sequence res2 = peek_struct(b,SDL_FRect)
	sequence res3 = peek_struct(result,SDL_FRect)
	free(a)
	free(b)
	free(result)
	c_proc(xSDL_UnionFRect,{res,res2,res3})
end procedure

export constant xSDL_EncloseFPoints = define_c_func(sdl,"+SDL_EncloseFPoints",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_BOOL)

public function SDL_EncloseFPoints(atom points,atom count,atom clip,atom result)
	points = allocate_struct(SDL_FPoint)
	clip = allocate_struct(SDL_Rect)
	result = allocate_struct(SDL_Rect)
	sequence res = peek_struct(points,SDL_FPoint)
	sequence res2 = peek_struct(clip,SDL_Rect)
	sequence res3 = peek_struct(result,SDL_Rect)
	free(points)
	free(clip)
	free(result)
	return c_func(xSDL_EncloseFPoints,{res,count,res2,res3})
end function

export constant xSDL_IntersectFRectAndLine = define_c_func(sdl,"+SDL_IntersectFRectAndLine",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_IntersectFRectAndLine(atom rect,atom x,atom y,atom x2,atom y2)
	rect = allocate_struct(SDL_FRect)
	sequence res = peek_struct(rect,SDL_FRect)
	free(rect)
	return c_func(xSDL_IntersectFRectAndLine,{res,x,y,x2,y2})
end function
­154.42