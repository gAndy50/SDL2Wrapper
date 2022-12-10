include std/ffi.e
include std/math.e
include std/machine.e

include SDL_error.e
include SDL_endian.e
include SDL_mutex.e
include SDL_thread.e
include SDL_rwops.e

include sdl.e

public constant SDL_AUDIO_MASK_BITSIZE = 0xFF,
				SDL_AUDIO_MASK_DATATYPE = shift_bits(1,-8),
				SDL_AUDIO_MASK_ENDIAN = shift_bits(1,-12),
				SDL_AUDIO_MASK_SIGNED = shift_bits(1,-15),
				SDL_AUDIO_BITSIZE = SDL_AUDIO_MASK_BITSIZE,
				SDL_AUDIO_ISSIGNED = SDL_AUDIO_MASK_SIGNED
				
public constant AUDIO_U8 = 0x0008,
				AUDIO_S8 = 0x8008,
				AUDIO_U16LSB = 0x0010,
				AUDIO_S16LSB = 0x8010,
				AUDIO_U16MSB = 0x1010,
				AUDIO_S16MSB = 0x9010,
				AUDIO_U16 = AUDIO_U16LSB,
				AUDIO_S16 = AUDIO_S16LSB
				
public constant AUDIO_S32LSB = 0x8020,
				AUDIO_S32MSB = 0x9020,
				AUDIO_S32 = AUDIO_S32LSB
				
public constant AUDIO_F32LSB = 0x8120,
				AUDIO_F32MSB = 0x9120,
				AUDIO_F32 = AUDIO_F32LSB
				
public constant SDL_AUDIO_ALLOW_FREQUENCY_CHANGE = 1,
				SDL_AUDIO_ALLOW_FORMAT_CHANGE = 2,
				SDL_AUDIO_ALLOW_CHANNELS_CHANGE = 4,
				SDL_AUDIO_ALLOW_SAMPLES_CHANGE = 8,
				SDL_AUDIO_ALLOW_ANY_CHANGE = or_all({SDL_AUDIO_ALLOW_FREQUENCY_CHANGE,SDL_AUDIO_ALLOW_FORMAT_CHANGE,SDL_AUDIO_ALLOW_CHANNELS_CHANGE,SDL_AUDIO_ALLOW_SAMPLES_CHANGE})
				
public constant SDL_AudioSpec = define_c_type({
	C_INT, --freq
	C_INT, --audio format
	C_UINT8, --channels
	C_UINT8, --silence
	C_UINT16, --samples
	C_UINT16, --padding
	C_UINT32, --size
	C_POINTER, --callback
	C_POINTER --userdata
})

public constant SDL_AUDIOCVT_MAX_FILTERS = 9

public constant SDL_AudioCVT = define_c_type({
	C_INT, --needed
	C_POINTER, --src_format
	C_POINTER, --dst_format
	C_DOUBLE, --rate_incr
	C_POINTER, --buf
	C_INT, --len
	C_INT, --len_cvt
	C_INT, --len_mult
	C_DOUBLE, --len_ratio
	C_POINTER, --filter
	C_INT --filter_index
})

export constant xSDL_GetNumAudioDrivers = define_c_func(sdl,"+SDL_GetNumAudioDrivers",{},C_INT)

public function SDL_GetNumAudioDrivers()
	return c_func(xSDL_GetNumAudioDrivers,{})
end function

export constant xSDL_GetAudioDriver = define_c_func(sdl,"+SDL_GetAudioDriver",{C_INT},C_STRING)

public function SDL_GetAudioDriver(atom i)
	return c_func(xSDL_GetAudioDriver,{i})
end function

export constant xSDL_AudioInit = define_c_func(sdl,"+SDL_AudioInit",{C_STRING},C_INT)

public function SDL_AudioInit(sequence name)
	return c_func(xSDL_AudioInit,{name})
end function

export constant xSDL_AudioQuit = define_c_proc(sdl,"+SDL_AudioQuit",{})

public procedure SDL_AudioQuit()
	c_proc(xSDL_AudioQuit,{})
end procedure

