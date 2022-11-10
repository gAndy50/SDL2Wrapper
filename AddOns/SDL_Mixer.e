--SDL Mixer 2 Wrapper
--Written By Andy P. (Icy_Viking)
--Uses's Greg's FFI library

include std/ffi.e
include std/os.e

include SDL_rwops.e
include SDL_audio.e
include SDL_endian.e
include SDL_version.e

public constant SDL_MIXER_MAJOR_VERSION = 2,
				SDL_MIXER_MINOR_VERSION = 7,
				SDL_MIXER_PATCHLEVEL = 0
				
atom mixer = 0

ifdef WINDOWS then
	mixer = open_dll("SDL2_mixer.dll")
	elsifdef LINUX or FREEBSD then
	mixer = open_dll("SDL_mixer.so")
end ifdef

export constant xMix_Linked_Version = define_c_func(mixer,"+Mix_Linked_Version",{},SDL_version)

public function Mix_Linked_Version()
	return c_func(xMix_Linked_Version,{})
end function


public constant MIX_INIT_FLAC = 0x00000001,
				MIX_INIT_MOD = 0x00000002,
				MIX_INIT_MP3 = 0x00000008,
				MIX_INIT_OGG = 0x00000010,
				MIX_INIT_MID = 0x00000020,
				MIX_INIT_OPUS = 0x00000040


export constant xMix_Init = define_c_func(mixer,"+Mix_Init",{C_INT},C_INT)

public function Mix_Init(atom flags)
	return c_func(xMix_Init,{flags})
end function

export constant xMix_Quit = define_c_proc(mixer,"+Mix_Quit",{})

public procedure Mix_Quit()
	c_proc(xMix_Quit,{})
end procedure

public constant MIX_CHANNELS = 8
public constant MIX_DEFAULT_FREQUENCY = 44100
public constant MIX_DEFAULT_FORMAT = AUDIO_S16LSB
public constant MIX_DEFAULT_CHANNELS = 2
public constant MIX_MAX_VOLUME = SDL_MIX_MAXVOLUME

public constant Mix_Chunk = define_c_type({
	C_INT, --allocated
	C_POINTER, --abuf
	C_UINT, --alen
	C_UINT --volume
})

public enum type Mix_Fading
	MIX_NO_FADING = 0,
	MIX_FADING_OUT,
	MIX_FADING_IN
end type

public enum type Mix_MusicType
	MUS_NONE = 0,
	MUS_CMD,
	MUS_WAV,
	MUS_MOD,
	MUS_MID,
	MUS_OGG,
	MUS_MP3,
	MUS_MP3_MAD_UNUSED,
	MUS_FLAC,
	MUS_MODPLUG_UNUSED,
	MUS_OPUS
end type

export constant xMix_OpenAudio = define_c_func(mixer,"+Mix_OpenAudio",{C_INT,C_UINT,C_INT,C_INT},C_INT)

public function Mix_OpenAudio(atom freq,atom format,atom chan,atom size)
	return c_func(xMix_OpenAudio,{freq,format,chan,size})
end function

export constant xMix_OpenAudioDevice = define_c_func(mixer,"+Mix_OpenAudioDevice",{C_INT,C_UINT,C_INT,C_INT,C_STRING,C_INT},C_INT)

public function Mix_OpenAudioDevice(atom freq,atom format,atom chan,atom size,sequence dev,atom allow)
	return c_func(xMix_OpenAudioDevice,{freq,format,chan,size,dev,allow})
end function

export constant xMix_PauseAudio = define_c_proc(mixer,"+Mix_PauseAudio",{C_INT})

public procedure Mix_PauseAudio(atom pause)
	c_proc(xMix_PauseAudio,{pause})
end procedure

