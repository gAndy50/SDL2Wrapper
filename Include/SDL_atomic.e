include std/ffi.e

include sdl.e

export constant xSDL_AtomicTryLock = define_c_func(sdl,"+SDL_AtomicTryLock",{C_POINTER},C_BOOL)

public function SDL_AtomicTryLock(atom lock)
	return c_func(xSDL_AtomicTryLock,{lock})
end function

export constant xSDL_AtomicLock = define_c_proc(sdl,"+SDL_AtomicLock",{C_POINTER})

public procedure SDL_AtomicLock(atom lock)
	c_proc(xSDL_AtomicLock,{lock})
end procedure

export constant xSDL_AtomicUnlock = define_c_proc(sdl,"+SDL_AtomicUnlock",{C_POINTER})

public procedure SDL_AtomicUnlock(atom lock)
	c_proc(xSDL_AtomicUnlock,{lock})
end procedure

export constant xSDL_MemoryBarrierReleaseFunction = define_c_proc(sdl,"+SDL_MemoryBarrierReleaseFunction",{}),
				xSDL_MemoryBarrierAcquireFunction = define_c_proc(sdl,"+SDL_MemoryBarrierAcquireFunction",{})
				
public procedure SDL_MemoryBarrierReleaseFunction()
	c_proc(xSDL_MemoryBarrierReleaseFunction,{})
end procedure

public procedure SDL_MemoryBarrierAcquireFunction()
	c_proc(xSDL_MemoryBarrierAcquireFunction,{})
end procedure

public constant SDL_atomic_t = define_c_struct({
	C_INT --value
})

export constant xSDL_AtomicCAS = define_c_func(sdl,"+SDL_AtomicCAS",{SDL_atomic_t,C_INT,C_INT},C_BOOL)

public function SDL_AtomicCAS(sequence a,atom oldval,atom newval)
	return c_func(xSDL_AtomicCAS,{a,oldval,newval})
end function

export constant xSDL_AtomicSet = define_c_func(sdl,"+SDL_AtomicSet",{SDL_atomic_t,C_INT},C_INT)

public function SDL_AtomicSet(sequence a,atom v)
	return c_func(xSDL_AtomicSet,{a,v})
end function

export constant xSDL_AtomicGet = define_c_func(sdl,"+SDL_AtomicGet",{SDL_atomic_t},C_INT)

public function SDL_AtomicGet(sequence a)
	return c_func(xSDL_AtomicGet,{a})
end function

export constant xSDL_AtomicAdd = define_c_func(sdl,"+SDL_AtomicAdd",{SDL_atomic_t,C_INT},C_INT)

public function SDL_AtomicAdd(sequence a,atom v)
	return c_func(xSDL_AtomicAdd,{a,v})
end function

export constant xSDL_AtomicCASPtr = define_c_func(sdl,"+SDL_AtomicCASPtr",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function SDL_AtomicCASPtr(atom a,atom old,atom new)
	return c_func(xSDL_AtomicCASPtr,{a,old,new})
end function

export constant xSDL_AtomicSetPtr = define_c_func(sdl,"+SDL_AtomicSetPtr",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_AtomicSetPtr(atom a,atom v)
	return c_func(xSDL_AtomicSetPtr,{a,v})
end function

export constant xSDL_AtomicGetPtr = define_c_func(sdl,"+SDL_AtomicGetPtr",{C_POINTER},C_POINTER)

public function SDL_AtomicGetPtr(atom a)
	return c_func(xSDL_AtomicGetPtr,{a})
end function
­34.46