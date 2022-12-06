include std/ffi.e
include std/machine.e
include std/math.e

include SDL_error.e
include SDL_video.e
include SDL_keyboard.e
include SDL_mouse.e
include SDL_joystick.e
include SDL_gamecontroller.e
include SDL_gesture.e
include SDL_touch.e

include sdl.e

public constant SDL_RELEASED = 0
public constant SDL_PRESSED = 1

public enum type SDL_EventType
	SDL_FIRSTEVENT     = 0,    -- /**< Unused (do not remove) */

   
    SDL_QUIT           = 0x100, --/**< User-requested quit */

    --/* These application events have special meaning on iOS, see README-ios.md for details */
    SDL_APP_TERMINATING,       -- /**< The application is being terminated by the OS
                                --     Called on iOS in applicationWillTerminate()
                                --     Called on Android in onDestroy()
                               -- */
    SDL_APP_LOWMEMORY,         -- /**< The application is low on memory, free memory if possible.
                               --      Called on iOS in applicationDidReceiveMemoryWarning()
                               --      Called on Android in onLowMemory()
                               -- */
    SDL_APP_WILLENTERBACKGROUND,-- /**< The application is about to enter the background
                                 --    Called on iOS in applicationWillResignActive()
                                 --    Called on Android in onPause()
                                --*/
    SDL_APP_DIDENTERBACKGROUND, --/**< The application did enter the background and may not get CPU for some time
                                  --   Called on iOS in applicationDidEnterBackground()
                                  --   Called on Android in onPause()
                                --*/
    SDL_APP_WILLENTERFOREGROUND, --/**< The application is about to enter the foreground
                                   --  Called on iOS in applicationWillEnterForeground()
                                   --  Called on Android in onResume()
                                --*/
    SDL_APP_DIDENTERFOREGROUND, --/**< The application is now interactive
                                 --    Called on iOS in applicationDidBecomeActive()
                                 --    Called on Android in onResume()
                               -- */

    SDL_LOCALECHANGED,  

   
    SDL_DISPLAYEVENT   = 0x150,  

   
    SDL_WINDOWEVENT    = 0x200,
    SDL_SYSWMEVENT,             

    SDL_KEYDOWN        = 0x300, 
    SDL_KEYUP,                  
    SDL_TEXTEDITING,            
    SDL_TEXTINPUT,              
    SDL_KEYMAPCHANGED,    
     
    SDL_TEXTEDITING_EXT,       

  
    SDL_MOUSEMOTION    = 0x400, 
    SDL_MOUSEBUTTONDOWN,        
    SDL_MOUSEBUTTONUP,         
    SDL_MOUSEWHEEL,             

   
    SDL_JOYAXISMOTION  = 0x600, 
    SDL_JOYBALLMOTION,          
    SDL_JOYHATMOTION,           
    SDL_JOYBUTTONDOWN,         
    SDL_JOYBUTTONUP,            
    SDL_JOYDEVICEADDED,         
    SDL_JOYDEVICEREMOVED,       
    SDL_JOYBATTERYUPDATED,    

    
    SDL_CONTROLLERAXISMOTION  = 0x650, 
    SDL_CONTROLLERBUTTONDOWN,          
    SDL_CONTROLLERBUTTONUP,            
    SDL_CONTROLLERDEVICEADDED,        
    SDL_CONTROLLERDEVICEREMOVED,      
    SDL_CONTROLLERDEVICEREMAPPED,      
    SDL_CONTROLLERTOUCHPADDOWN,      
    SDL_CONTROLLERTOUCHPADMOTION,      
    SDL_CONTROLLERTOUCHPADUP,         
    SDL_CONTROLLERSENSORUPDATE,        

  
    SDL_FINGERDOWN      = 0x700,
    SDL_FINGERUP,
    SDL_FINGERMOTION,

   
    SDL_DOLLARGESTURE   = 0x800,
    SDL_DOLLARRECORD,
    SDL_MULTIGESTURE,

 
    SDL_CLIPBOARDUPDATE = 0x900, 

    
    SDL_DROPFILE        = 0x1000, 
    SDL_DROPTEXT,                
    SDL_DROPBEGIN,              
    SDL_DROPCOMPLETE,             

   
    SDL_AUDIODEVICEADDED = 0x1100, 
    SDL_AUDIODEVICEREMOVED,        

    
    SDL_SENSORUPDATE = 0x1200,     

    
    SDL_RENDER_TARGETS_RESET = 0x2000, 
    SDL_RENDER_DEVICE_RESET, 

  
    SDL_POLLSENTINEL = 0x7F00, 

    --/** Events ::SDL_USEREVENT through ::SDL_LASTEVENT are for your use,
     --*  and should be allocated with SDL_RegisterEvents()
     --*/
    SDL_USEREVENT    = 0x8000,

    --/**
    -- *  This last event is only for bounding internal arrays
    -- */
    SDL_LASTEVENT    = 0xFFFF
