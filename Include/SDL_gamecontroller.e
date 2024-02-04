include std/ffi.e

include SDL_error.e
include SDL_rwops.e
include SDL_sensor.e
include SDL_joystick.e

include sdl.e

public enum type SDL_GameControllerType
	SDL_CONTROLLER_TYPE_UNKNOWN = 0,
    SDL_CONTROLLER_TYPE_XBOX360,
    SDL_CONTROLLER_TYPE_XBOXONE,
    SDL_CONTROLLER_TYPE_PS3,
    SDL_CONTROLLER_TYPE_PS4,
    SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_PRO,
    SDL_CONTROLLER_TYPE_VIRTUAL,
    SDL_CONTROLLER_TYPE_PS5,
    SDL_CONTROLLER_TYPE_AMAZON_LUNA,
    SDL_CONTROLLER_TYPE_GOOGLE_STADIA,
    SDL_CONTROLLER_TYPE_NVIDIA_SHIELD,
    SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_LEFT,
    SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_RIGHT,
    SDL_CONTROLLER_TYPE_NINTENDO_SWITCH_JOYCON_PAIR,
    SDL_CONTROLLER_TYPE_MAX
end type

public enum type SDL_GameControllerBindType
	SDL_CONTROLLER_BINDTYPE_NONE = 0,
    SDL_CONTROLLER_BINDTYPE_BUTTON,
    SDL_CONTROLLER_BINDTYPE_AXIS,
    SDL_CONTROLLER_BINDTYPE_HAT
end type

public constant SDL_GameControllerButtonBind = define_c_union({
	C_INT, --bindtype
	C_INT, --button
	C_INT, --axis
	C_INT, --hat
	C_INT --hat_mask
})

export constant xSDL_GameControllerAddMappingsFromRW = define_c_func(sdl,"+SDL_GameControllerAddMappingsFromRW",{C_POINTER,C_INT},C_INT)

public function SDL_GameControllerAddMappingsFromRW(atom rw,atom freerw)
	return c_func(xSDL_GameControllerAddMappingsFromRW,{rw,freerw})
end function

export constant xSDL_GameControllerAddMappingsFromFile = define_c_func(sdl,"+SDL_GameControllerAddMappingsFromFile",{C_POINTER},C_INT)

public function SDL_GameControllerAddMappingsFromFile(sequence file)
	return SDL_GameControllerAddMappingsFromRW(SDL_RWFromFile(file,"r"),1)
end function

export constant xSDL_GameControllerAddMapping = define_c_func(sdl,"+SDL_GameControllerAddMapping",{C_STRING},C_INT)

public function SDL_GameControllerAddMapping(sequence mapsz)
	return c_func(xSDL_GameControllerAddMapping,{mapsz})
end function

export constant xSDL_GameControllerNumMappings = define_c_func(sdl,"+SDL_GameControllerNumMappings",{},C_INT)

public function SDL_GameControllerNumMappings()
	return c_func(xSDL_GameControllerNumMappings,{})
end function

export constant xSDL_GameControllerMappingForIndex = define_c_func(sdl,"+SDL_GameControllerMappingForIndex",{C_INT},C_STRING)

public function SDL_GameControllerMappingForIndex(atom idx)
	return c_func(xSDL_GameControllerMappingForIndex,{idx})
end function

export constant xSDL_GameControllerMappingForGUID = define_c_func(sdl,"+SDL_GameControllerMappingForGUID",{C_INT},C_STRING)

public function SDL_GameControllerMappingForGUID(atom guid)
	return c_func(xSDL_GameControllerMappingForGUID,{guid})
end function

export constant xSDL_GameControllerMapping = define_c_func(sdl,"+SDL_GameControllerMapping",{C_POINTER},C_STRING)

public function SDL_GameControllerMapping(atom gc)
	return c_func(xSDL_GameControllerMapping,{gc})
end function

export constant xSDL_IsGameController = define_c_func(sdl,"+SDL_IsGameController",{C_INT},C_BOOL)

public function SDL_IsGameController(atom idx)
	return c_func(xSDL_IsGameController,{idx})
end function

export constant xSDL_GameControllerNameForIndex = define_c_func(sdl,"+SDL_GameControllerNameForIndex",{C_INT},C_STRING)

public function SDL_GameControllerNameForIndex(atom idx)
	return c_func(xSDL_GameControllerNameForIndex,{idx})
end function

export constant xSDL_GameControllerPathForIndex = define_c_func(sdl,"+SDL_GameControllerPathForIndex",{C_INT},C_STRING)

public function SDL_GameControllerPathForIndex(atom idx)
	return c_func(xSDL_GameControllerPathForIndex,{idx})
