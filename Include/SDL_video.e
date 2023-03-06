include std/ffi.e
include std/machine.e

include SDL_pixels.e
include SDL_rect.e
include SDL_surface.e

include std/math.e

include sdl.e

public constant SDL_DisplayMode = define_c_struct({
	C_UINT32, --format
	C_INT, --w
	C_INT, --h
	C_INT, --refresh_rate
	C_POINTER --driverdata
})

public enum type SDL_WindowFlags
	SDL_WINDOW_FULLSCREEN = 0x00000001,        
    SDL_WINDOW_OPENGL = 0x00000002,             
    SDL_WINDOW_SHOWN = 0x00000004,              
    SDL_WINDOW_HIDDEN = 0x00000008,             
    SDL_WINDOW_BORDERLESS = 0x00000010,       
    SDL_WINDOW_RESIZABLE = 0x00000020,        
    SDL_WINDOW_MINIMIZED = 0x00000040,          
    SDL_WINDOW_MAXIMIZED = 0x00000080,         
    SDL_WINDOW_MOUSE_GRABBED = 0x00000100,      
    SDL_WINDOW_INPUT_FOCUS = 0x00000200,      
    SDL_WINDOW_MOUSE_FOCUS = 0x00000400,       
    SDL_WINDOW_FULLSCREEN_DESKTOP = SDL_WINDOW_FULLSCREEN,
    SDL_WINDOW_FOREIGN = 0x00000800,            
    SDL_WINDOW_ALLOW_HIGHDPI = 0x00002000,      
                                                                                                       
    SDL_WINDOW_MOUSE_CAPTURE    = 0x00004000,   
    SDL_WINDOW_ALWAYS_ON_TOP    = 0x00008000,   
    SDL_WINDOW_SKIP_TASKBAR     = 0x00010000,   
    SDL_WINDOW_UTILITY          = 0x00020000,   
    SDL_WINDOW_TOOLTIP          = 0x00040000,  
    SDL_WINDOW_POPUP_MENU       = 0x00080000,   
    SDL_WINDOW_KEYBOARD_GRABBED = 0x00100000,  
    SDL_WINDOW_VULKAN           = 0x10000000,   
    SDL_WINDOW_METAL            = 0x20000000  
end type

public constant SDL_WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000
public constant SDL_WINDOWPOS_UNDEFINED_DISPLAY = SDL_WINDOWPOS_UNDEFINED_MASK
public constant SDL_WINDOWPOS_UNDEFINED = SDL_WINDOWPOS_UNDEFINED_DISPLAY

public constant SDL_WINDOWPOS_CENTERED_MASK = 0x2FFF0000
public constant SDL_WINDOWPOS_CENTERED = SDL_WINDOWPOS_CENTERED_MASK

public enum type SDL_WindowEventID
	SDL_WINDOWEVENT_NONE = 0,
	SDL_WINDOWEVENT_SHOWN,
	SDL_WINDOWEVENT_HIDDEN,
	SDL_WINDOWEVENT_EXPOSED,
	
	SDL_WINDOWEVENT_MOVED,
	
	SDL_WINDOWEVENT_RESIZED,
	SDL_WINDOWEVENT_SIZE_CHANGED,
	
	SDL_WINDOWEVENT_MINIMIZED,
	SDL_WINDOWEVENT_MAXIMIZED,
	SDL_WINDOWEVENT_RESTORED,
	
	SDL_WINDOWEVENT_ENTER,
	SDL_WINDOWEVENT_LEAVE,
	SDL_WINDOWEVENT_FOCUS_GAINED,
	SDL_WINDOWEVENT_FOCUS_LOST,
	SDL_WINDOWEVENT_CLOSE,
	SDL_WINDOWEVENT_TAKE_FOCUS,
	SDL_WINDOWEVENT_HIT_TEST,
	SDL_WINDOWEVENT_ICCPROF_CHANGED,
	SDL_WINDOWEVENT_DISPLAY_CHANGED
end type

public enum type SDL_DisplayEventID
	SDL_DISPLAYEVENT_NONE = 0,
	SDL_DISPLAYEVENT_ORIENTATION,
	SDL_DISPLAYEVENT_CONNECTED,
	SDL_DISPLAYEVENT_DISCONNECTED
end type