end type

public constant SDL_CommonEvent = define_c_type({
	C_UINT, --type
	C_UINT --timestamp
})

public constant SDL_DisplayEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --display
	C_UINT, --event
	C_UINT, --padding1
	C_UINT, --padding2
	C_UINT, --padding3
	C_INT --data1
})

public constant SDL_WindowEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --windowID
	C_UINT, --event
	C_UINT, --padding1
	C_UINT, --padding2
	C_UINT, --padding3
	C_INT, --data1
	C_INT --data2
})

public constant SDL_KeyboardEvent = define_c_type({
	C_UINT, --type [1]
	C_UINT, --timestamp [2]
	C_UINT, --windowID [3]
	C_UINT, --state [4]
	C_UINT, --repeat [5]
	C_UINT, --padding2 [6]
	C_UINT, --padding3 [7]
	SDL_Keysym --key that was pressed or released [8]
})

public constant SDL_TEXTEDITINGEVENT_TEXT_SIZE = 32

public constant SDL_TextEditingEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --windowID
	C_CHAR, --text
	C_INT, --start
	C_INT --length
})

public constant SDL_TextEditingExtEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --windowID
	C_STRING, --text
	C_INT, --start
	C_INT --length
})

public constant SDL_TEXTINPUTEVENT_TEXT_SIZE = 32

public constant SDL_TextInputEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --windowID
	C_CHAR --text
})

public constant SDL_MouseMotionEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --windowID
	C_UINT, --which
	C_INT, --x
	C_INT, --y
	C_INT, --xrel
	C_INT --yrel
})

public constant SDL_MouseButtonEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --windowID
	C_UINT, --which
	C_UINT, --button
	C_UINT, --state
	C_UINT, --clicks
	C_UINT, --padding1
	C_INT, --x
	C_INT --y
})

public constant SDL_MouseWheelEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --windowID
	C_UINT, --which
	C_INT, --x
	C_INT, --y
	C_UINT, --direction
	C_FLOAT, --precisex
	C_FLOAT --precisey
})

public constant SDL_JoyAxisEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --joystick id which
	C_UINT, --axis
	C_UINT, --padding1
	C_UINT, --padding2
	C_UINT, --padding3
	C_INT, --value
	C_UINT --padding4
})

public constant SDL_JoyBallEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --joystick id which
	C_UINT, --ball
	C_UINT, --padding1
	C_UINT, --padding2
	C_UINT, --padding3
	C_INT, --xrel
	C_INT --yrel
})

public constant SDL_JoyHatEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --joystick id which
	C_UINT, --hat
	C_UINT, --value
	C_UINT, --padding1
	C_UINT --padding2
})

public constant SDL_JoyButtonEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --joystick id which
	C_UINT, --button
	C_UINT, --state
	C_UINT, --padding1
	C_UINT --padding2
})

public constant SDL_JoyDeviceEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_INT --which
})

public constant SDL_JoyBatteryEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --joystick which
	C_INT --joystick powerlevel
})

public constant SDL_ControllerAxisEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --joystickid which
	C_UINT, --axis
	C_UINT, --padding1
	C_UINT, --padding2
	C_UINT, --padding3
	C_INT, --value
	C_UINT --padding4
})

public constant SDL_ControllerButtonEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --joystickid which
	C_UINT, --button
	C_UINT, --state
	C_UINT, --padding1
	C_UINT --padding2
})

public constant SDL_ControllerDeviceEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_INT --which
})

public constant SDL_ControllerTouchpadEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --joystickid which
	C_INT, --touchpad
	C_INT, --finger
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT --pressure
})

public constant SDL_ControllerSensorEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --joystickid which
	C_INT, --sensor
	{C_FLOAT,3} --data (array of 3)
})