end function

export constant xSDL_GameControllerTypeForIndex = define_c_func(sdl,"+SDL_GameControllerTypeForIndex",{C_INT},C_INT)

public function SDL_GameControllerTypeForIndex(atom idx)
	return c_func(xSDL_GameControllerTypeForIndex,{idx})
end function

export constant xSDL_GameControllerMappingForDeviceIndex = define_c_func(sdl,"+SDL_GameControllerMappingForDeviceIndex",{C_INT},C_STRING)

public function SDL_GameControllerMappingForDeviceIndex(atom idx)
	return c_func(xSDL_GameControllerMappingForDeviceIndex,{idx})
end function

export constant xSDL_GameControllerOpen = define_c_func(sdl,"+SDL_GameControllerOpen",{C_INT},C_POINTER)

public function SDL_GameControllerOpen(atom idx)
	return c_func(xSDL_GameControllerOpen,{idx})
end function

export constant xSDL_GameControllerFromInstanceID = define_c_func(sdl,"+SDL_GameControllerFromInstanceID",{C_INT},C_POINTER)

public function SDL_GameControllerFromInstanceID(atom id)
	return c_func(xSDL_GameControllerFromInstanceID,{id})
end function

export constant xSDL_GameControllerFromPlayerIndex = define_c_func(sdl,"+SDL_GameControllerFromPlayerIndex",{C_INT},C_POINTER)

public function SDL_GameControllerFromPlayerIndex(atom idx)
	return c_func(xSDL_GameControllerFromPlayerIndex,{idx})
end function

export constant xSDL_GameControllerName = define_c_func(sdl,"+SDL_GameControllerName",{C_POINTER},C_STRING)

public function SDL_GameControllerName(atom gc)
	return c_func(xSDL_GameControllerName,{gc})
end function

export constant xSDL_GameControllerPath = define_c_func(sdl,"+SDL_GameControllerPath",{C_POINTER},C_STRING)

public function SDL_GameControllerPath(atom gc)
	return c_func(xSDL_GameControllerPath,{gc})
end function

export constant xSDL_GameControllerGetType = define_c_func(sdl,"+SDL_GameControllerGetType",{C_POINTER},C_INT)

public function SDL_GameControllerGetType(atom gc)
	return c_func(xSDL_GameControllerGetType,{gc})
end function

export constant xSDL_GameControllerGetPlayerIndex = define_c_func(sdl,"+SDL_GameControllerGetPlayerIndex",{C_POINTER},C_INT)

public function SDL_GameControllerGetPlayerIndex(atom gc)
	return c_func(xSDL_GameControllerGetPlayerIndex,{gc})
end function

export constant xSDL_GameControllerSetPlayerIndex = define_c_proc(sdl,"+SDL_GameControllerSetPlayerIndex",{C_POINTER,C_INT})

public procedure SDL_GameControllerSetPlayerIndex(atom gc,atom idx)
	c_proc(xSDL_GameControllerSetPlayerIndex,{gc,idx})
end procedure

export constant xSDL_GameControllerGetVendor = define_c_func(sdl,"+SDL_GameControllerGetVendor",{C_POINTER},C_UINT)

public function SDL_GameControllerGetVendor(atom gc)
	return c_func(xSDL_GameControllerGetVendor,{gc})
end function

export constant xSDL_GameControllerGetProduct = define_c_func(sdl,"+SDL_GameControllerGetProduct",{C_POINTER},C_UINT)

public function SDL_GameControllerGetProduct(atom gc)
	return c_func(xSDL_GameControllerGetProduct,{gc})
end function

export constant xSDL_GameControllerGetProductVersion = define_c_func(sdl,"+SDL_GameControllerGetProductVersion",{C_POINTER},C_UINT)

public function SDL_GameControllerGetProductVersion(atom gc)
	return c_func(xSDL_GameControllerGetProductVersion,{gc})
end function

export constant xSDL_GameControllerGetFirmwareVersion = define_c_func(sdl,"+SDL_GameControllerGetFrimwareVersion",{C_POINTER},C_UINT)

public function SDL_GameControllerGetFirmwareVersion(atom gc)
	return c_func(xSDL_GameControllerGetFirmwareVersion,{gc})
end function

export constant xSDL_GameControllerGetSerial = define_c_func(sdl,"+SDL_GameControllerGetSerial",{C_POINTER},C_STRING)

public function SDL_GameControllerGetSerial(atom gc)
	return c_func(xSDL_GameControllerGetSerial,{gc})
end function