export constant xSDL_GetCurrentAudioDriver = define_c_func(sdl,"+SDL_GetCurrentAudioDriver",{},C_STRING)

public function SDL_GetCurrentAudioDriver()
	return c_func(xSDL_GetCurrentAudioDriver,{})
end function

export constant xSDL_OpenAudio = define_c_func(sdl,"+SDL_OpenAudio",{C_POINTER,C_POINTER},C_INT)

public function SDL_OpenAudio(atom desired,atom obtained)
	desired = allocate_struct(SDL_AudioSpec)
	obtained = allocate_struct(SDL_AudioSpec)
	sequence res = peek_struct(desired,SDL_AudioSpec)
	sequence res2 = peek_struct(obtained,SDL_AudioSpec)
	free(desired)
	free(obtained)
	return c_func(xSDL_OpenAudio,{res,res2})
end function

export constant xSDL_GetNumAudioDevices = define_c_func(sdl,"+SDL_GetNumAudioDevices",{C_INT},C_INT)

public function SDL_GetNumAudioDevices(atom iscap)
	return c_func(xSDL_GetNumAudioDevices,{iscap})
end function

export constant xSDL_GetAudioDeviceName = define_c_func(sdl,"+SDL_GetAudioDeviceName",{C_INT,C_INT},C_STRING)

public function SDL_GetAudioDeviceName(atom i,atom iscap)
	return c_func(xSDL_GetAudioDeviceName,{i,iscap})
end function

export constant xSDL_GetAudioDeviceSpec = define_c_func(sdl,"+SDL_GetAudioDeviceSpec",{C_INT,C_INT,C_POINTER},C_INT)

public function SDL_GetAudioDeviceSpec(atom i,atom iscap,atom spec)
	spec = allocate_struct(SDL_AudioSpec)
	sequence res = peek_struct(spec,SDL_AudioSpec)
	free(spec)
	return c_func(xSDL_GetAudioDeviceSpec,{i,iscap,res})
end function

export constant xSDL_GetDefaultAudioInfo = define_c_func(sdl,"+SDL_GetDefaultAudioInfo",{C_STRING,C_POINTER,C_INT},C_INT)

public function SDL_GetDefaultAudioInfo(sequence name,atom spec,atom iscap)
	spec = allocate_struct(SDL_AudioSpec)
	sequence res = peek_struct(spec,SDL_AudioSpec)
	free(spec)
	return c_func(xSDL_GetDefaultAudioInfo,{name,res,iscap})
end function

export constant xSDL_OpenAudioDevice = define_c_func(sdl,"+SDL_OpenAudioDevice",{C_STRING,C_INT,C_POINTER,C_POINTER,C_INT},C_UINT)

public function SDL_OpenAudioDevice(sequence device,atom iscap,sequence desired,sequence obtained,atom allow)
	desired = allocate_struct(SDL_AudioSpec)
	obtained = allocate_struct(SDL_AudioSpec)
	sequence res = peek_struct(desired,SDL_AudioSpec)
	sequence res2 = peek_struct(obtained,SDL_AudioSpec)
	free(desired)
	free(obtained)
	return c_func(xSDL_OpenAudioDevice,{device,iscap,res,res2,allow})
end function

public enum type SDL_AudioStatus
	SDL_AUDIO_STOPPED = 0,
	SDL_AUDIO_PLAYING,
	SDL_AUDIO_PAUSED
end type

export constant xSDL_GetAudioStatus = define_c_func(sdl,"+SDL_GetAudioStatus",{},C_INT)

public function SDL_GetAudioStatus()
	return c_func(xSDL_GetAudioStatus,{})
end function

export constant xSDL_GetAudioDeviceStatus = define_c_func(sdl,"+SDL_GetAudioDeviceStatus",{C_UINT},C_INT)

public function SDL_GetAudioDeviceStatus(atom dev)
	return c_func(xSDL_GetAudioDeviceStatus,{dev})
end function

export constant xSDL_PauseAudio = define_c_proc(sdl,"+SDL_PauseAudio",{C_INT})

public procedure SDL_PauseAudio(atom pause)
	c_proc(xSDL_PauseAudio,{pause})
end procedure