public enum type SDL_DisplayOrientation
	SDL_ORIENTATION_UNKNOWN = 0,
	SDL_ORIENTATION_LANDSCAPE,
	SDL_ORIENTATION_LANDSCAPE_FLIPPED,
	SDL_ORIENTATION_PORTRAIT,
	SDL_ORIENTATION_PORTRAIT_FLIPPED
end type

public enum type SDL_FlashOperation
	SDL_FLASH_CANCEL = 0,
	SDL_FLASH_BRIEFLY,
	SDL_FLASH_UNTIL_FOCUSED
end type

public enum type SDL_GLattr
	SDL_GL_RED_SIZE = 0,
    SDL_GL_GREEN_SIZE,
    SDL_GL_BLUE_SIZE,
    SDL_GL_ALPHA_SIZE,
    SDL_GL_BUFFER_SIZE,
    SDL_GL_DOUBLEBUFFER,
    SDL_GL_DEPTH_SIZE,
    SDL_GL_STENCIL_SIZE,
    SDL_GL_ACCUM_RED_SIZE,
    SDL_GL_ACCUM_GREEN_SIZE,
    SDL_GL_ACCUM_BLUE_SIZE,
    SDL_GL_ACCUM_ALPHA_SIZE,
    SDL_GL_STEREO,
    SDL_GL_MULTISAMPLEBUFFERS,
    SDL_GL_MULTISAMPLESAMPLES,
    SDL_GL_ACCELERATED_VISUAL,
    SDL_GL_RETAINED_BACKING,
    SDL_GL_CONTEXT_MAJOR_VERSION,
    SDL_GL_CONTEXT_MINOR_VERSION,
    SDL_GL_CONTEXT_EGL,
    SDL_GL_CONTEXT_FLAGS,
    SDL_GL_CONTEXT_PROFILE_MASK,
    SDL_GL_SHARE_WITH_CURRENT_CONTEXT,
    SDL_GL_FRAMEBUFFER_SRGB_CAPABLE,
    SDL_GL_CONTEXT_RELEASE_BEHAVIOR,
    SDL_GL_CONTEXT_RESET_NOTIFICATION,
    SDL_GL_CONTEXT_NO_ERROR,
    SDL_GL_FLOATBUFFERS
end type

public enum type SDL_GLprofile
	SDL_GL_CONTEXT_PROFILE_CORE = 1,
	SDL_GL_CONTEXT_PROFILE_COMPATIBILITY = 2,
	SDL_GL_CONTEXT_PROFILE_ES = 4
end type

public enum type SDL_GLcontextFlag
	SDL_GL_CONTEXT_DEBUG_FLAG = 1,
	SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 2,
	SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG = 4,
	SDL_GL_CONTEXT_RESET_ISOLATION_FLAG = 8
end type

public enum type SDL_GLcontextReleaseFlag
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0,
	SDL_GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 1
end type

public enum type SDL_GLContextResetNotification
	SDL_GL_CONTEXT_RESET_NO_NOTIFICATION = 0,
	SDL_GL_CONTEXT_RESET_LOSE_CONTEXT = 1
end type

export constant xSDL_GetNumVideoDrivers = define_c_func(sdl,"+SDL_GetNumVideoDrivers",{},C_INT)

public function SDL_GetNumVideoDrivers()
	return c_func(xSDL_GetNumVideoDrivers,{})
end function

export constant xSDL_GetVideoDriver = define_c_func(sdl,"+SDL_GetVideoDriver",{C_INT},C_STRING)

public function SDL_GetVideoDriver(atom index)
	return c_func(xSDL_GetVideoDriver,{index})	
end function

export constant xSDL_VideoInit = define_c_func(sdl,"+SDL_VideoInit",{C_STRING},C_INT)

public function SDL_VideoInit(sequence driver_name)
	return c_func(xSDL_VideoInit,{driver_name})
end function

export constant xSDL_VideoQuit = define_c_proc(sdl,"+SDL_VideoQuit",{})

public procedure SDL_VideoQuit()
	c_proc(xSDL_VideoQuit,{})
end procedure

export constant xSDL_GetCurrentVideoDriver = define_c_func(sdl,"+SDL_GetCurrentVideoDriver",{},C_STRING)

public function SDL_GetCurrentVideoDriver()
	return c_func(xSDL_GetCurrentVideoDriver,{})
end function

export constant xSDL_GetNumVideoDisplays = define_c_func(sdl,"+SDL_GetNumVideoDisplays",{},C_INT)

