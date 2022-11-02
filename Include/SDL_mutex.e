include std/ffi.e

include SDL_error.e

include sdl.e

public constant SDL_MUTEX_TIMEDOUT = 1

export constant xSDL_CreateMutex = define_c_func(sdl,"+SDL_CreateMutex",{},C_POINTER)

public function SDL_CreateMutex()
	return c_func(xSDL_CreateMutex,{})
end function

export constant xSDL_LockMutex = define_c_func(sdl,"+SDL_LockMutex",{C_POINTER},C_INT)

public function SDL_LockMutex(atom mutex)
	return c_func(xSDL_LockMutex,{mutex})
end function

export constant xSDL_TryLockMutex = define_c_func(sdl,"+SDL_TryLockMutex",{C_POINTER},C_INT)

public function SDL_TryLockMutex(atom mutex)
	return c_func(xSDL_TryLockMutex,{mutex})
end function

export constant xSDL_UnlockMutex = define_c_func(sdl,"+SDL_UnlockMutex",{C_POINTER},C_INT)

public function SDL_UnlockMutex(atom mutex)
	return c_func(xSDL_UnlockMutex,{mutex})
end function

export constant xSDL_DestroyMutex = define_c_proc(sdl,"+SDL_DestroyMutex",{C_POINTER})

public procedure SDL_DestroyMutex(atom mutex)
	c_proc(xSDL_DestroyMutex,{mutex})
end procedure

export constant xSDL_CreateSemaphore = define_c_func(sdl,"+SDL_CreateSemaphore",{C_UINT},C_POINTER)

public function SDL_CreateSemaphore(atom iv)
	return c_func(xSDL_CreateSemaphore,{iv})
end function

export constant xSDL_DestroySemaphore = define_c_proc(sdl,"+SDL_DestroySemaphore",{C_POINTER})

public procedure SDL_DestroySemaphore(atom sem)
	c_proc(xSDL_DestroySemaphore,{sem})
end procedure

export constant xSDL_SemWait = define_c_func(sdl,"+SDL_SemWait",{C_POINTER},C_INT)

public function SDL_SemWait(atom sem)
	return c_func(xSDL_SemWait,{sem})
end function

export constant xSDL_SemTryWait = define_c_func(sdl,"+SDL_SemTryWait",{C_POINTER},C_INT)

public function SDL_SemTryWait(atom sem)
	return c_func(xSDL_SemTryWait,{sem})
end function

export constant xSDL_SemWaitTimeout = define_c_func(sdl,"+SDL_SemWaitTimeout",{C_POINTER,C_UINT},C_INT)

public function SDL_SemWaitTimeout(atom sem,atom ms)
	return c_func(xSDL_SemWaitTimeout,{sem,ms})
end function

export constant xSDL_SemPost = define_c_func(sdl,"+SDL_SemPost",{C_POINTER},C_INT)

public function SDL_SemPost(atom sem)
	return c_func(xSDL_SemPost,{sem})
end function

export constant xSDL_SemValue = define_c_func(sdl,"+SDL_SemValue",{C_POINTER},C_UINT)

public function SDL_SemValue(atom sem)
	return c_func(xSDL_SemValue,{sem})
end function

export constant xSDL_CreateCond = define_c_func(sdl,"+SDL_CreateCond",{},C_POINTER)

public function SDL_CreateCond()
	return c_func(xSDL_CreateCond,{})
end function

export constant xSDL_DestroyCond = define_c_proc(sdl,"+SDL_DestroyCond",{C_POINTER})

public procedure SDL_DestroyCond(atom con)
	c_proc(xSDL_DestroyCond,{con})
end procedure

export constant xSDL_CondSignal = define_c_func(sdl,"+SDL_CondSignal",{C_POINTER},C_INT)

public function SDL_CondSignal(atom con)
	return c_func(xSDL_CondSignal,{con})
end function

export constant xSDL_CondBroadcast = define_c_func(sdl,"+SDL_CondBroadcast",{C_POINTER},C_INT)

public function SDL_CondBroadcast(atom con)
	return c_func(xSDL_CondBroadcast,{con})
end function

export constant xSDL_CondWait = define_c_func(sdl,"+SDL_CondWait",{C_POINTER,C_POINTER},C_INT)

public function SDL_CondWait(atom con,atom mutex)
	return c_func(xSDL_CondWait,{con,mutex})
end function

export constant xSDL_CondWaitTimeout = define_c_func(sdl,"+SDL_CondWaitTimeout",{C_POINTER,C_POINTER,C_UINT},C_INT)

public function SDL_CondWaitTimeout(atom con,atom mutex,atom ms)
	return c_func(xSDL_CondWaitTimeout,{con,mutex,ms})
end function
­114.51