export constant xSDL_PauseAudioDevice = define_c_proc(sdl,"+SDL_PauseAudioDevice",{C_UINT,C_INT})

public procedure SDL_PauseAudioDevice(atom dev,atom pause)
	c_proc(xSDL_PauseAudioDevice,{dev,pause})
end procedure

export constant xSDL_LoadWAV_RW = define_c_func(sdl,"+SDL_LoadWAV_RW",{C_POINTER,C_INT,C_POINTER,C_POINTER,C_POINTER},C_POINTER)

public function SDL_LoadWAV_RW(atom src,atom freesrc,atom spec,atom buf,atom len)
	spec = allocate_struct(SDL_AudioSpec)
	sequence res = peek_struct(spec,SDL_AudioSpec)
	free(spec)
	return c_func(xSDL_LoadWAV_RW,{src,freesrc,res,buf,len})
end function

--export constant xSDL_LoadWAV = define_c_func(sdl,"+SDL_LoadWAV",{C_POINTER,SDL_AudioSpec,C_POINTER,C_POINTER},SDL_AudioSpec)

--public function SDL_LoadWAV(sequence file,sequence spec,atom buf,atom len)
--	return SDL_LoadWAV_RW(SDL_RWFromFile(file,"rb",1),spec,buf,len)
--end function

export constant xSDL_FreeWAV = define_c_proc(sdl,"+SDL_FreeWAV",{C_POINTER})

public procedure SDL_FreeWAV(atom buf)
	c_proc(xSDL_FreeWAV,{buf})
end procedure

export constant xSDL_BuildAudioCVT = define_c_func(sdl,"+SDL_BuildAudioCVT",{C_POINTER,C_UINT,C_UINT,C_INT,C_UINT,C_UINT,C_INT},C_INT)

public function SDL_BuildAudioCVT(atom cvt,atom src_format,atom src_channels,atom src_rate,atom dst_format,atom dst_channels,atom dst_rate)
	cvt = allocate_struct(SDL_AudioCVT)
	sequence res = peek_struct(cvt,SDL_AudioCVT)
	free(cvt)
	return c_func(xSDL_BuildAudioCVT,{res,src_format,src_channels,src_rate,dst_format,dst_channels,dst_rate})
end function

export constant xSDL_ConvertAudio = define_c_func(sdl,"+SDL_ConvertAudio",{C_POINTER},C_INT)

public function SDL_ConvertAudio(atom cvt)
	cvt = allocate_struct(SDL_AudioCVT)
	sequence res = peek_struct(cvt,SDL_AudioCVT)
	free(cvt)
	return c_func(xSDL_ConvertAudio,{res})
end function

export constant xSDL_NewAudioStream = define_c_func(sdl,"+SDL_NewAudioStream",{C_UINT,C_UINT,C_INT,C_UINT,C_UINT,C_INT},C_POINTER)

public function SDL_NewAudioStream(atom src_format,atom src_channels,atom src_rate,atom dst_format,atom dst_channels,atom dst_rate)
	return c_func(xSDL_NewAudioStream,{src_format,src_channels,src_rate,dst_format,dst_channels,dst_rate})
end function