public function SDL_GetNumVideoDisplays()
	return c_func(xSDL_GetNumVideoDisplays,{})
end function

export constant xSDL_GetDisplayName = define_c_func(sdl,"+SDL_GetDisplayName",{C_INT},C_STRING)

public function SDL_GetDisplayName(atom displayIndex)
	return c_func(xSDL_GetDisplayName,{displayIndex})
end function

export constant xSDL_GetDisplayBounds = define_c_func(sdl,"+SDL_GetDisplayBounds",{C_INT,C_POINTER},C_INT)

public function SDL_GetDisplayBounds(atom displayIndex,atom rect)

	return c_func(xSDL_GetDisplayBounds,{displayIndex,rect})
end function

export constant xSDL_GetDisplayUsableBounds = define_c_func(sdl,"+SDL_GetDisplayUsableBounds",{C_INT,C_POINTER},C_INT)

public function SDL_GetDisplayUsableBounds(atom displayIndex,atom rect)

	return c_func(xSDL_GetDisplayUsableBounds,{displayIndex,rect})
end function

export constant xSDL_GetDisplayDPI = define_c_func(sdl,"+SDL_GetDisplayDPI",{C_INT,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetDisplayDPI(atom displayIndex,atom ddpi,atom hdpi,atom vdpi)
	return c_func(xSDL_GetDisplayDPI,{displayIndex,ddpi,hdpi,vdpi})
end function

export constant xSDL_GetDisplayOrientation = define_c_func(sdl,"+SDL_GetDisplayOrientation",{C_INT},C_INT)

public function SDL_GetDisplayOrientation(atom displayIndex)
	return c_func(xSDL_GetDisplayOrientation,{displayIndex})
end function

export constant xSDL_GetNumDisplayModes = define_c_func(sdl,"+SDL_GetNumDisplayModes",{C_INT},C_INT)

public function SDL_GetNumDisplayModes(atom displayIndex)
	return c_func(xSDL_GetNumDisplayModes,{displayIndex})
end function

export constant xSDL_GetDisplayMode = define_c_func(sdl,"+SDL_GetDisplayMode",{C_INT,C_INT,C_POINTER},C_INT)

public function SDL_GetDisplayMode(atom displayIndex,atom modeIndex,atom mode)

	return c_func(xSDL_GetDisplayMode,{displayIndex,modeIndex,mode})
end function

export constant xSDL_GetDesktopDisplayMode = define_c_func(sdl,"+SDL_GetDesktopDisplayMode",{C_INT,C_POINTER},C_INT)

public function SDL_GetDesktopDisplayMode(atom displayIndex,atom mode)

	return c_func(xSDL_GetDesktopDisplayMode,{displayIndex,mode})
end function

export constant xSDL_GetCurrentDisplayMode = define_c_func(sdl,"+SDL_GetCurrentDisplayMode",{C_INT,C_POINTER},C_INT)

public function SDL_GetCurrentDisplayMode(atom displayIndex,atom mode)

	return c_func(xSDL_GetCurrentDisplayMode,{displayIndex,mode})
end function

export constant xSDL_GetClosestDisplayMode = define_c_func(sdl,"+SDL_GetClosestDisplayMode",{C_INT,C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetClosestDisplayMode(atom displayIndex,atom mode,atom closest)

	return c_func(xSDL_GetClosestDisplayMode,{displayIndex,mode,closest})
end function

export constant xSDL_GetPointDisplayIndex = define_c_func(sdl,"+SDL_GetPointDisplayIndex",{C_POINTER},C_INT)

public function SDL_GetPointDisplayIndex(atom pt)

	return c_func(xSDL_GetPointDisplayIndex,{pt})
end function

export constant xSDL_GetRectDisplayIndex = define_c_func(sdl,"+SDL_GetRectDisplayIndex",{C_POINTER},C_INT)

public function SDL_GetRectDisplayIndex(atom rect)

	return c_func(xSDL_GetRectDisplayIndex,{rect})
end function

export constant xSDL_GetWindowDisplayIndex = define_c_func(sdl,"+SDL_GetWindowDisplayIndex",{C_POINTER},C_INT)

public function SDL_GetWindowDisplayIndex(atom win)
	return c_func(xSDL_GetWindowDisplayIndex,{win})
end function

export constant xSDL_GetWindowDisplayMode = define_c_func(sdl,"+SDL_GetWindowDisplayMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowDisplayMode(atom win,atom mode)

	return c_func(xSDL_GetWindowDisplayMode,{win,mode})
end function

export constant xSDL_GetWindowICCProfile = define_c_func(sdl,"+SDL_GetWindowICCProfile",{C_POINTER,C_POINTER},C_POINTER)

public function SDL_GetWindowICCProfile(atom win,atom size)
	return c_func(xSDL_GetWindowICCProfile,{win,size})
end function

export constant xSDL_GetWindowPixelFormat = define_c_func(sdl,"+SDL_GetWindowPixelFormat",{C_POINTER},C_UINT)

public function SDL_GetWindowPixelFormat(atom win)
	return c_func(xSDL_GetWindowPixelFormat,{win})
end function

export constant xSDL_CreateWindow = define_c_func(sdl,"+SDL_CreateWindow",{C_STRING,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_POINTER)

public function SDL_CreateWindow(sequence title,atom x,atom y,atom w,atom h,atom flags)
	return c_func(xSDL_CreateWindow,{title,x,y,w,h,flags})
end function

export constant xSDL_CreateWindowFrom = define_c_func(sdl,"+SDL_CreateWindowFrom",{C_POINTER},C_POINTER)

public function SDL_CreateWindowFrom(atom data)
	return c_func(xSDL_CreateWindowFrom,{data})
end function

export constant xSDL_GetWindowID = define_c_func(sdl,"+SDL_GetWindowID",{C_POINTER},C_UINT)

public function SDL_GetWindowID(atom win)
	return c_func(xSDL_GetWindowID,{win})
end function

export constant xSDL_GetWindowFromID = define_c_func(sdl,"+SDL_GetWindowFromID",{C_UINT},C_POINTER)

public function SDL_GetWindowFromID(atom id)
	return c_func(xSDL_GetWindowFromID,{id})
end function

export constant xSDL_GetWindowFlags = define_c_func(sdl,"+SDL_GetWindowFlags",{C_POINTER},C_UINT)

public function SDL_GetWindowFlags(atom win)
	return c_func(xSDL_GetWindowFlags,{win})
end function

export constant xSDL_SetWindowTitle = define_c_proc(sdl,"+SDL_SetWindowTitle",{C_POINTER,C_STRING})

public procedure SDL_SetWindowTitle(atom win,sequence title)
	c_proc(xSDL_SetWindowTitle,{win,title})
end procedure

export constant xSDL_GetWindowTitle = define_c_func(sdl,"+SDL_GetWindowTitle",{C_POINTER},C_STRING)

public function SDL_GetWindowTitle(atom win)
	return c_func(xSDL_GetWindowTitle,{win})
end function

export constant xSDL_SetWindowIcon = define_c_proc(sdl,"+SDL_SetWindowIcon",{C_POINTER,C_POINTER})

public procedure SDL_SetWindowIcon(atom win,atom icon)

	c_proc(xSDL_SetWindowIcon,{win,icon})
end procedure

export constant xSDL_SetWindowData = define_c_func(sdl,"+SDL_SetWindowData",{C_POINTER,C_STRING,C_POINTER},C_POINTER)

public function SDL_SetWindowData(atom win,sequence name,atom userdata)
	return c_func(xSDL_SetWindowData,{win,name,userdata})
end function

export constant xSDL_GetWindowData = define_c_func(sdl,"+SDL_GetWindowData",{C_POINTER,C_STRING},C_POINTER)

public function SDL_GetWindowData(atom win,sequence name)
	return c_func(xSDL_GetWindowData,{win,name})
end function

export constant xSDL_SetWindowPosition = define_c_proc(sdl,"+SDL_SetWindowPosition",{C_POINTER,C_INT,C_INT})

public procedure SDL_SetWindowPosition(atom win,atom x,atom y)
	c_proc(xSDL_SetWindowPosition,{win,x,y})
end procedure

export constant xSDL_GetWindowPosition = define_c_proc(sdl,"+SDL_GetWindowPosition",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetWindowPosition(atom win,atom x,atom y)
	c_proc(xSDL_GetWindowPosition,{win,x,y})
end procedure

export constant xSDL_SetWindowSize = define_c_proc(sdl,"+SDL_SetWindowSize",{C_POINTER,C_INT,C_INT})

public procedure SDL_SetWindowSize(atom win,atom w,atom h)
	c_proc(xSDL_SetWindowSize,{win,w,h})
end procedure

export constant xSDL_GetWindowSize = define_c_proc(sdl,"+SDL_GetWindowSize",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetWindowSize(atom win,atom w,atom h)
	c_proc(xSDL_GetWindowSize,{win,w,h})
end procedure

export constant xSDL_GetWindowBordersSize = define_c_func(sdl,"+SDL_GetWindowBordersSize",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowBordersSize(atom win,atom top,atom left,atom bottom,atom right)
	return c_func(xSDL_GetWindowBordersSize,{win,top,left,bottom,right})
end function

export constant xSDL_SetWindowMinimumSize = define_c_proc(sdl,"+SDL_SetWindowMinimumSize",{C_POINTER,C_INT,C_INT})

public procedure SDL_SetWindowMinimumSize(atom win,atom w,atom h)
	c_proc(xSDL_SetWindowMinimumSize,{win,w,h})
end procedure

export constant xSDL_GetWindowMinimumSize = define_c_proc(sdl,"+SDL_GetWindowMinimumSize",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetWindowMinimumSize(atom win,atom w,atom h)
	c_proc(xSDL_GetWindowMinimumSize,{win,w,h})
end procedure

export constant xSDL_SetWindowMaximumSize = define_c_proc(sdl,"+SDL_SetWindowMaximumSize",{C_POINTER,C_INT,C_INT})

public procedure SDL_SetWindowMaximumSize(atom win,atom w,atom h)
	c_proc(xSDL_SetWindowMaximumSize,{win,w,h})
end procedure

export constant xSDL_GetWindowMaximumSize = define_c_proc(sdl,"+SDL_GetWindowMaximumSize",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetWindowMaximumSize(atom win,atom w,atom h)
	c_proc(xSDL_GetWindowMaximumSize,{win,w,h})
end procedure

export constant xSDL_SetWindowBordered = define_c_proc(sdl,"+SDL_SetWindowBordered",{C_POINTER,C_BOOL})

public procedure SDL_SetWindowBordered(atom win,atom border)
	c_proc(xSDL_SetWindowBordered,{win,border})
end procedure

export constant xSDL_SetWindowResizable = define_c_proc(sdl,"+SDL_SetWindowResizable",{C_POINTER,C_BOOL})

public procedure SDL_SetWindowResizable(atom win,atom resize)
	c_proc(xSDL_SetWindowResizable,{win,resize})
end procedure

export constant xSDL_WindowAlwaysOnTop = define_c_proc(sdl,"+SDL_WindowAlwaysOnTop",{C_POINTER,C_BOOL})

public procedure SDL_WindowAlwaysOnTop(atom win,atom on_top)
	c_proc(xSDL_WindowAlwaysOnTop,{win,on_top})
end procedure

export constant xSDL_ShowWindow = define_c_proc(sdl,"+SDL_ShowWindow",{C_POINTER})

public procedure SDL_ShowWindow(atom win)
	c_proc(xSDL_ShowWindow,{win})
end procedure

export constant xSDL_HideWindow = define_c_proc(sdl,"+SDL_HideWindow",{C_POINTER})

public procedure SDL_HideWindow(atom win)
	c_proc(xSDL_HideWindow,{win})
end procedure

export constant xSDL_RaiseWindow = define_c_proc(sdl,"+SDL_RaiseWindow",{C_POINTER})

public procedure SDL_RaiseWindow(atom win)
	c_proc(xSDL_RaiseWindow,{win})
end procedure

export constant xSDL_MaximizeWindow = define_c_proc(sdl,"+SDL_MaximizeWindow",{C_POINTER})

public procedure SDL_MaximizeWindow(atom win)
	c_proc(xSDL_MaximizeWindow,{win})
end procedure

export constant xSDL_MinimizeWindow = define_c_proc(sdl,"+SDL_MinimizeWindow",{C_POINTER})

public procedure SDL_MinimizeWindow(atom win)
	c_proc(xSDL_MinimizeWindow,{win})
end procedure

export constant xSDL_RestoreWindow = define_c_proc(sdl,"+SDL_RestoreWindow",{C_POINTER})

public procedure SDL_RestoreWindow(atom win)
	c_proc(xSDL_RestoreWindow,{win})
end procedure

export constant xSDL_SetWindowFullscreen = define_c_func(sdl,"+SDL_SetWindowFullscreen",{C_POINTER,C_UINT32},C_INT)

public function SDL_SetWindowFullscreen(atom win,atom flags)
	return c_func(xSDL_SetWindowFullscreen,{win,flags})
end function

export constant xSDL_GetWindowSurface = define_c_func(sdl,"+SDL_GetWindowSurface",{C_POINTER},C_POINTER)

public function SDL_GetWindowSurface(atom win)
	return c_func(xSDL_GetWindowSurface,{win})
end function

export constant xSDL_UpdateWindowSurface = define_c_func(sdl,"+SDL_UpdateWindowSurface",{C_POINTER},C_INT)

public function SDL_UpdateWindowSurface(atom win)
	return c_func(xSDL_UpdateWindowSurface,{win})
end function

export constant xSDL_UpdateWindowSurfaceRects = define_c_func(sdl,"+SDL_UpdateWindowSurfaceRects",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_UpdateWindowSurfaceRects(atom win,atom rects,atom num)

	return c_func(xSDL_UpdateWindowSurfaceRects,{win,rects,num})
end function

export constant xSDL_SetWindowGrab = define_c_proc(sdl,"+SDL_SetWindowGrab",{C_POINTER,C_BOOL})

public procedure SDL_SetWindowGrab(atom win,atom grab)
	c_proc(xSDL_SetWindowGrab,{win,grab})
end procedure

export constant xSDL_SetWindowKeyboardGrab = define_c_proc(sdl,"+SDL_SetWindowKeyboardGrab",{C_POINTER,C_BOOL})

public procedure SDL_SetWindowKeyboardGrab(atom win,atom grab)
	c_proc(xSDL_SetWindowKeyboardGrab,{win,grab})
end procedure

export constant xSDL_SetWindowMouseGrab = define_c_proc(sdl,"+SDL_SetWindowMouseGrab",{C_POINTER,C_BOOL})

public procedure SDL_SetWindowMouseGrab(atom win,atom grab)
	c_proc(xSDL_SetWindowMouseGrab,{win,grab})
end procedure

export constant xSDL_GetWindowGrab = define_c_func(sdl,"+SDL_GetWindowGrab",{C_POINTER},C_BOOL)

public function SDL_GetWindowGrab(atom win)
	return c_func(xSDL_GetWindowGrab,{win})
end function

export constant xSDL_GetWindowKeyboardGrab = define_c_func(sdl,"+SDL_GetWindowKeyboardGrab",{C_POINTER},C_BOOL)

public function SDL_GetWindowKeyboardGrab(atom win)
	return c_func(xSDL_GetWindowKeyboardGrab,{win})
end function

export constant xSDL_GetWindowMouseGrab = define_c_func(sdl,"+SDL_GetWindowMouseGrab",{C_POINTER},C_BOOL)

public function SDL_GetWindowMouseGrab(atom win)
	return c_func(xSDL_GetWindowMouseGrab,{win})
end function

export constant xSDL_GetGrabbedWindow = define_c_func(sdl,"+SDL_GetGrabbedWindow",{},C_POINTER)

public function SDL_GetGrabbedWindow()
	return c_func(xSDL_GetGrabbedWindow,{})
end function

export constant xSDL_SetWindowMouseRect = define_c_func(sdl,"+SDL_SetWindowMouseRect",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowMouseRect(atom win,atom rect)

	return c_func(xSDL_SetWindowMouseRect,{win,rect})
end function

export constant xSDL_GetWindowMouseRect = define_c_func(sdl,"+SDL_GetWindowMouseRect",{C_POINTER},C_POINTER)

public function SDL_GetWindowMouseRect(atom win)
	return c_func(xSDL_GetWindowMouseRect,{win})
end function

export constant xSDL_SetWindowBrightness = define_c_func(sdl,"+SDL_SetWindowBrightness",{C_POINTER,C_FLOAT},C_INT)

public function SDL_SetWindowBrightness(atom win,atom bright)
	return c_func(xSDL_SetWindowBrightness,{win,bright})
end function

export constant xSDL_GetWindowBrightness = define_c_func(sdl,"+SDL_GetWindowBrightness",{C_POINTER},C_FLOAT)

public function SDL_GetWindowBrightness(atom win)
	return c_func(xSDL_GetWindowBrightness,{win})
end function

export constant xSDL_SetWindowOpacity = define_c_func(sdl,"+SDL_SetWindowOpacity",{C_POINTER,C_FLOAT},C_INT)

public function SDL_SetWindowOpacity(atom win,atom op)
	return c_func(xSDL_SetWindowOpacity,{win,op})
end function

export constant xSDL_GetWindowOpacity = define_c_func(sdl,"+SDL_GetWindowOpacity",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowOpacity(atom win,atom out_op)
	return c_func(xSDL_GetWindowOpacity,{win,out_op})
end function

export constant xSDL_SetWindowModalFor = define_c_func(sdl,"+SDL_SetWindowModalFor",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowModalFor(atom mod_win,atom par_win)
	return c_func(xSDL_SetWindowModalFor,{mod_win,par_win})
end function

export constant xSDL_SetWindowInputFocus = define_c_func(sdl,"+SDL_SetWindowInputFocus",{C_POINTER},C_INT)

public function SDL_SetWindowInputFocus(atom win)
	return c_func(xSDL_SetWindowInputFocus,{win})
end function

export constant xSDL_SetWindowGammaRamp = define_c_func(sdl,"+SDL_SetWindowGammaRamp",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowGammaRamp(atom win,atom r,atom g,atom b)
	return c_func(xSDL_SetWindowGammaRamp,{win,r,g,b})
end function

export constant xSDL_GetWindowGammaRamp = define_c_func(sdl,"+SDL_GetWindowGammaRamp",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetWindowGammaRamp(atom win,atom r,atom g,atom b)
	return c_func(xSDL_GetWindowGammaRamp,{win,r,g,b})
end function

public enum type SDL_HitTestResult
	SDL_HITTEST_NORMAL = 0,
	SDL_HITTEST_DRAGGABLE,
	SDL_HITTEST_RESIZE_TOPLEFT,
	SDL_HITTEST_RESIZE_TOP,
	SDL_HITTEST_RESIZE_TOPRIGHT,
	SDL_HITTEST_RESIZE_RIGHT,
	SDL_HITTEST_RESIZE_BOTTOMRIGHT,
	SDL_HITTEST_RESIZE_BOTTOM,
	SDL_HITTEST_RESIZE_BOTTOMLEFT,
	SDL_HITTEST_RESIZE_LEFT
end type

export constant xSDL_SetWindowHitTest = define_c_func(sdl,"+SDL_SetWindowHitTest",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_SetWindowHitTest(atom win,atom cb,atom data)
	return c_func(xSDL_SetWindowHitTest,{win,cb,data})
end function

export constant xSDL_FlashWindow = define_c_func(sdl,"+SDL_FlashWindow",{C_POINTER,C_INT},C_INT)

public function SDL_FlashWindow(atom win,SDL_FlashOperation flash)
	return c_func(xSDL_FlashWindow,{win,flash})
end function

export constant xSDL_DestroyWindow = define_c_proc(sdl,"+SDL_DestroyWindow",{C_POINTER})

public procedure SDL_DestroyWindow(atom win)
	c_proc(xSDL_DestroyWindow,{win})
end procedure

export constant xSDL_IsScreenSaverEnabled = define_c_func(sdl,"+SDL_IsScreenSaverEnabled",{},C_BOOL)

public function SDL_IsScreenSaverEnabled()
	return c_func(xSDL_IsScreenSaverEnabled,{})
end function

export constant xSDL_EnableScreenSaver = define_c_proc(sdl,"+SDL_EnableScreenSaver",{})

public procedure SDL_EnableScreenSaver()
	c_proc(xSDL_EnableScreenSaver,{})
end procedure

export constant xSDL_DisableScreenSaver = define_c_proc(sdl,"+SDL_DisableScreenSaver",{})

public procedure SDL_DisableScreenSaver()
	c_proc(xSDL_DisableScreenSaver,{})
end procedure

export constant xSDL_GL_LoadLibrary = define_c_func(sdl,"+SDL_GL_LoadLibrary",{C_STRING},C_INT)

public function SDL_GL_LoadLibrary(sequence path)
	return c_func(xSDL_GL_LoadLibrary,{path})
end function

export constant xSDL_GL_GetProcAddress = define_c_func(sdl,"+SDL_GL_GetProcAddress",{C_STRING},C_POINTER)

public function SDL_GL_GetProcAddress(sequence proc)
	return c_func(xSDL_GL_GetProcAddress,{proc})
end function

export constant xSDL_GL_UnloadLibrary = define_c_proc(sdl,"+SDL_GL_UnloadLibrary",{})

public procedure SDL_GL_UnloadLibrary()
	c_proc(xSDL_GL_UnloadLibrary,{})
end procedure

export constant xSDL_GL_ExtensionSupported = define_c_func(sdl,"+SDL_GL_ExtensionSupported",{C_STRING},C_BOOL)

public function SDL_GL_ExtensionSupported(sequence ext)
	return c_func(xSDL_GL_ExtensionSupported,{ext})
end function

export constant xSDL_GL_ResetAttributes = define_c_proc(sdl,"+SDL_GL_ResetAttributes",{})

public procedure SDL_GL_ResetAttributes()
	c_proc(xSDL_GL_ResetAttributes,{})
end procedure

export constant xSDL_GL_SetAttribute = define_c_func(sdl,"+SDL_GL_SetAttribute",{C_INT,C_INT},C_INT)

public function SDL_GL_SetAttribute(atom attr,atom val)
	return c_func(xSDL_GL_SetAttribute,{attr,val})
end function

export constant xSDL_GL_GetAttribute = define_c_func(sdl,"+SDL_GL_GetAttribute",{C_INT,C_POINTER},C_INT)

public function SDL_GL_GetAttribute(atom attr,atom val)
	return c_func(xSDL_GL_GetAttribute,{attr,val})
end function

export constant xSDL_GL_CreateContext = define_c_func(sdl,"+SDL_GL_CreateContext",{C_POINTER},C_INT)

public function SDL_GL_CreateContext(atom win)
	return c_func(xSDL_GL_CreateContext,{win})
end function

export constant xSDL_GL_MakeCurrent = define_c_func(sdl,"+SDL_GL_MakeCurrent",{C_POINTER,C_INT},C_INT)

public function SDL_GL_MakeCurrent(atom win,atom ctx)
	return c_func(xSDL_GL_MakeCurrent,{win,ctx})
end function

export constant xSDL_GL_GetCurrentWindow = define_c_func(sdl,"+SDL_GL_GetCurrentWindow",{},C_POINTER)

public function SDL_GL_GetCurrentWindow()
	return c_func(xSDL_GL_GetCurrentWindow,{})
end function

export constant xSDL_GL_GetCurrentContext = define_c_func(sdl,"+SDL_GL_GetCurrentContext",{},C_INT)

public function SDL_GL_GetCurrentContext()
	return c_func(xSDL_GL_GetCurrentContext,{})
end function

export constant xSDL_GL_GetDrawableSize = define_c_proc(sdl,"+SDL_GL_GetDrawableSize",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GL_GetDrawableSize(atom win,atom w,atom h)
	c_proc(xSDL_GL_GetDrawableSize,{win,w,h})
end procedure

export constant xSDL_GL_SetSwapInterval = define_c_func(sdl,"+SDL_GL_SetSwapInterval",{C_INT},C_INT)

public function SDL_GL_SetSwapInterval(atom i)
	return c_func(xSDL_GL_SetSwapInterval,{i})
end function

export constant xSDL_GL_GetSwapInterval = define_c_func(sdl,"+SDL_GL_GetSwapInterval",{},C_INT)

public function SDL_GL_GetSwapInterval()
	return c_func(xSDL_GL_GetSwapInterval,{})
end function

export constant xSDL_GL_SwapWindow = define_c_proc(sdl,"+SDL_GL_SwapWindow",{C_POINTER})

public procedure SDL_GL_SwapWindow(atom win)
	c_proc(xSDL_GL_SwapWindow,{win})
end procedure

export constant xSDL_GL_DeleteContext = define_c_proc(sdl,"+SDL_GL_DeleteContext",{C_INT})

public procedure SDL_GL_DeleteContext(atom ctx)
	c_proc(xSDL_GL_DeleteContext,{ctx})
end procedure

public constant xSDL_GetWindowSizeInPixels = define_c_proc(sdl,"+SDL_GetWindowSizeInPixels",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_GetWindowSizeInPixels(atom win,atom w,atom h)
	c_proc(xSDL_GetWindowSizeInPixels,{win,w,h})
end procedure
­14.11