public constant SDL_AudioDeviceEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --which
	C_UINT, --icapture
	C_UINT, --padding1
	C_UINT, --padding2
	C_UINT --padding3
})

public constant SDL_TouchFingerEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --touchID
	C_LONG, --fingerID
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --dx
	C_FLOAT, --dy
	C_FLOAT, --pressure
	C_UINT --windowID
})

public constant SDL_MultiGestureEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --touchID
	C_FLOAT, --dTheta
	C_FLOAT, --dDist
	C_FLOAT, --x
	C_FLOAT, --y
	C_UINT, --numFingers
	C_UINT --padding
})

public constant SDL_DollarGestureEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_LONG, --touchID
	C_LONG, --gestureID
	C_UINT, --numFingers
	C_FLOAT, --error
	C_FLOAT, --x
	C_FLOAT --y
})

public constant SDL_DropEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_POINTER, --file
	C_UINT --windowID
})

public constant SDL_SensorEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_INT, --which
	{C_FLOAT,6} --data
})

public constant SDL_QuitEvent = define_c_type({
	C_UINT, --type
	C_UINT --timestamp
})

public constant SDL_OSEvent = define_c_type({
	C_UINT, --type
	C_UINT --timestamp
})

public constant SDL_UserEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_UINT, --windowID
	C_INT, --code
	C_POINTER, --data1
	C_POINTER --data2
})

public constant SDL_SysWMEvent = define_c_type({
	C_UINT, --type
	C_UINT, --timestamp
	C_POINTER --msg
})

public constant SDL_Event = define_c_type({
	C_UINT, --type [1]
	SDL_CommonEvent, --[2]
	SDL_DisplayEvent, --[3]
	SDL_WindowEvent, --[4]
	SDL_KeyboardEvent, --[5]
	SDL_TextEditingEvent, --[6]
	SDL_TextEditingExtEvent, --[7]
	SDL_TextInputEvent, --[8]
	SDL_MouseMotionEvent, --[9]
	SDL_MouseButtonEvent, --[10]
	SDL_MouseWheelEvent, --[11]
	SDL_JoyAxisEvent, --[12]
	SDL_JoyBallEvent, --[13]
	SDL_JoyHatEvent, --[14]
	SDL_JoyButtonEvent, --[15]
	SDL_JoyDeviceEvent, --[16]
	SDL_JoyBatteryEvent, --[17]
	SDL_ControllerAxisEvent, --[18]
	SDL_ControllerButtonEvent, --[19]
	SDL_ControllerDeviceEvent, --[20]
	SDL_ControllerTouchpadEvent, --[21]
	SDL_ControllerSensorEvent, --[22]
	SDL_AudioDeviceEvent, --[23]
	SDL_SensorEvent, --[24]
	SDL_QuitEvent, --[25]
	SDL_UserEvent, --[26]
	SDL_SysWMEvent, --[27]
	SDL_TouchFingerEvent, --[28]
	SDL_MultiGestureEvent, --[29]
	SDL_DollarGestureEvent, --[30]
	SDL_DropEvent --[31]
})

--Add the events as you need them
--constant SIZEOF_SDL_EVENT = math:max({
--	sizeof(C_UINT),
--	sizeof(SDL_CommonEvent),
--	sizeof(SDL_DisplayEvent),
--	sizeof(SDL_WindowEvent),
--	sizeof(SDL_KeyboardEvent)
--})

--atom event = allocate_data(SIZEOF_SDL_EVENT)

export constant xSDL_PumpEvents = define_c_proc(sdl,"+SDL_PumpEvents",{})

public procedure SDL_PumpEvents()
	c_proc(xSDL_PumpEvents,{})
end procedure

public enum type SDL_eventaction
	SDL_ADDEVENT = 0,
	SDL_PEEKEVENT,
	SDL_GETEVENT
end type

export constant xSDL_PeepEvents = define_c_func(sdl,"+SDL_PeepEvents",{C_POINTER,C_INT,C_INT,C_UINT,C_UINT},C_INT)

public function SDL_PeepEvents(atom events,atom num,SDL_eventaction action,atom min,atom max)
	return c_func(xSDL_PeepEvents,{events,num,action,min,max})
end function

export constant xSDL_HasEvent = define_c_func(sdl,"+SDL_HasEvent",{C_UINT},C_BOOL)

public function SDL_HasEvent(atom xtype)
	return c_func(xSDL_HasEvent,{xtype})