export constant xSDL_AudioStreamPut = define_c_func(sdl,"+SDL_AudioStreamPut",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_AudioStreamPut(atom str,atom buf,atom len)
	return c_func(xSDL_AudioStreamPut,{str,buf,len})
end function

export constant xSDL_AudioStreamGet = define_c_func(sdl,"+SDL_AudioStreamGet",{C_POINTER,C_POINTER,C_INT},C_INT)

public function SDL_AudioStreamGet(atom str,atom buf,atom len)
	return c_func(xSDL_AudioStreamGet,{str,buf,len})
end function

export constant xSDL_AudioStreamAvailable = define_c_func(sdl,"+SDL_AudioStreamAvailable",{C_POINTER},C_INT)

public function SDL_AudioStreamAvailable(atom str)
	return c_func(xSDL_AudioStreamAvailable,{str})
end function

export constant xSDL_AudioStreamFlush = define_c_func(sdl,"+SDL_AudioStreamFlush",{C_POINTER},C_INT)

public function SDL_AudioStreamFlush(atom str)
	return c_func(xSDL_AudioStreamFlush,{str})
end function

export constant xSDL_AudioStreamClear = define_c_proc(sdl,"+SDL_AudioStreamClear",{C_POINTER})

public procedure SDL_AudioStreamClear(atom str)
	c_proc(xSDL_AudioStreamClear,{str})
end procedure

export constant xSDL_FreeAudioStream = define_c_proc(sdl,"+SDL_FreeAudioStream",{C_POINTER})

public procedure SDL_FreeAudioStream(atom str)
	c_proc(xSDL_FreeAudioStream,{str})
end procedure

public constant SDL_MIX_MAXVOLUME = 128

export constant xSDL_MixAudio = define_c_proc(sdl,"+SDL_MixAudio",{C_POINTER,C_POINTER,C_UINT,C_INT})

public procedure SDL_MixAudio(atom dst,atom src,atom len,atom vol)
	c_proc(xSDL_MixAudio,{dst,src,len,vol})
end procedure

export constant xSDL_MixAudioFormat = define_c_proc(sdl,"+SDL_MixAudioFormat",{C_POINTER,C_POINTER,C_UINT,C_UINT,C_INT})

public procedure SDL_MixAudioFormat(atom dst,atom src,atom format,atom len,atom vol)
	c_proc(xSDL_MixAudioFormat,{dst,src,format,len,vol})
end procedure

export constant xSDL_QueueAudio = define_c_func(sdl,"+SDL_QueueAudio",{C_UINT,C_POINTER,C_UINT},C_INT)

public function SDL_QueueAudio(atom dev,atom dat,atom len)
	return c_func(xSDL_QueueAudio,{dev,dat,len})
end function

export constant xSDL_DequeueAudio = define_c_func(sdl,"+SDL_DequeueAudio",{C_UINT,C_POINTER,C_UINT},C_UINT)

public function SDL_DequeueAudio(atom dev,atom dat,atom len)
	return c_func(xSDL_DequeueAudio,{dev,dat,len})
end function

export constant xSDL_GetQueuedAudioSize = define_c_func(sdl,"+SDL_GetQueuedAudioSize",{C_UINT},C_UINT)

public function SDL_GetQueueAudioSize(atom dev)
	return c_func(xSDL_GetQueuedAudioSize,{dev})
end function

export constant xSDL_ClearQueuedAudio = define_c_proc(sdl,"+SDL_ClearQueuedAudio",{C_UINT})

public procedure SDL_ClearQueuedAudio(atom dev)
	c_proc(xSDL_ClearQueuedAudio,{dev})
end procedure

export constant xSDL_LockAudio = define_c_proc(sdl,"+SDL_LockAudio",{})

public procedure SDL_LockAudio()
	c_proc(xSDL_LockAudio,{})
end procedure

export constant xSDL_LockAudioDevice = define_c_proc(sdl,"+SDL_LockAudioDevice",{C_UINT})

public procedure SDL_LockAudioDevice(atom dev)
	c_proc(xSDL_LockAudioDevice,{dev})
end procedure

export constant xSDL_UnlockAudio = define_c_proc(sdl,"+SDL_UnlockAudio",{})

public procedure SDL_UnlockAudio()
	c_proc(xSDL_UnlockAudio,{})
end procedure

export constant xSDL_UnlockAudioDevice = define_c_proc(sdl,"+SDL_UnlockAudioDevice",{C_UINT})

public procedure SDL_UnlockAudioDevice(atom dev)
	c_proc(xSDL_UnlockAudioDevice,{dev})
end procedure

export constant xSDL_CloseAudio = define_c_proc(sdl,"+SDL_CloseAudio",{})

public procedure SDL_CloseAudio()
	c_proc(xSDL_CloseAudio,{})
end procedure

export constant xSDL_CloseAudioDevice = define_c_proc(sdl,"+SDL_CloseAudioDevice",{C_UINT})

public procedure SDL_CloseAudioDevice(atom dev)
	c_proc(xSDL_CloseAudioDevice,{dev})
end procedure
­221.37