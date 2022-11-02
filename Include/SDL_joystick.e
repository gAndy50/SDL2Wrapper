include std/ffi.e

include std/math.e

include SDL_error.e
include SDL_guid.e

include sdl.e

public enum type SDL_JoystickType
	SDL_JOYSTICK_TYPE_UNKNOWN = 0,
    SDL_JOYSTICK_TYPE_GAMECONTROLLER,
    SDL_JOYSTICK_TYPE_WHEEL,
    SDL_JOYSTICK_TYPE_ARCADE_STICK,
    SDL_JOYSTICK_TYPE_FLIGHT_STICK,
    SDL_JOYSTICK_TYPE_DANCE_PAD,
    SDL_JOYSTICK_TYPE_GUITAR,
    SDL_JOYSTICK_TYPE_DRUM_KIT,
    SDL_JOYSTICK_TYPE_ARCADE_PAD,
    SDL_JOYSTICK_TYPE_THROTTLE
end type

public enum type SDL_JoystickPowerLevel
	SDL_JOYSTICK_POWER_UNKNOWN = -1,
    SDL_JOYSTICK_POWER_EMPTY,   
    SDL_JOYSTICK_POWER_LOW,    
    SDL_JOYSTICK_POWER_MEDIUM,  
    SDL_JOYSTICK_POWER_FULL,    
    SDL_JOYSTICK_POWER_WIRED,
    SDL_JOYSTICK_POWER_MAX
end type

public constant SDL_IPHONE_MAX_GFORCE = 5.0

export constant xSDL_LockJoysticks = define_c_proc(sdl,"+SDL_LockJoysticks",{}),
				xSDL_UnlockJoysticks = define_c_proc(sdl,"+SDL_UnlockJoysticks",{})
				
public procedure SDL_LockJoysticks()
	c_proc(xSDL_LockJoysticks,{})
end procedure

public procedure SDL_UnlockJoysticks()
	c_proc(xSDL_UnlockJoysticks,{})
end procedure

export constant xSDL_NumJoysticks = define_c_func(sdl,"+SDL_NumJoysticks",{},C_INT)

public function SDL_NumJoysticks()
	return c_func(xSDL_NumJoysticks,{})
end function

export constant xSDL_JoystickNameForIndex = define_c_func(sdl,"+SDL_JoystickNameForIndex",{C_INT},C_STRING)

public function SDL_JoystickNameForIndex(atom idx)
	return c_func(xSDL_JoystickNameForIndex,{idx})
end function

export constant xSDL_JoystickPathForIndex = define_c_func(sdl,"+SDL_JoystickPathForIndex",{C_INT},C_STRING)

public function SDL_JoystickPathForIndex(atom idx)
	return c_func(xSDL_JoystickPathForIndex,{idx})
end function

export constant xSDL_JoystickGetDevicePlayerIndex = define_c_func(sdl,"+SDL_JoystickGetDevicePlayerIndex",{C_INT},C_INT)

public function SDL_JoystickGetDevicePlayerIndex(atom idx)
	return c_func(xSDL_JoystickGetDevicePlayerIndex,{idx})
end function

export constant xSDL_JoystickGetDeviceGUID = define_c_func(sdl,"+SDL_JoystickGetDeviceGUID",{C_INT},C_POINTER)

public function SDL_JoystickGetDeviceGUID(atom idx)
	return c_func(xSDL_JoystickGetDeviceGUID,{idx})
end function

export constant xSDL_JoystickGetDeviceVendor = define_c_func(sdl,"+SDL_JoystickGetDeviceVendor",{C_INT},C_UINT)

public function SDL_JoystickGetDeviceVendor(atom idx)
	return c_func(xSDL_JoystickGetDeviceVendor,{idx})
end function

export constant xSDL_JoystickGetDeviceProduct = define_c_func(sdl,"+SDL_JoystickGetDeviceProduct",{C_INT},C_UINT)

public function SDL_JoystickGetDeviceProduct(atom idx)
	return c_func(xSDL_JoystickGetDeviceProduct,{idx})
end function

export constant xSDL_JoystickGetDeviceProductVersion = define_c_func(sdl,"+SDL_JoystickGetDeviceProductVersion",{C_INT},C_UINT)