end function

export constant xSDL_HasEvents = define_c_func(sdl,"+SDL_HasEvents",{C_UINT,C_UINT},C_BOOL)

public function SDL_HasEvents(atom min,atom max)
	return c_func(xSDL_HasEvents,{min,max})
end function

export constant xSDL_FlushEvent = define_c_proc(sdl,"+SDL_FlushEvent",{C_UINT})

public procedure SDL_FlushEvent(atom xtype)
	c_proc(xSDL_FlushEvent,{xtype})
end procedure

export constant xSDL_FlushEvents = define_c_proc(sdl,"+SDL_FlushEvents",{C_UINT,C_UINT})

public procedure SDL_FlushEvents(atom min,atom max)
	c_proc(xSDL_FlushEvents,{min,max})
end procedure

export constant xSDL_PollEvent = define_c_func(sdl,"+SDL_PollEvent",{C_POINTER},C_INT)

public function SDL_PollEvent(atom evt)
	return c_func(xSDL_PollEvent,{evt})
end function

export constant xSDL_WaitEvent = define_c_func(sdl,"+SDL_WaitEvent",{C_POINTER},C_INT)

public function SDL_WaitEvent(atom evt)
	return c_func(xSDL_WaitEvent,{evt})
end function

export constant xSDL_WaitEventTimeout = define_c_func(sdl,"+SDL_WaitEventTimeout",{C_POINTER,C_INT},C_INT)

public function SDL_WaitEventTimeout(atom evt,atom tio)
	return c_func(xSDL_WaitEventTimeout,{evt,tio})
end function

export constant xSDL_PushEvent = define_c_func(sdl,"+SDL_PushEvent",{C_POINTER},C_INT)

public function SDL_PushEvent(atom evt)
	return c_func(xSDL_PushEvent,{evt})
end function

export constant SDL_EventFilter = define_c_type({
	C_POINTER, --userdata
	C_POINTER --event
})

public function SDL_EF(atom ud,sequence evt)
	return 0
end function

public constant MY_SDL_EventFilter = allocate_struct(SDL_EventFilter, {
	call_back(routine_id("SDL_EF"),{C_POINTER,C_POINTER},C_INT)
})

export constant xSDL_SetEventFilter = define_c_proc(sdl,"+SDL_SetEventFilter",{C_POINTER,C_POINTER})

public procedure SDL_SetEventFilter(atom filt,atom ud)
	c_proc(xSDL_SetEventFilter,{filt,ud})
end procedure

export constant xSDL_GetEventFilter = define_c_func(sdl,"+SDL_GetEventFilter",{C_POINTER,C_POINTER},C_BOOL)

public function SDL_GetEventFilter(atom filt,atom ud)
	return c_func(xSDL_GetEventFilter,{filt,ud})
end function

export constant xSDL_AddEventWatch = define_c_proc(sdl,"+SDL_AddEventWatch",{C_POINTER,C_POINTER})

public procedure SDL_AddEventWatch(atom filt,atom ud)
	c_proc(xSDL_AddEventWatch,{filt,ud})
end procedure

export constant xSDL_DelEventWatch = define_c_proc(sdl,"+SDL_DelEventWatch",{C_POINTER,C_POINTER})

public procedure SDL_DelEventWatch(atom filt,atom ud)
	c_proc(xSDL_DelEventWatch,{filt,ud})
end procedure

export constant xSDL_FilterEvents = define_c_proc(sdl,"+SDL_FilterEvents",{C_POINTER,C_POINTER})

public procedure SDL_FilterEvents(atom filt,atom ud)
	c_proc(xSDL_FilterEvents,{filt,ud})
end procedure

public constant SDL_QUERY = -1,
				SDL_IGNORE = 0,
				SDL_DISABLE = 0,
				SDL_ENABLE = 1
				
export constant xSDL_EventState = define_c_func(sdl,"+SDL_EventState",{C_UINT,C_INT},C_UINT)

public function SDL_EventState(atom xtype,atom state)
	return c_func(xSDL_EventState,{xtype,state})
end function 

export constant xSDL_RegisterEvents = define_c_func(sdl,"+SDL_RegisterEvents",{C_INT},C_UINT)

public function SDL_RegisterEvents(atom num)
	return c_func(xSDL_RegisterEvents,{num})
end function

--free(event)
­540.34