export constant xSDL_GameControllerGetAttached = define_c_func(sdl,"+SDL_GameControllerGetAttached",{C_POINTER},C_BOOL)

public function SDL_GameControllerGetAttached(atom gc)
	return c_func(xSDL_GameControllerGetAttached,{gc})
end function

export constant xSDL_GameControllerGetJoystick = define_c_func(sdl,"+SDL_GameControllerGetJoystick",{C_POINTER},C_POINTER)

public function SDL_GameControllerGetJoystick(atom gc)
	return c_func(xSDL_GameControllerGetJoystick,{gc})
end function

export constant xSDL_GameControllerEventState = define_c_func(sdl,"+SDL_GameControllerEventState",{C_INT},C_INT)

public function SDL_GameControllerEventState(atom st)
	return c_func(xSDL_GameControllerEventState,{st})
end function

export constant xSDL_GameControllerUpdate = define_c_proc(sdl,"+SDL_GameControllerUpdate",{})

public procedure SDL_GameControllerUpdate()
	c_proc(xSDL_GameControllerUpdate,{})
end procedure

public enum type SDL_GameControllerAxis
	SDL_CONTROLLER_AXIS_INVALID = -1,
	SDL_CONTROLLER_AXIS_LEFTX = 0,
	SDL_CONTROLLER_AXIS_LEFTY,
	SDL_CONTROLLER_AXIS_RIGHTX,
	SDL_CONTROLLER_AXIS_RIGHTY,
	SDL_CONTROLLER_AXIS_TRIGGERLEFT,
	SDL_CONTROLLER_AXIS_TRIGGERRIGHT,
	SDL_CONTROLLER_AXIS_MAX
end type

export constant xSDL_GameControllerGetAxisFromString = define_c_func(sdl,"+SDL_GameControllerGetAxisFromString",{C_STRING},C_INT)

public function SDL_GameControllerGetAxisFromString(sequence str)
	return c_func(xSDL_GameControllerGetAxisFromString,{str})
end function

export constant xSDL_GameControllerGetStringForAxis = define_c_func(sdl,"+SDL_GameControllerGetStringForAxis",{C_INT},C_STRING)

public function SDL_GameControllerGetStringForAxis(SDL_GameControllerAxis axis)
	return c_func(xSDL_GameControllerGetStringForAxis,{axis})
end function

export constant xSDL_GameControllerGetBindForAxis = define_c_func(sdl,"+SDL_GameControllerGetBindForAxis",{C_POINTER,C_INT},SDL_GameControllerButtonBind)

public function SDL_GameControllerGetBindForAxis(atom gc,SDL_GameControllerAxis axis)
	return c_func(xSDL_GameControllerGetBindForAxis,{gc,axis})
end function

export constant xSDL_GameControllerHasAxis = define_c_func(sdl,"+SDL_GameControllerHasAxis",{C_POINTER,C_INT},C_BOOL)

public function SDL_GameControllerHasAxis(atom gc,SDL_GameControllerAxis axis)
	return c_func(xSDL_GameControllerHasAxis,{gc,axis})
end function

export constant xSDL_GameControllerGetAxis = define_c_func(sdl,"+SDL_GameControllerGetAxis",{C_POINTER,C_INT},C_INT)

public function SDL_GameControllerGetAxis(atom gc,SDL_GameControllerAxis axis)
	return c_func(xSDL_GameControllerGetAxis,{gc,axis})
end function

public enum type SDL_GameControllerButton
	SDL_CONTROLLER_BUTTON_INVALID = -1,
    SDL_CONTROLLER_BUTTON_A = 0,
    SDL_CONTROLLER_BUTTON_B,
    SDL_CONTROLLER_BUTTON_X,
    SDL_CONTROLLER_BUTTON_Y,
    SDL_CONTROLLER_BUTTON_BACK,
    SDL_CONTROLLER_BUTTON_GUIDE,
    SDL_CONTROLLER_BUTTON_START,
    SDL_CONTROLLER_BUTTON_LEFTSTICK,
    SDL_CONTROLLER_BUTTON_RIGHTSTICK,
    SDL_CONTROLLER_BUTTON_LEFTSHOULDER,
    SDL_CONTROLLER_BUTTON_RIGHTSHOULDER,
    SDL_CONTROLLER_BUTTON_DPAD_UP,
    SDL_CONTROLLER_BUTTON_DPAD_DOWN,
    SDL_CONTROLLER_BUTTON_DPAD_LEFT,
    SDL_CONTROLLER_BUTTON_DPAD_RIGHT,
    SDL_CONTROLLER_BUTTON_MISC1,    --/* Xbox Series X share button, PS5 microphone button, Nintendo Switch Pro capture button, Amazon Luna microphone button */
    SDL_CONTROLLER_BUTTON_PADDLE1,  
    SDL_CONTROLLER_BUTTON_PADDLE2, 
    SDL_CONTROLLER_BUTTON_PADDLE3,  
    SDL_CONTROLLER_BUTTON_PADDLE4,  
    SDL_CONTROLLER_BUTTON_TOUCHPAD, 
    SDL_CONTROLLER_BUTTON_MAX
