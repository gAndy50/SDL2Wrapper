-------------------------------------
--EuSDL2						   --
--Written by Andy P. (Icy_Viking)  --
--SDL Ver: 2.30.10				   --
--Euphoria Ver: 4.1.0 Beta 2	   --
--Using FFI for Euphoria		   --
--Icy Viking Games				   --
-------------------------------------

without warning

include std/machine.e
include std/ffi.e --replaces std/dll.e
include std/os.e 
include std/math.e --for or_all({}) function

public atom sdl = 0

--Load shared library for OS
ifdef WINDOWS then
	sdl = open_dll("SDL2.dll")
	elsifdef LINUX or FREEBSD then
	sdl = open_dll("libSDL2.so")
end ifdef

if sdl = -1 then
	puts(1,"Failed to init SDL!\n")
	abort(0)
end if

--printf(1,"SDL: %d",{sdl})

--SDL include files
public include SDL_assert.e
public include SDL_atomic.e
public include SDL_audio.e
public include SDL_clipboard.e
public include SDL_cpuinfo.e
public include SDL_endian.e
public include SDL_error.e
public include SDL_events.e
public include SDL_filesystem.e
public include SDL_gamecontroller.e
public include SDL_guid.e
public include SDL_haptic.e
public include SDL_hidapi.e
--public include SDL_hints.e
public include SDL_joystick.e
public include SDL_loadso.e
public include SDL_log.e
public include SDL_messagebox.e
public include SDL_metal.e
public include SDL_mutex.e
public include SDL_power.e
public include SDL_pixels.e
public include SDL_surface.e
public include SDL_render.e
public include SDL_rwops.e
public include SDL_shape.e
--public include SDL_system.e
public include SDL_thread.e
public include SDL_timer.e
public include SDL_version.e
public include SDL_video.e
public include SDL_locale.e
public include SDL_misc.e
public include SDL_rect.e
public include SDL_platform.e
public include SDL_hints.e
public include SDL_scancode.e 
public include SDL_keyboard.e 

--SDL Init Flags

public constant SDL_INIT_TIMER = 0x00000001,
				SDL_INIT_AUDIO = 0x00000010,
				SDL_INIT_VIDEO = 0x00000020,
				SDL_INIT_JOYSTICK = 0x00000200,
				SDL_INIT_HAPTIC = 0x00001000,
				SDL_INIT_GAMECONTROLLER = 0x00002000,
				SDL_INIT_EVENTS = 0x00004000,
				SDL_INIT_SENSOR = 0x00008000,
				SDL_INIT_NOPARACHUTE = 0x00100000
				
public constant SDL_INIT_EVERYTHING = or_all({SDL_INIT_TIMER,SDL_INIT_AUDIO,SDL_INIT_VIDEO,SDL_INIT_EVENTS,
									SDL_INIT_JOYSTICK,SDL_INIT_HAPTIC,
									SDL_INIT_GAMECONTROLLER,SDL_INIT_SENSOR})
									
export constant xSDL_Init = define_c_func(sdl,"+SDL_Init",{C_UINT},C_INT)

public function SDL_Init(atom flags)
	return c_func(xSDL_Init,{flags})
end function

export constant xSDL_InitSubSystem = define_c_func(sdl,"+SDL_InitSubSystem",{C_UINT},C_INT)

public function SDL_InitSubSystem(atom flags)
	return c_func(xSDL_InitSubSystem,{flags})
end function

export constant xSDL_QuitSubSystem = define_c_proc(sdl,"+SDL_QuitSubSystm",{C_UINT})

public procedure SDL_QuitSubSystem(atom flags)
	c_proc(xSDL_QuitSubSystem,{flags})
end procedure

export constant xSDL_WasInit = define_c_func(sdl,"+SDL_WasInit",{C_UINT},C_UINT)

public function SDL_WasInit(atom flags)
	return c_func(xSDL_WasInit,{flags})
end function

export constant xSDL_Quit = define_c_proc(sdl,"+SDL_Quit",{})

public procedure SDL_Quit()
	c_proc(xSDL_Quit,{})
end procedure
­31.2
