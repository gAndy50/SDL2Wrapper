include std/ffi.e

include sdl.e

public enum type SDL_BlendMode
	SDL_BLENDMODE_NONE = 0,
	SDL_BLENDMODE_BLEND = 1,
	SDL_BLENDMODE_ADD = 2,
	SDL_BLENDMODE_MOD = 4,
	SDL_BLENDMODE_MUL = 8,
	SDL_BLENDMODE_INVALID = 0x7FFFFFFF
end type

public enum type SDL_BlendOperation
	SDL_BLENDOPERATION_ADD = 0x1,
	SDL_BLENDOPERATION_SUBTRACT = 0x2,
	SDL_BLENDOPERATION_REV_SUBTRACT = 0x3,
	SDL_BLENDOPERATION_MINIMUM = 0x4,
	SDL_BLENDOPERATION_MAXIMUM = 0x5
end type

public enum type SDL_BlendFactor
	SDL_BLENDFACTOR_ZERO                = 0x1,  
    SDL_BLENDFACTOR_ONE                 = 0x2,  
    SDL_BLENDFACTOR_SRC_COLOR           = 0x3,  
    SDL_BLENDFACTOR_ONE_MINUS_SRC_COLOR = 0x4,  
    SDL_BLENDFACTOR_SRC_ALPHA           = 0x5,  
    SDL_BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 0x6,  
    SDL_BLENDFACTOR_DST_COLOR           = 0x7,  
    SDL_BLENDFACTOR_ONE_MINUS_DST_COLOR = 0x8,  
    SDL_BLENDFACTOR_DST_ALPHA           = 0x9,  
    SDL_BLENDFACTOR_ONE_MINUS_DST_ALPHA = 0xA 
end type

export constant xSDL_ComposeCustomBlendMode = define_c_func(sdl,"+SDL_ComposeCustomBlendMode",{C_INT,C_INT,C_INT,C_INT,C_INT,C_INT},C_INT)

public function SDL_ComposeCustomBlendMode(atom srcColorFactor,atom dstColorFactor,atom colorOperation,atom srcAlphaFactor,atom dstAlphaFactor,atom alphaOperation)
	return c_func(xSDL_ComposeCustomBlendMode,{srcColorFactor,dstColorFactor,colorOperation,srcAlphaFactor,dstAlphaFactor,alphaOperation})
end function
­38.135