end type

export constant xSDL_GameControllerGetButtonFromString = define_c_func(sdl,"+SDL_GameControllerGetButtonFromString",{C_STRING},C_INT)

public function SDL_GameControllerGetButtonFromString(sequence str)
	return c_func(xSDL_GameControllerGetButtonFromString,{str})
end function

export constant xSDL_GameControllerGetStringForButton = define_c_func(sdl,"+SDL_GameControllerGetStringForButton",{C_INT},C_STRING)

public function SDL_GameControllerGetStringForButton(SDL_GameControllerButton btn)
	return c_func(xSDL_GameControllerGetStringForButton,{btn})
end function

export constant xSDL_GameControllerGetBindForButton = define_c_func(sdl,"+SDL_GameControllerGetBindForButton",{C_POINTER,C_INT},SDL_GameControllerButtonBind)

public function SDL_GameControllerGetBindForButton(atom gc,SDL_GameControllerButton btn)
	return c_func(xSDL_GameControllerGetBindForButton,{gc,btn})
end function

export constant xSDL_GameControllerHasButton = define_c_func(sdl,"+SDL_GameControllerHasButton",{C_POINTER,C_INT},C_BOOL)

public function SDL_GameControllerHasButton(atom gc,SDL_GameControllerButton btn)
	return c_func(xSDL_GameControllerHasButton,{gc,btn})
end function

export constant xSDL_GameControllerGetButton = define_c_func(sdl,"+SDL_GameControllerGetButton",{C_POINTER,C_INT},C_UINT)

public function SDL_GameControllerGetButton(atom gc,SDL_GameControllerButton btn)
	return c_func(xSDL_GameControllerGetButton,{gc,btn})
end function

export constant xSDL_GameControllerGetNumTouchpads = define_c_func(sdl,"+SDL_GameControllerGetNumTouchpads",{C_POINTER},C_INT)

public function SDL_GameControllerGetNumTouchpads(atom gc)
	return c_func(xSDL_GameControllerGetNumTouchpads,{gc})
end function

export constant xSDL_GameControllerGetNumTouchpadFingers = define_c_func(sdl,"+SDL_GameControllerGetNumTouchpadFingers",{C_POINTER,C_INT},C_INT)

public function SDL_GameControllerGetNumTouchpadFingers(atom gc,atom tp)
	return c_func(xSDL_GameControllerGetNumTouchpadFingers,{gc,tp})
end function