public function SDL_JoystickGetDeviceProductVersion(atom idx)
	return c_func(xSDL_JoystickGetDeviceProductVersion,{idx})
end function

export constant xSDL_JoystickGetDeviceType = define_c_func(sdl,"+SDL_JoystickGetDeviceType",{C_INT},C_INT)

public function SDL_JoystickGetDeviceType(atom idx)
	return c_func(xSDL_JoystickGetDeviceType,{idx})
end function

export constant xSDL_JoystickGetDeviceInstanceID = define_c_func(sdl,"+SDL_JoystickGetDeviceInstanceID",{C_INT},C_INT)

public function SDL_JoystickGetDeviceInstanceID(atom idx)
	return c_func(xSDL_JoystickGetDeviceInstanceID,{idx})
end function

export constant xSDL_JoystickOpen = define_c_func(sdl,"+SDL_JoystickOpen",{C_INT},C_POINTER)

public function SDL_JoystickOpen(atom idx)
	return c_func(xSDL_JoystickOpen,{idx})
end function

export constant xSDL_JoystickFromInstanceID = define_c_func(sdl,"+SDL_JoystickFromInstanceID",{C_INT},C_POINTER)

public function SDL_JoystickFromInstanceID(atom id)
	return c_func(xSDL_JoystickFromInstanceID,{id})
end function

export constant xSDL_JoystickFromPlayerIndex = define_c_func(sdl,"SDL_JoystickFromPlayerIndex",{C_INT},C_POINTER)

public function SDL_JoystickFromPlayerIndex(atom idx)
	return c_func(xSDL_JoystickFromPlayerIndex,{idx})
end function

export constant xSDL_JoystickAttachVirtual = define_c_func(sdl,"SDL_JoystickAttachVirtual",{C_INT,C_INT,C_INT,C_INT},C_INT)

public function SDL_JoystickAttachVirtual(SDL_JoystickType jtype,atom axes,atom btns,atom hats)
	return c_func(xSDL_JoystickAttachVirtual,{jtype,axes,btns,hats})
end function

public constant SDL_VirtualJoystickDesc = define_c_type({
	C_UINT, --version
	C_UINT, --type
	C_UINT, --naxes
	C_UINT, --nbuttons
	C_UINT, --nhats
	C_UINT, --vendor_id
	C_UINT, --product_id
	C_UINT, --padding
	C_UINT, --button_mask
	C_UINT, --axis_mask
	C_STRING, --name
	C_POINTER --userdata
})

public function Update(atom update,atom data)
	return 0
end function

public function SetPlayerIndex(atom data,atom player_index)
	return 0
end function

public function Rumble(atom data,atom low_freq,atom high_freq)
	return 0
end function

public function RumbleTriggers(atom data,atom left,atom right)
	return 0
end function

public function SetLED(atom data,atom r,atom g,atom b)
	return 0
end function

public function SendEffect(atom udata,atom data,atom size)
	return 0
end function

