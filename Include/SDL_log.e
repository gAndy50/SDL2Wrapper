include std/ffi.e

include sdl.e

public enum type SDL_LogCategory
	SDL_LOG_CATEGORY_APPLICATION = 0,
	SDL_LOG_CATEGORY_ERROR,
	SDL_LOG_CATEGORY_ASSERT,
	SDL_LOG_CATEGORY_SYSTEM,
	SDL_LOG_CATEGORY_AUDIO,
	SDL_LOG_CATEGORY_VIDEO,
	SDL_LOG_CATEGORY_RENDER,
	SDL_LOG_CATEGORY_INPUT,
	SDL_LOG_CATEGORY_TEST,
	--
	SDL_LOG_CATEGORY_RESERVED1,
	SDL_LOG_CATEGORY_RESERVED2,
	SDL_LOG_CATEGORY_RESERVED3,
	SDL_LOG_CATEGORY_RESERVED4,
	SDL_LOG_CATEGORY_RESERVED5,
	SDL_LOG_CATEGORY_RESERVED6,
	SDL_LOG_CATEGORY_RESERVED7,
	SDL_LOG_CATEGORY_RESERVED8,
	SDL_LOG_CATEGORY_RESERVED9,
	SDL_LOG_CATEGORY_RESERVED10,
	--
	SDL_LOG_CATEGORY_CUSTOM
end type

public enum type SDL_LogPriority
	SDL_LOG_PRIORITY_VERBOSE = 1,
	SDL_LOG_PRIORITY_DEBUG,
	SDL_LOG_PRIORITY_INFO,
	SDL_LOG_PRIORITY_WARN,
	SDL_LOG_PRIORITY_ERROR,
	SDL_LOG_PRIORITY_CRITICAL,
	SDL_NUM_LOG_PRIORITIES
end type

export constant xSDL_LogSetAllPriority = define_c_proc(sdl,"+SDL_LogSetAllPriority",{C_INT})

public procedure SDL_LogSetAllPriority(SDL_LogPriority priority)
	c_proc(xSDL_LogSetAllPriority,{priority})
end procedure

export constant xSDL_LogSetPriority = define_c_proc(sdl,"+SDL_LogSetPriority",{C_INT,C_INT})

public procedure SDL_LogSetPriority(atom category,SDL_LogPriority priority)
	c_proc(xSDL_LogSetPriority,{category,priority})
end procedure

export constant xSDL_LogGetPriority = define_c_func(sdl,"+SDL_LogGetPriority",{C_INT},C_INT)

public function SDL_LogGetPriority(atom cat)
	return c_func(xSDL_LogGetPriority,{cat})
end function

export constant xSDL_LogResetPriorities = define_c_proc(sdl,"+SDL_LogResetPriorities",{})

public procedure SDL_LogResetPriorities()
	c_proc(xSDL_LogResetPriorities,{})
end procedure

export constant xSDL_Log = define_c_proc(sdl,"+SDL_Log",{C_STRING})

public procedure SDL_Log(sequence fmt)
	c_proc(xSDL_Log,{fmt})
end procedure

export constant xSDL_LogVerbose = define_c_proc(sdl,"+SDL_LogVerbose",{C_INT,C_STRING})

public procedure SDL_LogVerbose(atom cat,sequence fmt)
	c_proc(xSDL_LogVerbose,{cat,fmt})
end procedure

export constant xSDL_LogDebug = define_c_proc(sdl,"+SDL_LogDebug",{C_INT,C_STRING})

public procedure SDL_LogDebug(atom cat,sequence fmt)
	c_proc(xSDL_LogDebug,{cat,fmt})
end procedure

export constant xSDL_LogInfo = define_c_proc(sdl,"+SDL_LogInfo",{C_INT,C_STRING})

public procedure SDL_LogInfo(atom cat,sequence fmt)
	c_proc(xSDL_LogInfo,{cat,fmt})
end procedure

export constant xSDL_LogWarn = define_c_proc(sdl,"+SDL_LogWarn",{C_INT,C_STRING})

public procedure SDL_LogWarn(atom cat,sequence fmt)
	c_proc(xSDL_LogWarn,{cat,fmt})
end procedure

export constant xSDL_LogError = define_c_proc(sdl,"+SDL_LogError",{C_INT,C_STRING})

public procedure SDL_LogError(atom cat,sequence fmt)
	c_proc(xSDL_LogError,{cat,fmt})
end procedure

export constant xSDL_LogCritical = define_c_proc(sdl,"+SDL_LogCritical",{C_INT,C_STRING})

public procedure SDL_LogCritical(atom cat,sequence fmt)
	c_proc(xSDL_LogCritical,{cat,fmt})
end procedure

export constant xSDL_LogMessage = define_c_proc(sdl,"+SDL_LogMessage",{C_INT,C_INT,C_STRING})

public procedure SDL_LogMessage(atom cat,SDL_LogPriority pri,sequence fmt)
	c_proc(xSDL_LogMessage,{cat,pri,fmt})
end procedure

export constant xSDL_LogMessageV = define_c_proc(sdl,"+SDL_LogMessageV",{C_INT,C_INT,C_STRING,C_INT})

public procedure SDL_LogMessageV(atom cat,SDL_LogPriority pri,sequence fmt,atom ap)
	c_proc(xSDL_LogMessageV,{cat,pri,fmt,ap})
end procedure

export constant xSDL_LogGetOutputFunction = define_c_proc(sdl,"+SDL_LogGetOutputFunction",{C_POINTER,C_POINTER})

public procedure SDL_LogGetOutputFunction(atom cb,atom ud)
	c_proc(xSDL_LogGetOutputFunction,{cb,ud})
end procedure

export constant xSDL_LogSetOutputFunction = define_c_proc(sdl,"+SDL_LogSetOutputFunction",{C_POINTER,C_POINTER})

public procedure SDL_LogSetOutputFunction(atom cb,atom ud)
	c_proc(xSDL_LogSetOutputFunction,{cb,ud})
end procedure
­121.40