export constant xMix_QuerySpec = define_c_func(mixer,"+Mix_QuerySpec",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function Mix_QuerySpec(atom freq,atom format,atom chan)
	return c_func(xMix_QuerySpec,{freq,format,chan})
end function

export constant xMix_AllocateChannels = define_c_func(mixer,"+Mix_AllocateChannels",{C_INT},C_INT)

public function Mix_AllocateChannels(atom num)
	return c_func(xMix_AllocateChannels,{num})
end function

export constant xMix_LoadWAV_RW = define_c_func(mixer,"+Mix_LoadWAV_RW",{C_POINTER,C_INT},Mix_Chunk)

public function Mix_LoadWAV_RW(atom src,atom xfree)
	return c_func(xMix_LoadWAV_RW,{src,xfree})
end function

export constant xMix_LoadWAV = define_c_func(mixer,"+Mix_LoadWAV",{C_STRING},Mix_Chunk)

public function Mix_LoadWAV(sequence file)
	return Mix_LoadWAV_RW(SDL_RWFromFile(file,"rb"),1)
end function

export constant xMix_LoadMUS_RW = define_c_func(mixer,"+Mix_LoadMUS_RW",{C_POINTER,C_INT},Mix_Chunk)

public function Mix_LoadMUS_RW(atom src,atom xfree)
	return c_func(xMix_LoadMUS_RW,{src,xfree})
end function

export constant xMix_LoadMUS = define_c_func(mixer,"+Mix_LoadMUS",{C_STRING},Mix_Chunk)

public function Mix_LoadMUS(sequence file)
	return Mix_LoadMUS_RW(SDL_RWFromFile(file,"rb"),1)
end function

export constant xMix_LoadMUSType_RW = define_c_func(mixer,"+Mix_LoadMUSType_RW",{C_POINTER,C_INT,C_INT},C_POINTER)

public function Mix_LoadMUSType_RW(atom src,Mix_MusicType mus, atom xfree)
	return c_func(xMix_LoadMUSType_RW,{src,mus,xfree})
end function

export constant xMix_QuickLoad_WAV = define_c_func(mixer,"+Mix_QuickLoad_WAV",{C_POINTER},Mix_Chunk)

public function Mix_QuickLoad_WAV(atom mem)
	return c_func(xMix_QuickLoad_WAV,{mem})
end function

export constant xMix_QuickLoad_RAW = define_c_func(mixer,"+Mix_QuickLoad_RAW",{C_POINTER,C_UINT},Mix_Chunk)

public function Mix_QuickLoad_RAW(atom mem,atom len)
	return c_func(xMix_QuickLoad_RAW,{mem,len})
end function

export constant xMix_FreeChunk = define_c_proc(mixer,"+Mix_FreeChunk",{Mix_Chunk})

public procedure Mix_FreeChunk(sequence chun)
	c_proc(xMix_FreeChunk,{chun})
end procedure

export constant xMix_FreeMusic = define_c_proc(mixer,"+Mix_FreeMusic",{C_POINTER})

public procedure Mix_FreeMusic(atom mus)
	c_proc(xMix_FreeMusic,{mus})
end procedure

export constant xMix_GetNumChunkDecoders = define_c_func(mixer,"+Mix_GetNumChunkDecoders",{},C_INT)

public function Mix_GetNumChunkDecoders()
	return c_func(xMix_GetNumChunkDecoders,{})
end function

export constant xMix_GetChunkDecoder = define_c_func(mixer,"+Mix_GetChunkDecoder",{C_INT},C_STRING)

public function Mix_GetChunkDecoder(atom idx)
	return c_func(xMix_GetChunkDecoder,{idx})
end function

export constant xMix_HasChunkDecoder = define_c_func(mixer,"+Mix_HasChunkDecoder",{C_STRING},C_BOOL)

public function Mix_HasChunkDecoder(sequence name)
	return c_func(xMix_HasChunkDecoder,{name})
end function

export constant xMix_GetNumMusicDecoders = define_c_func(mixer,"+Mix_GetNumMusicDecoders",{},C_INT)

public function Mix_GetNumMusicDecoders()
	return c_func(xMix_GetNumMusicDecoders,{})
end function

export constant xMix_GetMusicDecoder = define_c_func(mixer,"+Mix_GetMusicDecoder",{C_INT},C_STRING)

public function Mix_GetMusicDecoder(atom idx)
	return c_func(xMix_GetMusicDecoder,{idx})
end function

export constant xMix_HasMusicDecoder = define_c_func(mixer,"+Mix_HasMusicDecoder",{C_STRING},C_BOOL)

public function Mix_HasMusicDecoder(sequence name)
	return c_func(xMix_HasMusicDecoder,{name})
end function

export constant xMix_GetMusicType = define_c_func(mixer,"+Mix_GetMusicType",{C_POINTER},C_INT)

public function Mix_GetMusicType(atom mus)
	return c_func(xMix_GetMusicType,{mus})
end function

export constant xMix_GetMusicTitle = define_c_func(mixer,"+Mix_GetMusicTitle",{C_POINTER},C_STRING)

public function Mix_GetMusicTitle(atom mus)
	return c_func(xMix_GetMusicTitle,{mus})
end function

export constant xMix_GetMusicTitleTag = define_c_func(mixer,"+Mix_GetMusicTitleTag",{C_POINTER},C_STRING)

public function Mix_GetMusicTitleTag(atom mus)
	return c_func(xMix_GetMusicTitleTag,{mus})
end function

export constant xMix_GetMusicArtistTag = define_c_func(mixer,"+Mix_GetMusicArtistTag",{C_POINTER},C_STRING)

public function Mix_GetMusicArtistTag(atom mus)
	return c_func(xMix_GetMusicArtistTag,{mus})
end function

export constant xMix_GetMusicAlbumTag = define_c_func(mixer,"+Mix_GetMusicAlbumTag",{C_POINTER},C_STRING)

public function Mix_GetMusicAlbumTag(atom mus)
	return c_func(xMix_GetMusicAlbumTag,{mus})	
end function

export constant xMix_GetMusicCopyrightTag = define_c_func(mixer,"+Mix_GetMusicCopyrightTag",{C_POINTER},C_STRING)

public function Mix_GetMusicCopyrightTag(atom mus)
	return c_func(xMix_GetMusicCopyrightTag,{mus})
end function

export constant xMix_SetPostMix = define_c_proc(mixer,"+Mix_SetPostMix",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER})