export constant xSDL_GameControllerGetTouchpadFinger = define_c_func(sdl,"+SDL_GameControllerGetTouchpadFinger",{C_POINTER,C_INT,C_INT,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GameControllerGetTouchpadFinger(atom gc,atom tp,atom fing,atom st,atom x,atom y,atom pres)
	return c_func(xSDL_GameControllerGetTouchpadFinger,{gc,tp,fing,st,x,y,pres})
end function

export constant xSDL_GameControllerHasSensor = define_c_func(sdl,"+SDL_GameControllerHasSensor",{C_POINTER,C_INT},C_BOOL)

public function SDL_GameControllerHasSensor(atom gc,SDL_SensorType xtype)
	return c_func(xSDL_GameControllerHasSensor,{gc,xtype})
end function

export constant xSDL_GameControllerSetSensorEnabled = define_c_func(sdl,"+SDL_GameControllerSetSensorEnabled",{C_POINTER,C_INT,C_BOOL},C_INT)

public function SDL_GameControllerSetSensorEnabled(atom gc,SDL_SensorType stype,atom en)
	return c_func(xSDL_GameControllerSetSensorEnabled,{gc,stype,en})
end function

export constant xSDL_GameControllerIsSensorEnabled = define_c_func(sdl,"+SDL_GameControllerIsSensorEnabled",{C_POINTER,C_INT},C_BOOL)

public function SDL_GameControllerIsSensorEnabled(atom gc,SDL_SensorType stype)
	return c_func(xSDL_GameControllerIsSensorEnabled,{gc,stype})
end function

export constant xSDL_GameControllerGetSensorDataRate = define_c_func(sdl,"+SDL_GameControllerGetSensorDataRate",{C_POINTER,C_INT},C_FLOAT)

public function SDL_GameControllerGetSensorDataRate(atom gc,SDL_SensorType stype)
	return c_func(xSDL_GameControllerGetSensorDataRate,{gc,stype})
end function

export constant xSDL_GameControllerGetSensorData = define_c_func(sdl,"+SDL_GameControllerGetSensorData",{C_POINTER,C_INT,C_POINTER,C_INT},C_INT)

public function SDL_GameControllerGetSensorData(atom gc,SDL_SensorType stype,atom data,atom num)
	return c_func(xSDL_GameControllerGetSensorData,{gc,stype,data,num})
end function

export constant xSDL_GameControllerRumble = define_c_func(sdl,"+SDL_GameControllerRumble",{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_GameControllerRumble(atom gc,atom low,atom high,atom ms)
	return c_func(xSDL_GameControllerRumble,{gc,low,high,ms})
end function

export constant xSDL_GameControllerRumbleTriggers = define_c_func(sdl,"+SDL_GameControllerRumbleTriggers",{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_GameControllerRumbleTriggers(atom gc,atom left,atom right,atom ms)
	return c_func(xSDL_GameControllerRumbleTriggers,{gc,left,right,ms})
end function

export constant xSDL_GameControllerHasLED = define_c_func(sdl,"+SDL_GameControllerHasLED",{C_POINTER},C_BOOL)

public function SDL_GameControllerHasLED(atom gc)
	return c_func(xSDL_GameControllerHasLED,{gc})
end function

export constant xSDL_GameControllerHasRumble = define_c_func(sdl,"+SDL_GameControllerHasRumble",{C_POINTER},C_BOOL)

public function SDL_GameControllerHasRumble(atom gc)
	return c_func(xSDL_GameControllerHasRumble,{gc})
end function

export constant xSDL_GameControllerHasRumbleTriggers = define_c_func(sdl,"+SDL_GameControllerHasRumbleTriggers",{C_POINTER},C_BOOL)

public function SDL_GameControllerHasRumbleTriggers(atom gc)
	return c_func(xSDL_GameControllerHasRumbleTriggers,{gc})
end function

export constant xSDL_GameControllerSetLED = define_c_func(sdl,"+SDL_GameControllerSetLED",{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_GameControllerSetLED(atom gc,atom r,atom g,atom b)
	return c_func(xSDL_GameControllerSetLED,{gc,r,g,b})
end function

export constant xSDL_GameControllerSendEffect = define_c_func(sdl,"+SDL_GameControllerSendEffect",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_GameControllerSendEffect(atom gc,atom data,atom size)
	return c_func(xSDL_GameControllerSendEffect,{gc,data,size})
end function

export constant xSDL_GameControllerClose = define_c_proc(sdl,"+SDL_GameControllerClose",{C_POINTER})

public procedure SDL_GameControllerClose(atom gc)
	c_proc(xSDL_GameControllerClose,{gc})
end procedure

export constant xSDL_GameControllerGetAppleSFSymbolsNameForButton = define_c_func(sdl,"+SDL_GameControllerGetAppleSFSymbolsNameForButton",{C_POINTER,C_INT},C_STRING)

public function SDL_GameControllerGetAppleSFSymbolsNameForButton(atom gc,SDL_GameControllerButton btn)
	return c_func(xSDL_GameControllerGetAppleSFSymbolsNameForButton,{gc,btn})
end function

export constant xSDL_GameControllerGetAppleSFSymbolsNameForAxis = define_c_func(sdl,"+SDL_GameControllerGetAppleSFSymbolsNameForAxis",{C_POINTER,C_INT},C_STRING)

public function SDL_GameControllerGetAppleSFSymbolsNameForAxis(atom gc,SDL_GameControllerAxis axis)
	return c_func(xSDL_GameControllerGetAppleSFSymbolsNameForAxis,{gc,axis})
end function

export constant xSDL_GameControllerGetSensorDataWithTimeStamp = define_c_func(sdl,"+SDL_GameControllerGetSensorDataWithTimeStamp",{C_POINTER,C_INT,C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_GameControllerGetSensorDataWithTimeStamp(atom gc,atom stype,atom ts,atom data,atom num)
	return c_func(xSDL_GameControllerGetSensorDataWithTimeStamp,{gc,stype,ts,data,num})
end function

public constant xSDL_GameControllerGetSteamHandle = define_c_func(sdl,"+SDL_GameControllerGetSteamHandle",{C_POINTER},C_UINT64)

public function SDL_GameControllerGetSteamHandle(atom gc)
	return c_func(xSDL_GameControllerGetSteamHandle,{gc})
end function
­431.54