public constant MY_VIRTUAL_JOYSTICK = allocate_struct( SDL_VirtualJoystickDesc, {
	call_back(routine_id("Update"),{C_POINTER}),
	call_back(routine_id("SetPlayerIndex"),{C_POINTER,C_INT}),
	call_back(routine_id("Rumble"),{C_POINTER,C_UINT,C_UINT},C_INT),
	call_back(routine_id("RumbleTriggers"),{C_POINTER,C_UINT,C_UINT},C_INT),
	call_back(routine_id("SetLED"),{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT),
	call_back(routine_id("SendEffect"),{C_POINTER,C_POINTER,C_INT},C_INT)
})

public constant SDL_VIRTUAL_JOYSTICK_DESC_VERISON = 1

export constant xSDL_JoystickAttachVirtualEx = define_c_func(sdl,"+SDL_JoystickAttachVirutalEx",{SDL_VirtualJoystickDesc},C_INT)

public function SDL_JoystickAttachVirtualEx(sequence desc)
	return c_func(xSDL_JoystickAttachVirtualEx,{desc})
end function

export constant xSDL_JoystickDetachVirtual = define_c_func(sdl,"+SDL_JoystickDetachVirtual",{C_INT},C_INT)

public function SDL_JoystickDetachVirtual(atom idx)
	return c_func(xSDL_JoystickDetachVirtual,{idx})
end function

export constant xSDL_JoystickIsVirtual = define_c_func(sdl,"+SDL_JoystickIsVirtual",{C_INT},C_BOOL)

public function SDL_JoystickIsVirtual(atom idx)
	return c_func(xSDL_JoystickIsVirtual,{idx})
end function

export constant xSDL_JoystickSetVirtualAxis = define_c_func(sdl,"+SDL_JoystickSetVirtualAxis",{C_POINTER,C_INT,C_INT},C_INT)

public function SDL_JoystickSetVirtualAxis(atom joy,atom axis,atom val)
	return c_func(xSDL_JoystickSetVirtualAxis,{joy,axis,val})
end function

export constant xSDL_JoystickSetVirtualButton = define_c_func(sdl,"+SDL_JoystickSetVirtualButton",{C_POINTER,C_INT,C_INT},C_INT)

public function SDL_JoystickSetVirtualButton(atom joy,atom btn,atom val)
	return c_func(xSDL_JoystickSetVirtualButton,{joy,btn,val})
end function

export constant xSDL_JoystickSetVirtualHat = define_c_func(sdl,"+SDL_JoystickSetVirtualHat",{C_POINTER,C_INT,C_INT},C_INT)

public function SDL_JoystickSetVirtualHat(atom joy,atom hat,atom val)
	return c_func(xSDL_JoystickSetVirtualHat,{joy,hat,val})
end function

export constant xSDL_JoystickName = define_c_func(sdl,"+SDL_JoystickName",{C_POINTER},C_STRING)

public function SDL_JoystickName(atom joy)
	return c_func(xSDL_JoystickName,{joy})
end function

export constant xSDL_JoystickPath = define_c_func(sdl,"+SDL_JoystickPath",{C_POINTER},C_STRING)

public function SDL_JoystickPath(atom joy)
	return c_func(xSDL_JoystickPath,{joy})
end function

export constant xSDL_JoystickGetPlayerIndex = define_c_func(sdl,"+SDL_JoystickGetPlayerIndex",{C_POINTER},C_INT)

public function SDL_JoystickGetPlayerIndex(atom joy)
	return c_func(xSDL_JoystickGetPlayerIndex,{joy})
end function

export constant xSDL_JoystickSetPlayerIndex = define_c_proc(sdl,"+SDL_JoystickSetPlayerIndex",{C_POINTER,C_INT})

public procedure SDL_JoystickSetPlayerIndex(atom joy,atom pidx)
	c_proc(xSDL_JoystickSetPlayerIndex,{joy,pidx})
end procedure

export constant xSDL_JoystickGetGUID = define_c_func(sdl,"+SDL_JoystickGetGUID",{C_POINTER},C_UINT)

public function SDL_JoystickGetGUID(atom joy)
	return c_func(xSDL_JoystickGetGUID,{joy})
end function

export constant xSDL_JoystickGetVendor = define_c_func(sdl,"+SDL_JoystickGetVendor",{C_POINTER},C_UINT)

public function SDL_JoystickGetVendor(atom joy)
	return c_func(xSDL_JoystickGetVendor,{joy})
end function

export constant xSDL_JoystickGetProduct = define_c_func(sdl,"+SDL_JoystickGetProduct",{C_POINTER},C_UINT)

public function SDL_JoystickGetProduct(atom joy)
	return c_func(xSDL_JoystickGetProduct,{joy})
end function

export constant xSDL_JoystickGetProductVersion = define_c_func(sdl,"+SDL_JoystickGetProductVersion",{C_POINTER},C_UINT)

public function SDL_JoystickGetProductVersion(atom joy)
	return c_func(xSDL_JoystickGetProductVersion,{joy})
end function

export constant xSDL_JoystickGetFirmwareVersion = define_c_func(sdl,"+SDL_JoystickGetFirmwareVersion",{C_POINTER},C_UINT)

public function SDL_JoystickGetFirmwareVersion(atom joy)
	return c_func(xSDL_JoystickGetFirmwareVersion,{joy})
end function

export constant xSDL_JoystickGetSerial = define_c_func(sdl,"+SDL_JoystickGetSerial",{C_POINTER},C_STRING)

public function SDL_JoystickGetSerial(atom joy)
	return c_func(xSDL_JoystickGetSerial,{joy})
end function

export constant xSDL_JoystickGetType = define_c_func(sdl,"+SDL_JoystickGetType",{C_POINTER},C_INT)

public function SDL_JoystickGetType(atom joy)
	return c_func(xSDL_JoystickGetType,{joy})
end function

export constant xSDL_JoystickGetGUIDString = define_c_proc(sdl,"+SDL_JoystickGetGUIDString",{C_INT,C_STRING,C_INT})

public procedure SDL_JoystickGetGUIDString(atom id,sequence psz,atom cbid)
	c_proc(xSDL_JoystickGetGUIDString,{id,psz,cbid})
end procedure

export constant xSDL_JoystickGetGUIDFromString = define_c_func(sdl,"+SDL_JoystickGetGUIDFromString",{C_STRING},C_INT)

public function SDL_JoystickGetGUIDFromString(sequence pch)
	return c_func(xSDL_JoystickGetGUIDFromString,{pch})
end function

export constant xSDL_JoystickGetAttached = define_c_func(sdl,"+SDL_JoystickGetAttached",{C_POINTER},C_BOOL)

public function SDL_JoystickGetAttached(atom joy)
	return c_func(xSDL_JoystickGetAttached,{joy})
end function

export constant xSDL_JoystickInstanceID = define_c_func(sdl,"+SDL_JoystickInstanceID",{C_POINTER},C_INT)

public function SDL_JoystickInstanceID(atom joy)
	return c_func(xSDL_JoystickInstanceID,{joy})
end function

export constant xSDL_JoystickNumAxes = define_c_func(sdl,"+SDL_JoystickNumAxes",{C_POINTER},C_INT)

public function SDL_JoystickNumAxes(atom joy)
	return c_func(xSDL_JoystickNumAxes,{joy})
end function

export constant xSDL_JoystickNumBalls = define_c_func(sdl,"+SDL_JoystickNumBalls",{C_POINTER},C_INT)

public function SDL_JoystickNumBalls(atom joy)
	return c_func(xSDL_JoystickNumBalls,{joy})
end function

export constant xSDL_JoystickNumHats = define_c_func(sdl,"+SDL_JoystickNumHats",{C_POINTER},C_INT)

public function SDL_JoystickNumHats(atom joy)
	return c_func(xSDL_JoystickNumHats,{joy})
end function

export constant xSDL_JoystickNumButtons = define_c_func(sdl,"+SDL_JoystickNumButtons",{C_POINTER},C_INT)

public function SDL_JoystickNumButtons(atom joy)
	return c_func(xSDL_JoystickNumButtons,{joy})
end function

export constant xSDL_JoystickUpdate = define_c_proc(sdl,"+SDL_JoystickUpdate",{})

public procedure SDL_JoystickUpdate()
	c_proc(xSDL_JoystickUpdate,{})
end procedure

export constant xSDL_JoystickEventState = define_c_func(sdl,"+SDL_JoystickEventState",{C_INT},C_INT)

public function SDL_JoystickEventState(atom s)
	return c_func(xSDL_JoystickEventState,{s})
end function

public constant SDL_JOYSTICK_AXIS_MAX = 32767
public constant SDL_JOYSTICK_AXIS_MIN = -32768

export constant xSDL_JoystickGetAxis = define_c_func(sdl,"+SDL_JoystickGetAxis",{C_POINTER,C_INT},C_INT)

public function SDL_JoystickGetAxis(atom joy,atom ax)
	return c_func(xSDL_JoystickGetAxis,{joy,ax})
end function

export constant xSDL_JoystickGetAxisInitialState = define_c_func(sdl,"+SDL_JoystickGetAxisInitialState",{C_POINTER,C_INT,C_POINTER},C_BOOL)

public function SDL_JoystickGetAxisInitialState(atom joy,atom ax,atom s)
	return c_func(xSDL_JoystickGetAxisInitialState,{joy,ax,s})
end function

public constant SDL_HAT_CENTERED = 0,
				SDL_HAT_UP = 1,
				SDL_HAT_RIGHT = 2,
				SDL_HAT_DOWN = 4,
				SDL_HAT_LEFT = 8,
				SDL_HAT_RIGHTUP = or_all({SDL_HAT_RIGHT,SDL_HAT_UP}),
				SDL_HAT_RIGHTDOWN = or_all({SDL_HAT_RIGHT,SDL_HAT_DOWN}),
				SDL_HAT_LEFTUP = or_all({SDL_HAT_LEFT,SDL_HAT_UP}),
				SDL_HAT_LEFTDOWN = or_all({SDL_HAT_LEFT,SDL_HAT_DOWN})
				
export constant xSDL_JoystickGetHat = define_c_func(sdl,"+SDL_JoystickGetHat",{C_POINTER,C_INT},C_UINT)

public function SDL_JoystickGetHat(atom joy,atom hat)
	return c_func(xSDL_JoystickGetHat,{joy,hat})
end function

export constant xSDL_JoystickGetBall = define_c_func(sdl,"+SDL_JoystickGetBall",{C_POINTER,C_INT,C_POINTER,C_POINTER},C_INT)

public function SDL_JoystickGetBall(atom joy,atom ball,atom x,atom y)
	return c_func(xSDL_JoystickGetBall,{joy,ball,x,y})
end function

export constant xSDL_JoystickGetButton = define_c_func(sdl,"+SDL_JoystickGetButton",{C_POINTER,C_INT},C_UINT)

public function SDL_JoystickGetButton(atom joy,atom btn)
	return c_func(xSDL_JoystickGetButton,{joy,btn})
end function

export constant xSDL_JoystickRumble = define_c_func(sdl,"+SDL_JoystickRumble",{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_JoystickRumble(atom joy,atom low,atom high,atom duration)
	return c_func(xSDL_JoystickRumble,{joy,low,high,duration})
end function

export constant xSDL_JoystickRumbleTriggers = define_c_func(sdl,"+SDL_JoystickRumbleTriggers",{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_JoystickRumbleTriggers(atom joy,atom left,atom right,atom duration)
	return c_func(xSDL_JoystickRumbleTriggers,{joy,left,right,duration})
end function

export constant xSDL_JoystickHasLED = define_c_func(sdl,"+SDL_JoystickHasLED",{C_POINTER},C_BOOL)

public function SDL_JoystickHasLED(atom joy)
	return c_func(xSDL_JoystickHasLED,{joy})
end function

export constant xSDL_JoystickHasRumble = define_c_func(sdl,"+SDL_JoystickHasRumble",{C_POINTER},C_BOOL)

public function SDL_JoystickHasRumble(atom joy)
	return c_func(xSDL_JoystickHasRumble,{joy})
end function

export constant xSDL_JoystickHasRumbleTriggers = define_c_func(sdl,"+SDL_JoystickHasRumbleTriggers",{C_POINTER},C_BOOL)

public function SDL_JoystickHasRumbleTriggers(atom joy)
	return c_func(xSDL_JoystickHasRumbleTriggers,{joy})
end function

export constant xSDL_JoystickSetLED = define_c_func(sdl,"+SDL_JoystickSetLED",{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_JoystickSetLED(atom joy,atom r,atom g,atom b)
	return c_func(xSDL_JoystickSetLED,{joy,r,g,b})
end function

export constant xSDL_JoystickSendEffect = define_c_func(sdl,"+SDL_JoystickSendEffect",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_JoystickSendEffect(atom joy,atom data,atom size)
	return c_func(xSDL_JoystickSendEffect,{joy,data,size})
end function

export constant xSDL_JoystickClose = define_c_proc(sdl,"+SDL_JoystickClose",{C_POINTER})

public procedure SDL_JoystickClose(atom joy)
	c_proc(xSDL_JoystickClose,{joy})
end procedure

export constant xSDL_JoystickCurrentPowerLevel = define_c_func(sdl,"+SDL_JoystickCurrentPowerLevel",{C_POINTER},C_INT)

public function SDL_JoystickCurrentPowerLevel(atom joy)
	return c_func(xSDL_JoystickCurrentPowerLevel,{joy})
end function
­391.111