public procedure Mix_SetPostMix(object mix_func,atom udata,atom stream,atom len,object arg)
	c_proc(xMix_SetPostMix,{mix_func,udata,stream,len,arg})
end procedure

export constant xMix_HookMusic = define_c_proc(mixer,"+Mix_HookMusic",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER})

public procedure Mix_HookMusic(object mix_func,atom udata,atom stream,atom len,object arg)
	c_proc(xMix_HookMusic,{mix_func,udata,stream,len,arg})
end procedure

export constant xMix_HookMusicFinished = define_c_proc(mixer,"+Mix_HookMusicFinished",{C_POINTER})

public procedure Mix_HookMusicFinished(atom mus)
	c_proc(xMix_HookMusicFinished,{mus})
end procedure

export constant xMix_GetMusicHookData = define_c_func(mixer,"+Mix_GetMusicHookData",{},C_POINTER)

public function Mix_GetMusicHookData()
	return c_func(xMix_GetMusicHookData,{})
end function

export constant xMix_ChannelFinished = define_c_proc(mixer,"+Mix_ChannelFinished",{C_POINTER,C_INT})

public procedure Mix_ChannelFinished(atom chan_fin,atom chan)
	c_proc(xMix_ChannelFinished,{chan_fin,chan})
end procedure

public constant MIX_CHANNEL_POST = -2

