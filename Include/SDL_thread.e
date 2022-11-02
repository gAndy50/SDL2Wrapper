include std/ffi.e

include SDL_error.e

include sdl.e

public enum type SDL_ThreadPriority
	SDL_THREAD_PRIORITY_LOW = 0,
	SDL_THREAD_PRIORITY_NORMAL,
	SDL_THREAD_PRIORITY_HIGH,
	SDL_THREAD_PRIORITY_TIME_CRITICAL
end type

export constant xSDL_CreateThread = define_c_func(sdl,"+SDL_CreateThread",{C_POINTER,C_STRING,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateThread(atom fn,sequence name,atom data,atom begin,atom xend)
	return c_func(xSDL_CreateThread,{fn,name,data,begin,xend})
end function

export constant xSDL_CreateThreadWithStackSize = define_c_func(sdl,"+SDL_CreateThreadWithStackSize",{C_POINTER,C_STRING,C_SIZE_T,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_CreateThreadWithStackSize(atom fn,sequence name,atom size,atom data,atom begin,atom xend)
	return c_func(xSDL_CreateThreadWithStackSize,{fn,name,size,data,begin,xend})
end function

export constant xSDL_GetThreadName = define_c_func(sdl,"+SDL_GetThreadName",{C_POINTER},C_STRING)

public function SDL_GetThreadName(atom t)
	return c_func(xSDL_GetThreadName,{t})
end function

export constant xSDL_ThreadID = define_c_func(sdl,"+SDL_ThreadID",{},C_LONG)

public function SDL_ThreadID()
	return c_func(xSDL_ThreadID,{})
end function

export constant xSDL_GetThreadID = define_c_func(sdl,"+SDL_GetThreadID",{C_POINTER},C_LONG)

public function SDL_GetThreadID(atom t)
	return c_func(xSDL_GetThreadID,{t})
end function

export constant xSDL_SetThreadPriority = define_c_func(sdl,"+SDL_SetThreadPriority",{C_INT},C_INT)

public function SDL_SetThreadPriority(atom p)
	return c_func(xSDL_SetThreadPriority,{p})
end function

export constant xSDL_WaitThread = define_c_proc(sdl,"+SDL_WaitThread",{C_POINTER,C_POINTER})

public procedure SDL_WaitThread(atom t,atom s)
	c_proc(xSDL_WaitThread,{t,s})
end procedure

export constant xSDL_DetachThread = define_c_proc(sdl,"+SDL_DetachThread",{C_POINTER})

public procedure SDL_DetachThread(atom t)
	c_proc(xSDL_DetachThread,{t})
end procedure

export constant xSDL_TLSCreate = define_c_func(sdl,"+SDL_TLSCreate",{},C_LONG)

public function SDL_TLSCreate()
	return c_func(xSDL_TLSCreate,{})
end function

export constant xSDL_TLSGet = define_c_func(sdl,"+SDL_TLSGet",{C_LONG},C_POINTER)

public function SDL_TLSGet(atom id)
	return c_func(xSDL_TLSGet,{id})
end function

export constant xSDL_TLSSet = define_c_func(sdl,"+SDL_TLSSet",{C_LONG,C_POINTER,C_POINTER},C_INT)

public function SDL_TLSSet(atom id,atom val,atom d)
	return c_func(xSDL_TLSSet,{id,val,d})
end function

export constant xSDL_TLSCleanup = define_c_proc(sdl,"+SDL_TLSCleanup",{})

public procedure SDL_TLSCleanup()
	c_proc(xSDL_TLSCleanup,{})
end procedure
­83.27