export constant xMix_RegisterEffect = define_c_func(mixer,"+Mix_RegisterEffect",{C_INT,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function Mix_RegisterEffect(atom chan,atom f,atom d,atom arg)
	return c_func(xMix_RegisterEffect,{chan,f,d,arg})
end function

export constant xMix_UnregisterEffect = define_c_func(mixer,"+Mix_UnregisterEffect",{C_INT,C_POINTER},C_INT)

public function Mix_UnregisterEffect(atom chan,atom f)
	return c_func(xMix_UnregisterEffect,{chan,f})
end function

export constant xMix_UnregisterAllEffects = define_c_func(mixer,"+Mix_UnregisterAllEffects",{C_INT},C_INT)

public function Mix_UnregisterAllEffects(atom chan)
	return c_func(xMix_UnregisterAllEffects,{chan})
end function

public constant MIX_EFFECTSMAXSPEED = "MIX_EFFECTSMAXSPEED"

export constant xMix_SetPanning = define_c_func(mixer,"+Mix_SetPanning",{C_INT,C_UINT,C_UINT},C_INT)

public function Mix_SetPanning(atom chan,atom l,atom r)
	return c_func(xMix_SetPanning,{chan,l,r})
end function

export constant xMix_SetPosition = define_c_func(mixer,"+Mix_SetPosition",{C_INT,C_INT,C_UINT},C_INT)

public function Mix_SetPosition(atom chan,atom angle,atom dis)
	return c_func(xMix_SetPosition,{chan,angle,dis})
end function

export constant xMix_SetDistance = define_c_func(mixer,"+Mix_SetDistance",{C_INT,C_UINT},C_INT)

public function Mix_SetDistance(atom chan,atom dis)
	return c_func(xMix_SetDistance,{chan,dis})
end function

export constant xMix_SetReverseStereo = define_c_func(mixer,"+Mix_SetReverseStereo",{C_INT,C_INT},C_INT)

public function Mix_SetReverseStereo(atom chan,atom flip)
	return c_func(xMix_SetReverseStereo,{chan,flip})
end function

export constant xMix_ReserveChannels = define_c_func(mixer,"+Mix_ReserveChannels",{C_INT},C_INT)

public function Mix_ReserveChannels(atom num)
	return c_func(xMix_ReserveChannels,{num})
end function

export constant xMix_GroupChannel = define_c_func(mixer,"+Mix_GroupChannel",{C_INT,C_INT},C_INT)

public function Mix_GroupChannel(atom which,atom tag)
	return c_func(xMix_GroupChannel,{which,tag})
end function

export constant xMix_GroupChannels = define_c_func(mixer,"+Mix_GroupChannels",{C_INT,C_INT,C_INT},C_INT)

public function Mix_GroupChannels(atom xfrom,atom xto,atom tag)
	return c_func(xMix_GroupChannels,{xfrom,xto,tag})
end function

export constant xMix_GroupAvailable = define_c_func(mixer,"+Mix_GroupAvailable",{C_INT},C_INT)

public function Mix_GroupAvailable(atom tag)
	return c_func(xMix_GroupAvailable,{tag})
end function

export constant xMix_GroupCount = define_c_func(mixer,"+Mix_GroupCount",{C_INT},C_INT)

public function Mix_GroupCount(atom tag)
	return c_func(xMix_GroupCount,{tag})
end function

export constant xMix_GroupOldest = define_c_func(mixer,"+Mix_GroupOldest",{C_INT},C_INT)

public function Mix_GroupOldest(atom tag)
	return c_func(xMix_GroupOldest,{tag})
end function

export constant xMix_GroupNewer = define_c_func(mixer,"+Mix_GroupNewer",{C_INT},C_INT)

public function Mix_GroupNewer(atom tag)
	return c_func(xMix_GroupNewer,{tag})
end function

export constant xMix_PlayChannel = define_c_func(mixer,"+Mix_PlayChannel",{C_INT,Mix_Chunk,C_INT},C_INT)

public function Mix_PlayChannel(atom chan,sequence chunk,atom loops)
	return c_func(xMix_PlayChannel,{chan,chunk,loops})
end function

export constant xMix_PlayChannelTimed = define_c_func(mixer,"+Mix_PlayChannelTimed",{C_INT,Mix_Chunk,C_INT,C_INT},C_INT)

public function Mix_PlayChannelTimed(atom chan,sequence chunk,atom loops,atom ticks)
	return c_func(xMix_PlayChannelTimed,{chan,chunk,loops,ticks})
end function

export constant xMix_PlayMusic = define_c_func(mixer,"+Mix_PlayMusic",{C_POINTER,C_INT},C_INT)

public function Mix_PlayMusic(atom mus,atom loops)
	return c_func(xMix_PlayMusic,{mus,loops})
end function

export constant xMix_FadeInMusic = define_c_func(mixer,"+Mix_FadeInMusic",{C_POINTER,C_INT,C_INT},C_INT)

public function Mix_FadeInMusic(atom mus,atom loops,atom ms)
	return c_func(xMix_FadeInMusic,{mus,loops,ms})
end function

export constant xMix_FadeInMusicPos = define_c_func(mixer,"+Mix_FadeInMusicPos",{C_POINTER,C_INT,C_INT,C_DOUBLE},C_INT)

public function Mix_FadeInMusicPos(atom mus,atom loops,atom ms,atom pos)
	return c_func(xMix_FadeInMusicPos,{mus,loops,ms,pos})
end function

export constant xMix_FadeInChannel = define_c_func(mixer,"+Mix_FadeInChannel",{C_INT,Mix_Chunk,C_INT,C_INT},C_INT)

public function Mix_FadeInChannel(atom chan,sequence chunk,atom loops,atom ms)
	return c_func(xMix_FadeInChannel,{chan,chunk,loops,ms})
end function

export constant xMix_FadeInChannelTimed = define_c_func(mixer,"+Mix_FadeInChannelTimed",{C_INT,Mix_Chunk,C_INT,C_INT,C_INT},C_INT)

public function Mix_FadeInChannelTimed(atom chan,sequence chunk,atom loops,atom ms,atom ticks)
	return c_func(xMix_FadeInChannelTimed,{chan,chunk,loops,ms,ticks})
end function

export constant xMix_Volume = define_c_func(mixer,"+Mix_Volume",{C_INT,C_INT},C_INT)

public function Mix_Volume(atom chan,atom vol)
	return c_func(xMix_Volume,{chan,vol})
end function

export constant xMix_VolumeChunk = define_c_func(mixer,"+Mix_VolumeChunk",{Mix_Chunk,C_INT},C_INT)

public function Mix_VolumeChunk(sequence chunk,atom vol)
	return c_func(xMix_VolumeChunk,{chunk,vol})
end function

export constant xMix_VolumeMusic = define_c_func(mixer,"+Mix_VolumeMusic",{C_INT},C_INT)

public function Mix_VolumeMusic(atom vol)
	return c_func(xMix_VolumeMusic,{vol})
end function

export constant xMix_GetMusicVolume = define_c_func(mixer,"+Mix_GetMusicVolume",{C_POINTER},C_INT)

public function Mix_GetMusicVolume(atom mus)
	return c_func(xMix_GetMusicVolume,{mus})
end function

export constant xMix_MasterVolume = define_c_func(mixer,"+Mix_MasterVolume",{C_INT},C_INT)

public function Mix_MasterVolume(atom vol)
	return c_func(xMix_MasterVolume,{vol})
end function

export constant xMix_HaltChannel = define_c_func(mixer,"+Mix_HaltChannel",{C_INT},C_INT)

public function Mix_HaltChannel(atom chan)
	return c_func(xMix_HaltChannel,{chan})
end function

export constant xMix_HaltGroup = define_c_func(mixer,"+Mix_HaltGroup",{C_INT},C_INT)

public function Mix_HaltGroup(atom tag)
	return c_func(xMix_HaltGroup,{tag})
end function

export constant xMix_HaltMusic = define_c_func(mixer,"+Mix_HaltMusic",{},C_INT)

public function Mix_HaltMusic()
	return c_func(xMix_HaltMusic,{})
end function

export constant xMix_ExpireChannel = define_c_func(mixer,"+Mix_ExpireChannel",{C_INT,C_INT},C_INT)

public function Mix_ExpireChannel(atom chan,atom ticks)
	return c_func(xMix_ExpireChannel,{chan,ticks})
end function

export constant xMix_FadeOutChannel = define_c_func(mixer,"+Mix_FadeOutChannel",{C_INT,C_INT},C_INT)

public function Mix_FadeOutChannel(atom which,atom ms)
	return c_func(xMix_FadeOutChannel,{which,ms})
end function

export constant xMix_FadeOutGroup = define_c_func(mixer,"+Mix_FadeOutGroup",{C_INT,C_INT},C_INT)

public function Mix_FadeOutGroup(atom tag,atom ms)
	return c_func(xMix_FadeOutGroup,{tag,ms})
end function

export constant xMix_FadeOutMusic = define_c_func(mixer,"+Mix_FadeOutMusic",{C_INT},C_INT)

public function Mix_FadeOutMusic(atom ms)
	return c_func(xMix_FadeOutMusic,{ms})
end function

export constant xMix_FadingMusic = define_c_func(mixer,"+Mix_FadingMusic",{},C_POINTER)

public function Mix_FadingMusic()
	return c_func(xMix_FadingMusic,{})
end function

export constant xMix_FadingChannel = define_c_func(mixer,"+Mix_FadingChannel",{C_INT},C_POINTER)

public function Mix_FadingChannel(atom which)
	return c_func(xMix_FadingChannel,{which})
end function

export constant xMix_Pause = define_c_proc(mixer,"+Mix_Pause",{C_INT})

public procedure Mix_Pause(atom chan)
	c_proc(xMix_Pause,{chan})
end procedure

export constant xMix_Resume = define_c_proc(mixer,"+Mix_Resume",{C_INT})

public procedure Mix_Resume(atom chan)
	c_proc(xMix_Resume,{chan})
end procedure

export constant xMix_Paused = define_c_func(mixer,"+Mix_Paused",{C_INT},C_INT)

public function Mix_Paused(atom chan)
	return c_func(xMix_Paused,{chan})
end function

export constant xMix_PauseMusic = define_c_proc(mixer,"+Mix_PauseMusic",{})

public procedure Mix_PauseMusic()
	c_proc(xMix_PauseMusic,{})
end procedure

export constant xMix_ResumeMusic = define_c_proc(mixer,"+Mix_ResumeMusic",{})

public procedure Mix_ResumeMusic()
	c_proc(xMix_ResumeMusic,{})
end procedure

export constant xMix_RewindMusic = define_c_proc(mixer,"+Mix_RewindMusic",{})

public procedure Mix_RewindMusic()
	c_proc(xMix_RewindMusic,{})
end procedure

export constant xMix_PausedMusic = define_c_func(mixer,"+Mix_PausedMusic",{},C_INT)

public function Mix_PausedMusic()
	return c_func(xMix_PausedMusic,{})
end function

export constant xMix_ModMusicJumpToOrder = define_c_func(mixer,"+Mix_ModMusicJumpToOrder",{C_INT},C_INT)

public function Mix_ModMusicJumpToOrder(atom order)
	return c_func(xMix_ModMusicJumpToOrder,{order})
end function

export constant xMix_SetMusicPosition = define_c_func(mixer,"+Mix_SetMusicPosition",{C_DOUBLE},C_INT)

public function Mix_SetMusicPosition(atom pos)
	return c_func(xMix_SetMusicPosition,{pos})
end function

export constant xMix_GetMusicPosition = define_c_func(mixer,"+Mix_GetMusicPosition",{C_POINTER},C_DOUBLE)

public function Mix_GetMusicPosition(atom mus)
	return c_func(xMix_GetMusicPosition,{mus})
end function

export constant xMix_MusicDuration = define_c_func(mixer,"+Mix_MusicDuration",{C_POINTER},C_DOUBLE)

public function Mix_MusicDuration(atom mus)
	return c_func(xMix_MusicDuration,{mus})
end function

export constant xMix_GetMusicLoopStartTime = define_c_func(mixer,"+Mix_GetMusicLoopStartTime",{C_POINTER},C_DOUBLE)

public function Mix_GetMusicLoopStartTime(atom mus)
	return c_func(xMix_GetMusicLoopStartTime,{mus})
end function

export constant xMix_GetMusicLoopEndTime = define_c_func(mixer,"+Mix_GetMusicLoopEndTime",{C_POINTER},C_DOUBLE)

public function Mix_GetMusicLoopEndTime(atom mus)
	return c_func(xMix_GetMusicLoopEndTime,{mus})
end function

export constant xMix_GetMusicLoopLengthTime = define_c_func(mixer,"+Mix_GetMusicLoopLengthTime",{C_POINTER},C_DOUBLE)

public function Mix_GetMusicLoopLengthTime(atom mus)
	return c_func(xMix_GetMusicLoopLengthTime,{mus})
end function

export constant xMix_Playing = define_c_func(mixer,"+Mix_Playing",{C_INT},C_INT)

public function Mix_Playing(atom chan)
	return c_func(xMix_Playing,{chan})
end function

export constant xMix_PlayingMusic = define_c_func(mixer,"+Mix_PlayingMusic",{},C_INT)

public function Mix_PlayingMusic()
	return c_func(xMix_PlayingMusic,{})
end function

export constant xMix_SetMusicCMD = define_c_func(mixer,"+Mix_SetMusicCMD",{C_STRING},C_INT)

public function Mix_SetMusicCMD(sequence cmd)
	return c_func(xMix_SetMusicCMD,{cmd})
end function

export constant xMix_SetSynchroValue = define_c_func(mixer,"+Mix_SetSynchroValue",{C_INT},C_INT)

public function Mix_SetSynchroValue(atom val)
	return c_func(xMix_SetSynchroValue,{val})
end function

export constant xMix_GetSynchroValue = define_c_func(mixer,"+Mix_GetSynchroValue",{},C_INT)

public function Mix_GetSynchroValue()
	return c_func(xMix_GetSynchroValue,{})
end function

export constant xMix_SetSoundFonts = define_c_func(mixer,"+Mix_SetSoundFonts",{C_STRING},C_INT)

public function Mix_SetSoundFonts(sequence paths)
	return c_func(xMix_SetSoundFonts,{paths})
end function

export constant xMix_GetSoundFonts = define_c_func(mixer,"+Mix_GetSoundFonts",{},C_STRING)

public function Mix_GetSoundFonts()
	return c_func(xMix_GetSoundFonts,{})
end function

export constant xMix_EachSoundFont = define_c_func(mixer,"+Mix_EachSoundFont",{C_POINTER,C_STRING,C_POINTER,C_POINTER},C_INT)

public function Mix_EachSoundFont(atom func,sequence x,atom x2,atom data)
	return c_func(xMix_EachSoundFont,{func,x,x2,data})
end function

export constant xMix_SetTimidityCfg = define_c_func(mixer,"+Mix_SetTimidityCfg",{C_STRING},C_INT)

public function Mix_SetTimidityCfg(sequence path)
	return c_func(xMix_SetTimidityCfg,{path})
end function

export constant xMix_GetTimidityCfg = define_c_func(mixer,"+Mix_GetTimidityCfg",{},C_STRING)

public function Mix_GetTimidityCfg()
	return c_func(xMix_GetTimidityCfg,{})
end function

export constant xMix_GetChunk = define_c_func(mixer,"+Mix_GetChunk",{C_INT},Mix_Chunk)

public function Mix_GetChunk(atom chan)
	return c_func(xMix_GetChunk,{chan})
end function

export constant xMix_CloseAudio = define_c_proc(mixer,"+Mix_CloseAudio",{})

public procedure Mix_CloseAudio()
	c_proc(xMix_CloseAudio,{})
end procedure

public constant Mix_SetError = "SDL_SetError"
public constant Mix_GetError = "SDL_GetError"
public constant Mix_ClearError = "SDL_ClearError"
public constant Mix_OutOfMemory = "SDL_OutOfMemory"
