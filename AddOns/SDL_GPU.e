------------------------
--EuSDLGPU 2          --
--Written by Andy P.  --
--SDL GPU for SDL 2   --
--Icy Viking Games    --
--Euphoria Wrapper    --
------------------------

include std/ffi.e
include std/machine.e
include std/os.e

include SDL.e

--Probably not needed
public constant SDL_GPU_USE_SDL1 = 1
public constant SDL_GPU_USE_SDL2 = 2

--Flags
public constant GPU_FALSE = 0,
				GPU_TRUE = 1

--Structs				
public constant GPU_Rect = define_c_struct({
	C_FLOAT, --x
	C_FLOAT, --y
	C_FLOAT, --w
	C_FLOAT --h
})

public constant GPU_RENDERER_ORDER_MAX = 10

public constant GPU_RENDERER_UNKNOWN = 0,
				GPU_RENDERER_OPENGL_1_BASE = 1,
				GPU_RENDERER_OPENGL_1 = 2,
				GPU_RENDERER_OPENGL_2 = 3,
				GPU_RENDERER_OPENGL_3 = 4,
				GPU_RENDERER_OPENGL_4 = 5,
				GPU_RENDERER_GLES_1 = 11,
				GPU_RENDERER_GLES_2 = 12,
				GPU_RENDERER_GLES_3 = 13,
				GPU_RENDERER_D3D9 = 21,
				GPU_RENDERER_D3D10 = 22,
				GPU_RENDERER_D3D11 = 23
				
public constant GPU_RENDERER_CUSTOM_0 = 1000

public constant GPU_RendererID = define_c_struct({
	C_STRING, --name
	C_INT, --renderer enum
	C_INT, --major ver
	C_INT --minor ver
})

public enum type GPU_ComparsionEnum
	GPU_NEVER = 0x0200,
	GPU_LESS = 0x0201,
    GPU_EQUAL = 0x0202,
    GPU_LEQUAL = 0x0203,
    GPU_GREATER = 0x0204,
    GPU_NOTEQUAL = 0x0205,
    GPU_GEQUAL = 0x0206,
    GPU_ALWAYS = 0x0207
end type

public enum type GPU_BlendFuncEnum
	GPU_FUNC_ZERO = 0,
    GPU_FUNC_ONE = 1,
    GPU_FUNC_SRC_COLOR = 0x0300,
    GPU_FUNC_DST_COLOR = 0x0306,
    GPU_FUNC_ONE_MINUS_SRC = 0x0301,
    GPU_FUNC_ONE_MINUS_DST = 0x0307,
    GPU_FUNC_SRC_ALPHA = 0x0302,
    GPU_FUNC_DST_ALPHA = 0x0304,
    GPU_FUNC_ONE_MINUS_SRC_ALPHA = 0x0303,
    GPU_FUNC_ONE_MINUS_DST_ALPHA = 0x0305
end type

public enum type GPU_BlendEqEnum
	GPU_EQ_ADD = 0x8006,
    GPU_EQ_SUBTRACT = 0x800A,
    GPU_EQ_REVERSE_SUBTRACT = 0x800B
end type

public constant GPU_BlendMode = define_c_struct({
	C_INT, --source_color
	C_INT, --dest_color
	C_INT, --source_alpha
	C_INT, --dest_alpha
	C_INT, --color_equation
	C_INT --alpha_equation
})

public enum type GPU_BlendPresetEnum
	GPU_BLEND_NORMAL = 0,
    GPU_BLEND_PREMULTIPLIED_ALPHA = 1,
    GPU_BLEND_MULTIPLY = 2,
    GPU_BLEND_ADD = 3,
    GPU_BLEND_SUBTRACT = 4,
    GPU_BLEND_MOD_ALPHA = 5,
    GPU_BLEND_SET_ALPHA = 6,
    GPU_BLEND_SET = 7,
    GPU_BLEND_NORMAL_KEEP_ALPHA = 8,
    GPU_BLEND_NORMAL_ADD_ALPHA = 9,
    GPU_BLEND_NORMAL_FACTOR_ALPHA = 10
end type

public enum type GPU_FilterEnum
	GPU_FILTER_NEAREST = 0,
    GPU_FILTER_LINEAR = 1,
    GPU_FILTER_LINEAR_MIPMAP = 2
end type

public enum type GPU_SnapEnum
	GPU_SNAP_NONE = 0,
    GPU_SNAP_POSITION = 1,
    GPU_SNAP_DIMENSIONS = 2,
    GPU_SNAP_POSITION_AND_DIMENSIONS = 3
end type

public enum type GPU_WrapEnum
	GPU_WRAP_NONE = 0,
    GPU_WRAP_REPEAT = 1,
    GPU_WRAP_MIRRORED = 2
end type

public enum type GPU_FormatEnum
	GPU_FORMAT_LUMINANCE = 1,
    GPU_FORMAT_LUMINANCE_ALPHA = 2,
    GPU_FORMAT_RGB = 3,
    GPU_FORMAT_RGBA = 4,
    GPU_FORMAT_ALPHA = 5,
    GPU_FORMAT_RG = 6,
    GPU_FORMAT_YCbCr422 = 7,
    GPU_FORMAT_YCbCr420P = 8,
    GPU_FORMAT_BGR = 9,
    GPU_FORMAT_BGRA = 10,
    GPU_FORMAT_ABGR = 11
end type

public enum type GPU_FileFormatEnum
	GPU_FILE_AUTO = 0,
    GPU_FILE_PNG,
    GPU_FILE_BMP,
    GPU_FILE_TGA
end type

public constant GPU_Image = define_c_struct({
	C_POINTER, --renderer
	C_POINTER, --context_target
	C_POINTER, --target
	C_POINTER, --data
	C_UINT16,C_UINT16, --w,h
	C_INT, --format GPU_FormatEnum
	C_INT, --num_layers
	C_INT, --bytes_per_pixel
	C_UINT16,C_UINT16, --base_w,base_h
	C_UINT16,C_UINT16, --texture_w,texture_h
	C_FLOAT, --anchor_x
	C_FLOAT, --anchor_y
	SDL_Color, --color
	C_INT, --blend_mode GPU_BlendMode
	C_INT, --filter_mode GPU_FilterEnum
	C_INT, --snap_mode GPU_SnapEnum
	C_INT, --GPU_WrapEnum wrap_mode_x
	C_INT, --GPU_WrapEnum wrap_mode_y
	C_INT, --refcount
	C_BOOL, --using_virtual_resolution
	C_BOOL, --has_mipmaps
	C_BOOL, --use_blending
	C_BOOL --is_alias
})

public constant GPU_Camera = define_c_struct({
	C_FLOAT,C_FLOAT,C_FLOAT, --x,y,z
	C_FLOAT, --angle
	C_FLOAT,C_FLOAT, --zoom_x,zoom_y
	C_FLOAT,C_FLOAT, --z_near,z_far
	C_BOOL --use_centered_origin
})

public constant GPU_ShaderBlock = define_c_struct({
	C_INT, --position_loc
	C_INT, --texcoord_loc
	C_INT, --color_loc
	C_INT --modelViewProjection_loc
})

public constant GPU_MODEL = 0,
				GPU_VIEW = 1,
				GPU_PROJECTION = 2
				
public constant GPU_MatrixStack = define_c_struct({
	C_UINT, --storage_size
	C_UINT, --size
	C_POINTER --matrix
})

public constant GPU_Context = define_c_struct({
	C_POINTER, --context
	C_POINTER, --active_target
	GPU_ShaderBlock, --current_shader_block
	GPU_ShaderBlock, --default_textured_shader_block
	GPU_ShaderBlock, --default_untextured_shader_block
	C_UINT32, --windowID
	C_INT, --window_w
	C_INT, --window_h
	C_INT, --drawable_w
	C_INT, --drawable_h
	C_INT, --store_window_w
	C_INT, --store_window_h
	C_UINT32, --default_textured_vertex_shader_id
	C_UINT32, --default_textured_fragment_shader_id
	C_UINT32, --default_untextured_vertex_shader_id
	C_UINT32, --default_untextured_fragment_shader_id
	C_UINT32, --current_shader_program
	C_UINT32, --default_textured_shader_program
	C_UINT32, --default_untextured_shader_program
	C_INT, --shapes_blend mode GPU_BlendMode
	C_FLOAT, --line_thickness
	C_INT, --refcount
	C_POINTER, --data
	C_BOOL, --failed
	C_BOOL, --use_texturing
	C_BOOL --shapes_use_blending
})

public constant GPU_Target = define_c_struct({
	C_POINTER, --renderer
	C_POINTER, --context_target
	C_POINTER, --image Gpu_image
	C_POINTER, --data
	C_UINT16,C_UINT16, --w,h
	C_UINT16,C_UINT16, --base_w,base_h
	GPU_Rect, --clip_rect
	SDL_Color, --color
	GPU_Rect, --viewport
	C_INT, --matrix_mode
	GPU_MatrixStack, --projection_matrix
	GPU_MatrixStack, --view_matrix
	GPU_MatrixStack, --model_matrix
	GPU_Camera, --camera
	C_BOOL, --using_virtual_resolution
	C_BOOL, --use_clip_rect
	C_BOOL, --use_color
	C_BOOL, --use_camera
	C_INT, --depth_function GPU_ComparsionEnum
	C_POINTER, --context GPU_Context
	C_INT, --refcount
	C_BOOL, --use_depth_test
	C_BOOL, --use_depth_write
	C_BOOL --is_alias
})

public constant GPU_FEATURE_NON_POWER_OF_TWO = 0x1,
				GPU_FEATURE_RENDER_TARGETS = 0x2,
				GPU_FEATURE_BLEND_EQUATIONS = 0x4,
				GPU_FEATURE_BLEND_FUNC_SEPARATE = 0x8,
				GPU_FEATURE_BLEND_EQUATIONS_SEPARATE = 0x10,
				GPU_FEATURE_GL_BGR = 0x20,
				GPU_FEATURE_GL_BGRA = 0x40,
				GPU_FEATURE_GL_ABGR = 0x80,
				GPU_FEATURE_VERTEX_SHADER = 0x100,
				GPU_FEATURE_FRAGMENT_SHADER = 0x200,
				GPU_FEATURE_PIXEL_SHADER = 0x200,
				GPU_FEATURE_GEOMETRY_SHADER = 0x400,
				GPU_FEATURE_WRAP_REPEAT_MIRRORED = 0x800,
				GPU_FEATURE_CORE_FRAMEBUFFER_OBJECTS = 0x1000
				
public constant GPU_INIT_ENABLE_VSYNC = 0x1,
				GPU_INIT_DISABLE_VSYNC = 0x2,
				GPU_INIT_DISABLE_DOUBLE_BUFFER = 0x4,
				GPU_INIT_DISABLE_AUTO_VIRTUAL_RESOLUTION = 0x8,
				GPU_INIT_REQUEST_COMPATBILITY_PROFILE = 0x10,
				GPU_INIT_USE_ROW_BY_ROW_TEXTURE_UPLOAD_FALLBACK = 0x20,
				GPU_INIT_USE_COPY_TEXTURE_UPLOAD_FALLBACK = 0x40
				
public constant GPU_DEFAULT_INIT_FLAGS = 0

public constant GPU_NONE = 0x0

public constant GPU_POINTS = 0x0,
				GPU_LINES = 0x1,
				GPU_LINE_LOOP = 0x2,
				GPU_LINE_STRIP = 0x3,
				GPU_TRIANGLES = 0x4,
				GPU_TRIANGLE_STRIP = 0x5,
				GPU_TRIANGLE_FAN = 0x6
				
public constant GPU_BATCH_XY = 0x1,
				GPU_BATCH_XYZ = 0x2,
				GPU_BATCH_ST = 0x4,
				GPU_BATCH_RGB = 0x8,
				GPU_BATCH_RGBA = 0x10,
				GPU_BATCH_RGB8 = 0x20,
				GPU_BATCH_RGBA8 = 0x40
				
public constant GPU_FLIP_NONE = 0x0,
				GPU_FLIP_HORIZONTAL = 0x1,
				GPU_FLIP_VERTICAL = 0x2
				
public constant GPU_TYPE_BYTE = 0x1400,
				GPU_TYPE_UNSIGNED_BYTE = 0x1401,
				GPU_TYPE_SHORT = 0x1402,
				GPU_TYPE_UNSIGNED_SHORT = 0x1403,
				GPU_TYPE_INT = 0x1404,
				GPU_TYPE_UNSIGNED_INT = 0x1405,
				GPU_TYPE_FLOAT = 0x1406,
				GPU_TYPE_DOUBLE = 0x140A
				
public enum type GPU_ShaderEnum
	GPU_VERTEX_SHADER = 0,
	GPU_FRAGMENT_SHADER = 1,
	GPU_PIXEL_SHADER = 1,
	GPU_GEOMETRY_SHADER = 2
end type

public enum type GPU_ShaderLanguageEnum
	GPU_LANGUAGE_NONE = 0,
    GPU_LANGUAGE_ARB_ASSEMBLY = 1,
    GPU_LANGUAGE_GLSL = 2,
    GPU_LANGUAGE_GLSLES = 3,
    GPU_LANGUAGE_HLSL = 4,
    GPU_LANGUAGE_CG = 5
end type

public constant GPU_AttributeFormat = define_c_struct({
	C_INT, --num_eles_per_value
	C_INT, --type GPU_TypeEnum
	C_INT, --stride_bytes
	C_INT, --offset_bytes
	C_BOOL, --is_per_sprite
	C_BOOL --normalize
})

public constant GPU_Attribute = define_c_struct({
	C_POINTER, --values
	GPU_AttributeFormat, --format
	C_INT --location
})

public constant GPU_AttributeSource = define_c_struct({
	C_POINTER, --next_value
	C_POINTER, --per_vertex_storage
	C_INT, --num_values
	C_INT, --per_vertex_storage_stride_bytes
	C_INT, --per_vertex_storage_offset_bytes
	C_INT, --per_vertex_storage_size
	GPU_Attribute, --attribute
	C_BOOL --enabled
})

public enum type GPU_ErrorEnum
	GPU_ERROR_NONE = 0,
    GPU_ERROR_BACKEND_ERROR = 1,
    GPU_ERROR_DATA_ERROR = 2,
    GPU_ERROR_USER_ERROR = 3,
    GPU_ERROR_UNSUPPORTED_FUNCTION = 4,
    GPU_ERROR_NULL_ARGUMENT = 5,
    GPU_ERROR_FILE_NOT_FOUND = 6
end type

public constant GPU_ErrorObject = define_c_struct({
	C_POINTER, --function
	C_POINTER, --details
	C_INT --error GPU_ErrorEnum
})

public enum type GPU_DebugLevelEnum
	GPU_DEBUG_LEVEL_0 = 0,
    GPU_DEBUG_LEVEL_1 = 1,
    GPU_DEBUG_LEVEL_2 = 2,
    GPU_DEBUG_LEVEL_3 = 3,
    GPU_DEBUG_LEVEL_MAX = 3
end type

public enum type GPU_LogLevelEnum
	PU_LOG_INFO = 0,
    GPU_LOG_WARNING,
    GPU_LOG_ERROR
end type

public constant GPU_Renderer = define_c_struct({
	C_POINTER, --id
	C_POINTER, --requested_id
	C_UINT32, --GPU_WindowFlagEnum SDL_Init_flags
	C_UINT32, --GPU_init_flags
	C_INT, --shader_language GPUShaderLanguageEnum
	C_INT, --min_shader_version
	C_INT, --max_shader_version
	C_INT, --enabled_features GPU_FeatureEnum
	C_POINTER, --current_context_target
	C_FLOAT, --default_image_anchor_x
	C_FLOAT, --default_image_anchor_y
	C_POINTER, --impl
	C_BOOL --coordinate_mode
})

public atom gpu = 0

ifdef WINDOWS then
	gpu = open_dll("SDL2_gpu.dll")
	elsifdef LINUX or FREEBSD then
	gpu = open_dll("libSDL2_gpu.so")
end ifdef

--Functions

export constant xGPU_GetLinkedVersion = define_c_func(gpu,"+GPU_GetLinkedVersion",{},SDL_VERSION)

public function GPU_GetLinkedVersion()
	return c_func(xGPU_GetLinkedVersion,{})
end function

export constant xGPU_SetInitWindow = define_c_proc(gpu,"+GPU_SetInitWindow",{C_UINT32})

public procedure GPU_SetInitWindow(atom id)
	c_proc(xGPU_SetInitWindow,{id})
end procedure

export constant xGPU_SetPreInitFlags = define_c_proc(gpu,"+GPU_SetPreInitFlags",{C_INT})

public procedure GPU_SetPreInitFlags(atom f)
	c_proc(xGPU_SetPreInitFlags,{f})
end procedure

export constant xGPU_GetPreInitFlags = define_c_func(gpu,"+GPU_GetPreInitFlags",{},C_INT)

public function GPU_GetPreInitFlags()
	return c_func(xGPU_GetPreInitFlags,{})
end function

export constant xGPU_SetRequiredFeatures = define_c_proc(gpu,"+GPU_SetRequiredFeatures",{C_INT})

public procedure GPU_SetRequiredFeatures(atom f)
	c_proc(xGPU_SetRequiredFeatures,{f})
end procedure

export constant xGPU_GetRequiredFeatures = define_c_func(gpu,"+GPU_GetRequiredFeatures",{},C_INT)

public function GPU_GetRequiredFeatures()
	return c_func(xGPU_GetRequiredFeatures,{})
end function

export constant xGPU_GetDefaultRendererOrder = define_c_proc(gpu,"+GPU_GetDefaultRendererOrder",{C_POINTER,C_POINTER})

public procedure GPU_GetDefaultRendererOrder(atom size,atom order)
	c_proc(xGPU_GetDefaultRendererOrder,{size,order})
end procedure

export constant xGPU_GetRendererOrder = define_c_proc(gpu,"+GPU_GetRendererOrder",{C_POINTER,C_POINTER})

public procedure GPU_GetRendererOrder(atom size,atom order)
	c_proc(xGPU_GetRendererOrder,{size,order})
end procedure

export constant xGPU_SetRendererOrder = define_c_proc(gpu,"+GPU_SetRendererOrder",{C_INT,C_POINTER})

public procedure GPU_SetRendererOrder(atom size,atom order)
	c_proc(xGPU_SetRendererOrder,{size,order})
end procedure

export constant xGPU_Init = define_c_func(gpu,"+GPU_Init",{C_UINT16,C_UINT16,C_INT},C_POINTER)

public function GPU_Init(atom w,atom h,atom flags)
	return c_func(xGPU_Init,{w,h,flags})
end function

export constant xGPU_InitRenderer = define_c_func(gpu,"+GPU_InitRenderer",{C_INT,C_UINT16,C_UINT16,C_INT},C_POINTER)

public function GPU_InitRenderer(atom rend,atom w,atom h,atom flags)
	return c_func(xGPU_InitRenderer,{rend,w,h,flags})
end function

export constant xGPU_InitRendererByID = define_c_func(gpu,"+GPU_InitRendererByID",{C_INT,C_UINT16,C_UINT16,C_INT},C_POINTER)

public function GPU_InitRendererByID(atom rend,atom w,atom h,atom flags)
	return c_func(xGPU_InitRendererByID,{rend,w,h,flags})
end function

export constant xGPU_IsFeatureEnabled = define_c_func(gpu,"+GPU_IsFeatureEnabled",{C_INT},C_BOOL)

public function GPU_IsFeaturedEnabled(atom f)
	return c_func(xGPU_IsFeatureEnabled,{f})
end function

export constant xGPU_CloseCurrentRenderer = define_c_proc(gpu,"+GPU_CloseCurrentRenderer",{})

public procedure GPU_CloseCurrentRenderer()
	c_proc(xGPU_CloseCurrentRenderer,{})
end procedure

export constant xGPU_Quit = define_c_proc(gpu,"+GPU_Quit",{})

public procedure GPU_Quit()
	c_proc(xGPU_Quit,{})
end procedure

export constant xGPU_SetDebugLevel = define_c_proc(gpu,"+GPU_SetDebugLevel",{C_INT})

public procedure GPU_SetDebugLevel(GPU_DebugLevelEnum lvl)
	c_proc(xGPU_SetDebugLevel,{lvl})
end procedure

export constant xGPU_LogInfo = define_c_proc(gpu,"+GPU_LogInfo",{C_STRING})

public procedure GPU_LogInfo(sequence format)
	c_proc(xGPU_LogInfo,{format})
end procedure

export constant xGPU_LogWarning = define_c_proc(gpu,"+GPU_LogWarning",{C_STRING})

public procedure GPU_LogWarning(sequence format)
	c_proc(xGPU_LogWarning,{format})
end procedure

export constant xGPU_LogError = define_c_proc(gpu,"+GPU_LogError",{C_STRING})

public procedure GPU_LogError(sequence format)
	c_proc(xGPU_LogError,{format})
end procedure

export constant xGPU_SetLogCallback = define_c_proc(gpu,"+GPU_SetLogCallback",{C_POINTER,C_STRING,C_POINTER})

public procedure GPU_SetLogCallback(atom l,sequence format,atom args)
	c_proc(xGPU_SetLogCallback,{l,format,args})
end procedure

export constant xGPU_PushErrorCode = define_c_proc(gpu,"+GPU_PushErrorCode",{C_STRING,C_INT,C_STRING})

public procedure GPU_PushErrorCode(sequence func,GPU_ErrorEnum err,sequence details)
	c_proc(xGPU_PushErrorCode,{func,err,details})
end procedure

export constant xGPU_PopErrorCode = define_c_func(gpu,"+GPU_PopErrorCode",{},GPU_ErrorObject)

public function GPU_PopErrorCode()
	return c_func(xGPU_PopErrorCode,{})
end function

export constant xGPU_GetErrorString = define_c_func(gpu,"+GPU_GetErrorString",{C_INT},C_STRING)

public function GPU_GetErrorString(GPU_ErrorEnum err)
	return c_func(xGPU_GetErrorString,{err})
end function

export constant xGPU_SetErrorQueueMax = define_c_proc(gpu,"+GPU_SetErrorQueueMax",{C_UINT})

public procedure GPU_SetErrorQueueMax(atom max)
	c_proc(xGPU_SetErrorQueueMax,{max})
end procedure

--Render Setup
export constant xGPU_MakeRendererID = define_c_func(gpu,"+GPU_MakeRendererID",{C_STRING,C_INT,C_INT,C_INT},GPU_RendererID)

public function GPU_MakeRendererID(sequence name,atom rend,atom maj,atom min)
	return c_func(xGPU_MakeRendererID,{name,rend,maj,min})
end function

export constant xGPU_GetRendererID = define_c_func(gpu,"+GPU_GetRendererID",{C_INT},GPU_RendererID)

public function GPU_GetRendererID(atom rend)
	return c_func(xGPU_GetRendererID,{rend})
end function

export constant xGPU_GetNumRegisteredRenderers = define_c_func(gpu,"+GPU_GetNumRegisteredRenderers",{},C_INT)

public function GPU_GetNumRegisteredRenderers()
	return c_func(xGPU_GetNumRegisteredRenderers,{})
end function

export constant xGPU_GetRegisteredRendererList = define_c_proc(gpu,"+GPU_GetRegisteredRendererList",{C_POINTER})

public function GPU_GetRegisteredRendererList(atom rend)
	return c_func(xGPU_GetRegisteredRendererList,{rend})
end function

export constant xGPU_RegisterRenderer = define_c_proc(gpu,"+GPU_RegisterRenderer",{C_INT,C_POINTER,C_POINTER})

public procedure GPU_RegisterRenderer(atom id,atom rend,atom f)
	c_proc(xGPU_RegisterRenderer,{id,rend,f})
end procedure

export constant xGPU_ReserveNextRendererEnum = define_c_func(gpu,"+GPU_ReserveNextRendererEnum",{},C_INT)

public function GPU_ReserveNextRendererEnum()
	return c_func(xGPU_ReserveNextRendererEnum,{})
end function

export constant xGPU_GetNumActiveRenderers = define_c_func(gpu,"+GPU_GetNumActiveRenderers",{},C_INT)

public function GPU_GetNumActiveRenderers()
	return c_func(xGPU_GetNumActiveRenderers,{})
end function

export constant xGPU_GetActiveRendererList = define_c_proc(gpu,"+GPU_GetActiveRendererList",{C_POINTER})

public procedure GPU_GetActiveRendererList(atom ra)
	c_proc(xGPU_GetActiveRendererList,{ra})
end procedure

export constant xGPU_GetCurrentRenderer = define_c_func(gpu,"+GPU_GetCurrentRenderer",{},C_POINTER)

public function GPU_GetCurrentRenderer()
	return c_func(xGPU_GetCurrentRenderer,{})
end function

export constant xGPU_SetCurrentRenderer = define_c_proc(gpu,"+GPU_SetCurrentRenderer",{C_INT})

public procedure GPU_SetCurrentRenderer(atom id)
	c_proc(xGPU_SetCurrentRenderer,{id})
end procedure

export constant xGPU_FreeRenderer = define_c_proc(gpu,"+GPU_FreeRenderer",{C_POINTER})

public procedure GPU_FreeRenderer(atom ren)
	c_proc(xGPU_FreeRenderer,{ren})
end procedure

export constant xGPU_ResetRendererState = define_c_proc(gpu,"+GPU_ResetRendererState",{})

public procedure GPU_ResetRendererState()
	c_proc(xGPU_ResetRendererState,{})
end procedure

export constant xGPU_SetCoordinateMode = define_c_proc(gpu,"+GPU_SetCoordinateMode",{C_BOOL})

public procedure GPU_SetCoordinateMode(atom use)
	c_proc(xGPU_SetCoordinateMode,{use})
end procedure

export constant xGPU_GetCoordinateMode = define_c_func(gpu,"+GPU_GetCoordinateMode",{},C_BOOL)

public function GPU_GetCoordinateMode()
	return c_func(xGPU_GetCoordinateMode,{})
end function

export constant xGPU_SetDefaultAnchor = define_c_proc(gpu,"+GPU_SetDefaultAnchor",{C_FLOAT,C_FLOAT})

public procedure GPU_SetDefaultAnchor(atom x,atom y)
	c_proc(xGPU_SetDefaultAnchor,{x,y})
end procedure

export constant xGPU_GetDefaultAnchor = define_c_proc(gpu,"+GPU_GetDefaultAnchor",{C_POINTER,C_POINTER})

public procedure GPU_GetDefaultAnchor(atom x,atom y)
	c_proc(xGPU_GetDefaultAnchor,{x,y})
end procedure

export constant xGPU_GetContextTarget = define_c_func(gpu,"+GPU_GetContextTarget",{},C_POINTER)

public function GPU_GetContextTarget()
	return c_func(xGPU_GetContextTarget,{})
end function

export constant xGPU_GetWindowTarget = define_c_func(gpu,"+GPU_GetWindowTarget",{C_UINT32},C_POINTER)

public function GPU_GetWindowTarget(atom id)
	return c_func(xGPU_GetWindowTarget,{id})
end function

export constant xGPU_CreateTargetFromWindow = define_c_func(gpu,"+GPU_CreateTargetFromWindow",{C_UINT32},C_POINTER)

public function GPU_CreateTargetFromWindow(atom id)
	return c_func(xGPU_CreateTargetFromWindow,{id})
end function

export constant xGPU_MakeCurrent = define_c_proc(gpu,"+GPU_MakeCurrent",{C_POINTER,C_UINT32},)

public procedure GPU_MakeCurrent(atom targ,atom id)
	c_proc(xGPU_MakeCurrent,{targ,id})
end procedure

export constant xGPU_SetWindowResolution = define_c_func(gpu,"+GPU_SetWindowResolution",{C_UINT16,C_UINT16},C_BOOL)

public function GPU_SetWindowResolution(atom w,atom h)
	return c_func(xGPU_SetWindowResolution,{w,h})
end function

export constant xGPU_SetFullscreen = define_c_func(gpu,"+GPU_SetFullscreen",{C_BOOL,C_BOOL},C_BOOL)

public function GPU_SetFullscreen(atom en_full,atom use_desk)
	return c_func(xGPU_SetFullscreen,{en_full,use_desk})
end function

export constant xGPU_GetFullscreen = define_c_func(gpu,"+GPU_GetFullscreen",{},C_BOOL)

public function GPU_GetFullscreen()
	return c_func(xGPU_GetFullscreen,{})
end function

export constant xGPU_GetActiveTarget = define_c_func(gpu,"+GPU_GetActiveTarget",{},C_POINTER)

public function GPU_GetActiveTarget()
	return c_func(xGPU_GetActiveTarget,{})
end function

export constant xGPU_SetActiveTarget = define_c_func(gpu,"+GPU_SetActiveTarget",{C_POINTER},C_BOOL)

public function GPU_SetActiveTarget(atom targ)
	return c_func(xGPU_SetActiveTarget,{targ})
end function

export constant xGPU_SetShapeBlending = define_c_proc(gpu,"+GPU_SetShapeBlending",{C_BOOL})

public procedure GPU_SetShapeBlending(atom en)
	c_proc(xGPU_SetShapeBlending,{en})
end procedure

export constant xGPU_GetBlendModeFromPreset = define_c_func(gpu,"+GPU_GetBlendModeFromPreset",{C_INT},C_INT)

public function GPU_GetBlendModeFromPreset(GPU_BlendPresetEnum pre)
	return c_func(xGPU_GetBlendModeFromPreset,{pre})
end function

export constant xGPU_SetShapeBlendFunction = define_c_proc(gpu,"+GPU_SetShapeBlendFunction",{C_INT,C_INT,C_INT,C_INT})

public procedure GPU_SetShapeBlendFunction(GPU_BlendFuncEnum src,GPU_BlendFuncEnum dst,GPU_BlendFuncEnum src_a,GPU_BlendFuncEnum dst_a)
	c_proc(xGPU_SetShapeBlendFunction,{src,dst,src_a,dst_a})
end procedure

export constant xGPU_SetShapeBlendEquation = define_c_proc(gpu,"+GPU_SetShapeBlendEquation",{C_INT,C_INT})

public procedure GPU_SetShapeBlendEquation(atom col,atom al)
	c_proc(xGPU_SetShapeBlendEquation,{col,al})
end procedure

export constant xGPU_SetShapeBlendMode = define_c_proc(gpu,"+GPU_SetShapeBlendMode",{C_INT})

public procedure GPU_SetShapeBlendMode(GPU_BlendPresetEnum mode)
	c_proc(xGPU_SetShapeBlendMode,{mode})
end procedure

export constant xGPU_SetLineThickness = define_c_func(gpu,"+GPU_SetLineThickness",{C_FLOAT},C_FLOAT)

public function GPU_SetLineThickness(atom t)
	return c_func(xGPU_SetLineThickness,{t})
end function

export constant xGPU_GetLineThickness = define_c_func(gpu,"+GPU_GetLineThickness",{},C_FLOAT)

public function GPU_GetLineThickness()
	return c_func(xGPU_GetLineThickness,{})
end function

export constant xGPU_CreateAliasTarget = define_c_func(gpu,"+GPU_CreateAliasTarget",{C_POINTER},C_POINTER)

public function GPU_CreateAliasTarget(atom tar)
	return c_func(xGPU_CreateAliasTarget,{tar})
end function

export constant xGPU_LoadTarget = define_c_func(gpu,"+GPU_LoadTarget",{C_POINTER},C_POINTER)

public function GPU_LoadTarget(atom img)
	return c_func(xGPU_LoadTarget,{img})
end function

export constant xGPU_GetTarget = define_c_func(gpu,"+GPU_GetTarget",{C_POINTER},C_POINTER)

public function GPU_GetTarget(atom img)
	return c_func(xGPU_GetTarget,{img})
end function

export constant xGPU_FreeTarget = define_c_proc(gpu,"+GPU_FreeTarget",{C_POINTER})

public procedure GPU_FreeTarget(atom tar)
	c_proc(xGPU_FreeTarget,{tar})
end procedure

export constant xGPU_SetVirtualResolution = define_c_proc(gpu,"+GPU_SetVirtualResolution",{C_POINTER,C_UINT16,C_UINT16})

public procedure GPU_SetVirtualResolution(atom tar,atom w,atom h)
	c_proc(xGPU_SetVirtualResolution,{tar,w,h})
end procedure

export constant xGPU_GetVirtualResolution = define_c_proc(gpu,"+GPU_GetVirtualResolution",{C_POINTER,C_POINTER,C_POINTER})

public procedure GPU_GetVirtualResolution(atom tar,atom w,atom h)
	c_proc(xGPU_GetVirtualResolution,{tar,w,h})
end procedure

export constant xGPU_GetVirtualCoords = define_c_proc(gpu,"+GPU_GetVirtualCoords",{C_POINTER,C_POINTER,C_POINTER,C_FLOAT,C_FLOAT})

public procedure GPU_GetVitualCoords(atom tar,atom x,atom y,atom dx,atom dy)
	c_proc(xGPU_GetVirtualCoords,{tar,x,y,dx,dy})
end procedure

export constant xGPU_UnsetVirtualResolution = define_c_proc(gpu,"+GPU_UnsetVirtualResolution",{C_POINTER})

public procedure GPU_UnsetVirtualResolution(atom tar)
	c_proc(xGPU_UnsetVirtualResolution,{tar})
end procedure

export constant xGPU_MakeRect = define_c_func(gpu,"+GPU_MakeRect",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},GPU_Rect)

public function GPU_MakeRect(atom x,atom y,atom w,atom h)
	return c_func(xGPU_MakeRect,{x,y,w,h})
end function

export constant xGPU_MakeColor = define_c_func(gpu,"+GPU_MakeColor",{C_UINT8,C_UINT8,C_UINT8,C_UINT8},SDL_Color)

public function GPU_MakeColor(atom r,atom g,atom b,atom a)
	return c_func(xGPU_MakeColor,{r,g,b,a})
end function

export constant xGPU_SetViewport = define_c_proc(gpu,"+GPU_SetViewport",{C_POINTER,GPU_Rect})

public procedure GPU_SetViewport(atom tar,sequence vp)
	c_proc(xGPU_SetViewport,{tar,vp})
end procedure

export constant xGPU_UnsetViewport = define_c_proc(gpu,"+GPU_UnsetViewport",{C_POINTER})

public procedure GPU_UnsetViewport(atom tar)
	c_proc(xGPU_UnsetViewport,{tar})
end procedure

export constant xGPU_GetDefaultCamera = define_c_func(gpu,"+GPU_GetDefaultCamera",{},GPU_Camera)

public function GPU_GetDefaultCamera()
	return c_func(xGPU_GetDefaultCamera,{})
end function

export constant xGPU_GetCamera = define_c_func(gpu,"+GPU_GetCamera",{C_POINTER},GPU_Camera)

public function GPU_GetCamera(atom tar)
	return c_func(xGPU_GetCamera,{tar})
end function

export constant xGPU_SetCamera = define_c_func(gpu,"+GPU_SetCamera",{C_POINTER,C_POINTER},GPU_Camera)

public function GPU_SetCamera(atom tar,atom cam)
	return c_func(xGPU_SetCamera,{tar,cam})
end function

export constant xGPU_EnableCamera = define_c_proc(gpu,"+GPU_EnableCamera",{C_POINTER,C_BOOL})

public procedure GPU_EnableCamera(atom tar,atom use)
	c_proc(xGPU_EnableCamera,{tar,use})
end procedure

export constant xGPU_IsCameraEnabled = define_c_func(gpu,"+GPU_ISCameraEnabled",{C_POINTER},C_BOOL)

public function GPU_IsCameraEnabled(atom tar)
	return c_func(xGPU_IsCameraEnabled,{tar})
end function

export constant xGPU_AddDepthBuffer = define_c_func(gpu,"+GPU_AddDepthBuffer",{C_POINTER},C_BOOL)

public function GPU_AddDepthBuffer(atom tar)
	return c_func(xGPU_AddDepthBuffer,{tar})
end function

export constant xGPU_SetDepthTest = define_c_proc(gpu,"+GPU_SetDepthTest",{C_POINTER,C_BOOL})

public procedure GPU_SetDepthTest(atom tar,atom en)
	c_proc(xGPU_SetDepthTest,{tar,en})
end procedure

export constant xGPU_SetDepthWrite = define_c_proc(gpu,"+GPU_SetDepthWrite",{C_POINTER,C_BOOL})

public procedure GPU_SetDepthWrite(atom tar,atom en)
	c_proc(xGPU_SetDepthWrite,{tar,en})
end procedure

export constant xGPU_SetDepthFunction = define_c_proc(gpu,"+GPU_SetDepthFunction",{C_POINTER,C_INT})

public procedure GPU_SetDepthFunction(atom tar,atom com)
	c_proc(xGPU_SetDepthFunction,{tar,com})
end procedure

export constant xGPU_GetPixel = define_c_func(gpu,"+GPU_GetPixel",{C_POINTER,C_INT16,C_INT16},SDL_Color)

public function GPU_GetPixel(atom tar,atom x,atom y)
	return c_func(xGPU_GetPixel,{tar,x,y})
end function

export constant xGPU_SetClipRect = define_c_func(gpu,"+GPU_SetClipRect",{C_POINTER,GPU_Rect},GPU_Rect)

public function GPU_SetClipRect(atom tar,sequence rect)
	return c_func(xGPU_SetClipRect,{tar,rect})
end function

export constant xGPU_SetClip = define_c_func(gpu,"+GPU_SetClip",{C_POINTER,C_INT16,C_INT16,C_UINT16,C_UINT16},GPU_Rect)

public function GPU_SetClip(atom tar,atom x,atom y,atom w,atom h)
	return c_func(xGPU_SetClip,{tar,x,y,w,h})
end function

export constant xGPU_UnsetClip = define_c_proc(gpu,"+GPU_UnsetClip",{C_POINTER})

public procedure GPU_UnsetClip(atom tar)
	c_proc(xGPU_UnsetClip,{tar})
end procedure

export constant xGPU_IntersectRect = define_c_func(gpu,"+GPU_IntersectRect",{GPU_Rect,GPU_Rect,C_POINTER},C_BOOL)

public function GPU_IntersectRect(sequence a,sequence b,atom res)
	return c_func(xGPU_IntersectRect,{a,b,res})
end function

export constant xGPU_IntersectClipRect = define_c_func(gpu,"+GPU_IntersectClipRect",{C_POINTER,GPU_Rect,C_POINTER},C_BOOL)

public function GPU_IntersectClipRect(atom tar,sequence b,atom res)
	return c_func(xGPU_IntersectClipRect,{tar,b,res})
end function

export constant xGPU_SetTargetColor = define_c_proc(gpu,"+GPU_SetTargetColor",{C_POINTER,SDL_Color})

public procedure GPU_SetTargetColor(atom tar,sequence col)
	c_proc(xGPU_SetTargetColor,{tar,col})
end procedure

export constant xGPU_SetTargetRGB = define_c_proc(gpu,"+GPU_SetTargetRGB",{C_POINTER,C_UINT8,C_UINT8,C_UINT8})

public procedure GPU_SetTargetRGB(atom tar,atom r,atom g,atom b)
	c_proc(xGPU_SetTargetRGB,{tar,r,g,b})
end procedure

export constant xGPU_SetTargetRGBA = define_c_proc(gpu,"+GPU_SetTargetRGBA",{C_POINTER,C_UINT8,C_UINT8,C_UINT8,C_UINT8})

public procedure GPU_SetTargetRGBA(atom tar,atom r,atom g,atom b,atom a)
	c_proc(xGPU_SetTargetRGBA,{tar,r,g,b,a})
end procedure

export constant xGPU_UnsetTargetColor = define_c_proc(gpu,"+GPU_UnsetTargetColor",{C_POINTER})

public procedure GPU_UnsetTargetColor(atom tar)
	c_proc(xGPU_UnsetTargetColor,{tar})
end procedure

export constant xGPU_LoadSurface = define_c_func(gpu,"+GPU_LoadSurface",{C_STRING},C_POINTER)

public function GPU_LoadSurface(sequence fname)
	return c_func(xGPU_LoadSurface,{fname})
end function

export constant xGPU_LoadSurface_RW = define_c_func(gpu,"+GPU_LoadSurface_RW",{C_POINTER,C_BOOL},C_POINTER)

public function GPU_LoadSurface_RW(atom rwops,atom f)
	return c_func(xGPU_LoadSurface_RW,{rwops,f})
end function

export constant xGPU_SaveSurface = define_c_func(gpu,"+GPU_SaveSurface",{C_POINTER,C_STRING,C_INT},C_BOOL)

public function GPU_SaveSurface(atom surf,sequence fname,atom mat)
	return c_func(xGPU_SaveSurface,{surf,fname,mat})
end function

export constant xGPU_SaveSurface_RW = define_c_func(gpu,"+GPU_SaveSurface_RW",{C_POINTER,C_POINTER,C_BOOL,C_INT},C_BOOL)

public function GPU_SaveSurface_RW(atom surf,atom rwops,atom f,atom mat)
	return c_func(xGPU_SaveSurface_RW,{surf,rwops,f,mat})
end function

export constant xGPU_CreateImage = define_c_func(gpu,"+GPU_CreateImage",{C_UINT16,C_UINT16,C_INT},C_POINTER)

public function GPU_CreateImage(atom w,atom h,atom mat)
	return c_func(xGPU_CreateImage,{w,h,mat})
end function

export constant xGPU_CreateImageUsingTexture = define_c_func(gpu,"+GPU_CreateImageUsingTexture",{C_POINTER,C_BOOL},C_POINTER)

public function GPU_CreateImageUsingTexture(atom hand,atom take)
	return c_func(xGPU_CreateImageUsingTexture,{hand,take})
end function

export constant xGPU_LoadImage = define_c_func(gpu,"+GPU_LoadImage",{C_STRING},C_POINTER)

public function GPU_LoadImage(sequence fname)
	return c_func(xGPU_LoadImage,{fname})
end function

export constant xGPU_LoadImage_RW = define_c_func(gpu,"+GPU_LoadImage_RW",{C_POINTER,C_BOOL},C_POINTER)

public function GPU_LoadImage_RW(atom rw,atom f)
	return c_func(xGPU_LoadImage_RW,{rw,f})
end function

export constant xGPU_CreateAliasImage = define_c_func(gpu,"+GPU_CreateAliasImage",{C_POINTER},C_POINTER)

public function GPU_CreateAliasImage(atom img)
	return c_func(xGPU_CreateAliasImage,{img})
end function

export constant xGPU_CopyImage = define_c_func(gpu,"+GPU_CopyImage",{C_POINTER},C_POINTER)

public function GPU_CopyImage(atom img)
	return c_func(xGPU_CopyImage,{img})
end function

export constant xGPU_FreeImage = define_c_proc(gpu,"+GPU_FreeImage",{C_POINTER})

public procedure GPU_FreeImage(atom img)
	c_proc(xGPU_FreeImage,{img})
end procedure

export constant xGPU_SetImageVirtualResolution = define_c_proc(gpu,"+GPU_SetImageVirtualResolution",{C_POINTER,C_UINT16,C_UINT16})

public procedure GPU_SetImageVirtualResolution(atom img,atom w,atom h)
	c_proc(xGPU_SetImageVirtualResolution,{img,w,h})
end procedure

export constant xGPU_UnsetImageVirtualResolution = define_c_proc(gpu,"+GPU_UnsetImageVirtualResolution",{C_POINTER})

public procedure GPU_UnsetImageVirtualResolution(atom img)
	c_proc(xGPU_UnsetImageVirtualResolution,{img})
end procedure

export constant xGPU_UpdateImage = define_c_proc(gpu,"+GPU_UpdateImage",{C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure GPU_UpdateImage(atom img,atom img_rect,atom surf,atom surf_rect)
	c_proc(xGPU_UpdateImage,{img,img_rect,surf,surf_rect})
end procedure

export constant xGPU_UpdateImageBytes = define_c_proc(gpu,"+GPU_UpdateImageBytes",{C_POINTER,C_POINTER,C_POINTER,C_INT})

public procedure GPU_UpdateImageBytes(atom img,atom rect,atom byte,atom per_row)
	c_proc(xGPU_UpdateImageBytes,{img,rect,byte,per_row})
end procedure

export constant xGPU_ReplaceImage = define_c_func(gpu,"+GPU_ReplaceImage",{C_POINTER,C_POINTER,C_POINTER},C_BOOL)

public function GPU_ReplaceImage(atom img,atom surf,atom rect)
	return c_func(xGPU_ReplaceImage,{img,surf,rect})
end function

export constant xGPU_SaveImage = define_c_func(gpu,"+GPU_SaveImage",{C_POINTER,C_STRING,C_INT},C_BOOL)

public function GPU_SaveImage(atom img,sequence fname,atom mat)
	return c_func(xGPU_SaveImage,{img,fname,mat})
end function

export constant xGPU_SaveImage_RW = define_c_func(gpu,"+GPU_SaveImage_RW",{C_POINTER,C_POINTER,C_BOOL,C_INT},C_BOOL)

public function GPU_SaveImage_RW(atom img,atom rwo,atom f,atom mat)
	return c_func(xGPU_SaveImage_RW,{img,rwo,f,mat})
end function

export constant xGPU_GenerateMipmaps = define_c_proc(gpu,"+GPU_GenerateMipmaps",{C_POINTER})

public procedure GPU_GenerateMipmaps(atom img)
	c_proc(xGPU_GenerateMipmaps,{img})
end procedure

export constant xGPU_SetColor = define_c_proc(gpu,"+GPU_SetColor",{C_POINTER,SDL_Color})

public procedure GPU_SetColor(atom img,sequence col)
	c_proc(xGPU_SetColor,{img,col})
end procedure

export constant xGPU_SetRGB = define_c_proc(gpu,"+GPU_SetRGB",{C_POINTER,C_UINT8,C_UINT8,C_UINT8})

public procedure GPU_SetRGB(atom img,atom r,atom g,atom b)
	c_proc(xGPU_SetRGB,{img,r,g,b})
end procedure

export constant xGPU_SetRGBA = define_c_proc(gpu,"+GPU_SetRGBA",{C_POINTER,C_UINT8,C_UINT8,C_UINT8,C_UINT8})

public procedure GPU_SetRGBA(atom img,atom r,atom g,atom b,atom a)
	c_proc(xGPU_SetRGBA,{img,r,g,b,a})
end procedure

export constant xGPU_UnsetColor = define_c_proc(gpu,"+GPU_UnsetColor",{C_POINTER})

public procedure GPU_UnsetColor(atom img)
	c_proc(xGPU_UnsetColor,{img})
end procedure

export constant xGPU_GetBlending = define_c_func(gpu,"+GPU_GetBlending",{C_POINTER},C_BOOL)

public function GPU_GetBlending(atom img)
	return c_func(xGPU_GetBlending,{img})
end function

export constant xGPU_SetBlending = define_c_proc(gpu,"+GPU_SetBlending",{C_POINTER,C_BOOL})

public procedure GPU_SetBlending(atom img,atom en)
	c_proc(xGPU_SetBlending,{img,en})
end procedure

export constant xGPU_SetBlendFunction = define_c_proc(gpu,"+GPU_SetBlendFunction",{C_POINTER,C_INT,C_INT,C_INT,C_INT})

public procedure GPU_SetBlendFunction(atom img,atom src_col,atom dst_col,atom src_al,atom dst_al)
	c_proc(xGPU_SetBlendFunction,{img,src_col,dst_col,src_al,dst_al})
end procedure

export constant xGPU_SetBlendEquation = define_c_proc(gpu,"+GPU_SetBlendEquation",{C_POINTER,C_INT,C_INT})

public procedure GPU_SetBlendEquation(atom img,atom col,atom al)
	c_proc(xGPU_SetBlendEquation,{img,col,al})
end procedure

export constant xGPU_SetBlendMode = define_c_proc(gpu,"+GPU_SetBlendMode",{C_POINTER,C_INT})

public procedure GPU_SetBlendMode(atom img,atom mode)
	c_proc(xGPU_SetBlendMode,{img,mode})
end procedure

export constant xGPU_SetImageFilter = define_c_proc(gpu,"+GPU_SetImageFilter",{C_POINTER,C_INT})

public procedure GPU_SetImageFilter(atom img,atom filt)
	c_proc(xGPU_SetImageFilter,{img,filt})
end procedure

export constant xGPU_SetAnchor = define_c_proc(gpu,"+GPU_SetAnchor",{C_POINTER,C_FLOAT,C_FLOAT})

public procedure GPU_SetAnchor(atom img,atom x,atom y)
	c_proc(xGPU_SetAnchor,{img,x,y})
end procedure

export constant xGPU_GetAnchor = define_c_proc(gpu,"+GPU_GetAnchor",{C_POINTER,C_POINTER,C_POINTER})

public procedure GPU_GetAnchor(atom img,atom x,atom y)
	c_proc(xGPU_GetAnchor,{img,x,y})
end procedure

export constant xGPU_GetSnapMode = define_c_func(gpu,"+GPU_GetSnapMode",{C_POINTER},C_INT)

public function GPU_GetSnapMode(atom img)
	return c_func(xGPU_GetSnapMode,{img})
end function

export constant xGPU_SetSnapMode = define_c_proc(gpu,"+GPU_SetSnapMode",{C_POINTER,C_INT})

public procedure GPU_SetSnapMode(atom img,atom mode)
	c_proc(xGPU_SetSnapMode,{img,mode})
end procedure

export constant xGPU_SetWrapMode = define_c_proc(gpu,"+GPU_SetWrapMode",{C_POINTER,C_INT,C_INT})

public procedure GPU_SetWrapMode(atom img,atom x,atom y)
	c_proc(xGPU_SetWrapMode,{img,x,y})
end procedure

export constant xGPU_CopyImageFromSurface = define_c_func(gpu,"+GPU_CopyImageFromSurface",{C_POINTER},C_POINTER)

public function GPU_CopyImageFromSurface(atom surf)
	return c_func(xGPU_CopyImageFromSurface,{surf})
end function

export constant xGPU_CopyImageFromSurfaceRect = define_c_func(gpu,"+GPU_CopyImageFromSurfaceRect",{C_POINTER,C_POINTER},C_POINTER)

public function GPU_CopyImageFromSurfaceRect(atom surf,atom rect)
	return c_func(xGPU_CopyImageFromSurfaceRect,{surf,rect})
end function

export constant xGPU_CopyImageFromTarget = define_c_func(gpu,"+GPU_CopyImageFromTarget",{C_POINTER},C_POINTER)

public function GPU_CopyImageFromTarget(atom tar)
	return c_func(xGPU_CopyImageFromTarget,{tar})
end function

export constant xGPU_CopySurfaceFromTarget = define_c_func(gpu,"+GPU_CopySurfaceFromTarget",{C_POINTER},C_POINTER)

public function GPU_CopySurfaceFromTarget(atom tar)
	return c_func(xGPU_CopySurfaceFromTarget,{tar})
end function

export constant xGPU_CopySurfaceFromImage = define_c_func(gpu,"+GPU_CopySurfaceFromImage",{C_POINTER},C_POINTER)

public function GPU_CopySurfaceFromImage(atom img)
	return c_func(xGPU_CopySurfaceFromImage,{img})
end function

export constant xGPU_VectorLength = define_c_func(gpu,"+GPU_VectorLength",{C_POINTER},C_FLOAT)

public function GPU_VectorLength(atom vec)
	return c_func(xGPU_VectorLength,{vec})
end function

export constant xGPU_VectorNormalize = define_c_proc(gpu,"+GPU_VectorNormalize",{C_POINTER})

public procedure GPU_VectorNormalize(atom vec)
	c_proc(xGPU_VectorNormalize,{vec})
end procedure

export constant xGPU_VectorDot = define_c_func(gpu,"+GPU_VectorDot",{C_POINTER,C_POINTER},C_FLOAT)

public function GPU_VectorDot(atom a,atom b)
	return c_func(xGPU_VectorDot,{a,b})
end function

export constant xGPU_VectorCross = define_c_proc(gpu,"+GPU_VectorCross",{C_POINTER,C_POINTER,C_POINTER})

public procedure GPU_VectorCross(atom res,atom a,atom b)
	c_proc(xGPU_VectorCross,{res,a,b})
end procedure

export constant xGPU_VectorCopy = define_c_proc(gpu,"+GPU_VectorCopy",{C_POINTER,C_POINTER})

public procedure GPU_VectorCopy(atom res,atom a)
	c_proc(xGPU_VectorCopy,{res,a})
end procedure

export constant xGPU_VectorApplyMatrix = define_c_proc(gpu,"+GPU_VectorApplyMatrix",{C_POINTER,C_POINTER})

public procedure GPU_VectorApplyMatrix(atom vec,atom mat)
	c_proc(xGPU_VectorApplyMatrix,{vec,mat})
end procedure

export constant xGPU_Vector4ApplyMatrix = define_c_proc(gpu,"+GPU_Vector4ApplyMatrix",{C_POINTER,C_POINTER})

public procedure GPU_Vector4ApplyMatrix(atom vec,atom mat)
	c_proc(xGPU_Vector4ApplyMatrix,{vec,mat})
end procedure

export constant xGPU_MatrixCopy = define_c_proc(gpu,"+GPU_MatrixCopy",{C_POINTER,C_POINTER})

public procedure GPU_MatrixCopy(atom res,atom a)
	c_proc(xGPU_MatrixCopy,{res,a})
end procedure

export constant xGPU_MatrixIdentity = define_c_proc(gpu,"+GPU_MatrixIdentity",{C_POINTER})

public procedure GPU_MatrixIdentity(atom res)
	c_proc(xGPU_MatrixIdentity,{res})
end procedure

export constant xGPU_MatrixOrtho = define_c_proc(gpu,"+GPU_MatrixOrtho",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_MatrixOrtho(atom res,atom left,atom right,atom bottom,atom top,atom z_near,atom z_far)
	c_proc(xGPU_MatrixOrtho,{res,left,right,bottom,top,z_near,z_far})
end procedure

export constant xGPU_MatrixFrustum = define_c_proc(gpu,"+GPU_MatrixFrustum",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_MatrixFrustum(atom res,atom left,atom right,atom bottom,atom top,atom z_near,atom z_far)
	c_proc(xGPU_MatrixFrustum,{res,left,right,bottom,top,z_near,z_far})
end procedure

export constant xGPU_MatrixPerspective = define_c_proc(gpu,"+GPU_MatrixPerspective",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_MatrixPerspective(atom res,atom fovy,atom as,atom zn,atom zf)
	c_proc(xGPU_MatrixPerspective,{res,fovy,as,zn,zf})
end procedure

export constant xGPU_MatrixLookAt = define_c_proc(gpu,"+GPU_MatrixLookAt",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_MatrixLookAt(atom mat,atom ex,atom ey,atom ez,atom tx,atom ty,atom tz,atom ux,atom uy,atom uz)
	c_proc(xGPU_MatrixLookAt,{mat,ex,ey,ez,tx,ty,tz,ux,uy,uz})
end procedure

export constant xGPU_MatrixTranslate = define_c_proc(gpu,"+GPU_MatrixTranslate",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_MatrixTranslate(atom res,atom x,atom y,atom z)
	c_proc(xGPU_MatrixTranslate,{res,x,y,z})
end procedure

export constant xGPU_MatrixScale = define_c_proc(gpu,"+GPU_MatrixScale",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_MatrixScale(atom res,atom x,atom y,atom z)
	c_proc(xGPU_MatrixScale,{res,x,y,z})
end procedure

export constant xGPU_MatrixRotate = define_c_proc(gpu,"+GPU_MatrixRotate",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_MatrixRotate(atom res,atom deg,atom x,atom y,atom z)
	c_proc(xGPU_MatrixRotate,{res,deg,x,y,z})
end procedure

export constant xGPU_MatrixMultiply = define_c_proc(gpu,"+GPU_MatrixMultiply",{C_POINTER,C_POINTER,C_POINTER})

public procedure GPU_MatrixMultiply(atom res,atom a,atom b)
	c_proc(xGPU_MatrixMultiply,{res,a,b})
end procedure

export constant xGPU_MultiplyAndAssign = define_c_proc(gpu,"+GPU_MultiplyAndAssign",{C_POINTER,C_POINTER})

public procedure GPU_MultiplyAndAssign(atom res,atom b)
	c_proc(xGPU_MultiplyAndAssign,{res,b})
end procedure

export constant xGPU_GetMatrixString = define_c_func(gpu,"+GPU_GetMatrixString",{C_POINTER},C_STRING)

public function GPU_GetMatrixString(atom a)
	return c_func(xGPU_GetMatrixString,{a})
end function

export constant xGPU_GetCurrentMatrix = define_c_func(gpu,"+GPU_GetCurrentMatrix",{},C_POINTER)

public function GPU_GetCurrentMatrix()
	return c_func(xGPU_GetCurrentMatrix,{})
end function

export constant xGPU_GetTopMatrix = define_c_func(gpu,"+GPU_GetTopMatrix",{C_POINTER},C_POINTER)

public function GPU_GetTopMatrix(atom st)
	return c_func(xGPU_GetTopMatrix,{st})
end function

export constant xGPU_GetModel = define_c_func(gpu,"+GPU_GetModel",{},C_POINTER)

public function GPU_GetModel()
	return c_func(xGPU_GetModel,{})
end function

export constant xGPU_GetView = define_c_func(gpu,"+GPU_GetView",{},C_POINTER)

public function GPU_GetView()
	return c_func(xGPU_GetView,{})
end function

export constant xGPU_GetProjection = define_c_func(gpu,"+GPU_GetProjection",{},C_POINTER)

public function GPU_GetProjection()
	return c_func(xGPU_GetProjection,{})
end function

export constant xGPU_GetModelViewProjection = define_c_proc(gpu,"+GPU_GetModelViewProjection",{C_POINTER})

public procedure GPU_GetModelViewProjection(atom res)
	c_proc(xGPU_GetModelViewProjection,{res})
end procedure

export constant xGPU_CreateMatrixStack = define_c_func(gpu,"+GPU_CreateMatrixStack",{},C_POINTER)

public function GPU_CreateMatrixStack()
	return c_func(xGPU_CreateMatrixStack,{})
end function

export constant xGPU_FreeMatrixStack = define_c_proc(gpu,"+GPU_FreeMatrixStack",{C_POINTER})

public procedure GPU_FreeMatrixStack(atom st)
	c_proc(xGPU_FreeMatrixStack,{st})
end procedure

export constant xGPU_InitMatrixStack = define_c_proc(gpu,"+GPU_InitMatrixStack",{C_POINTER})

public procedure GPU_InitMatrixStack(atom st)
	c_proc(xGPU_InitMatrixStack,{st})
end procedure

export constant xGPU_CopyMatrixStack = define_c_proc(gpu,"+GPU_CopyMatrixStack",{C_POINTER,C_POINTER})

public procedure GPU_CopyMatrixStack(atom st,atom dst)
	c_proc(xGPU_CopyMatrixStack,{st,dst})
end procedure

export constant xGPU_ClearMatrixStack = define_c_proc(gpu,"+GPU_ClearMatrixStack",{C_POINTER})

public procedure GPU_ClearMatrixStack(atom st)
	c_proc(xGPU_ClearMatrixStack,{st})
end procedure

export constant xGPU_ResetProjection = define_c_proc(gpu,"+GPU_ResetProjection",{C_POINTER})

public procedure GPU_ResetProjection(atom tar)
	c_proc(xGPU_ResetProjection,{tar})
end procedure

export constant xGPU_MatrixMode = define_c_proc(gpu,"+GPU_MatrixMode",{C_POINTER,C_INT})

public procedure GPU_MatrixMode(atom tar,atom mode)
	c_proc(xGPU_MatrixMode,{tar,mode})
end procedure

export constant xGPU_SetProjection = define_c_proc(gpu,"+GPU_SetProjection",{C_POINTER})

public procedure GPU_SetProjection(atom a)
	c_proc(xGPU_SetProjection,{a})
end procedure

export constant xGPU_SetView = define_c_proc(gpu,"+GPU_SetView",{C_POINTER})

public procedure GPU_SetView(atom a)
	c_proc(xGPU_SetView,{a})
end procedure

export constant xGPU_SetModel = define_c_proc(gpu,"+GPU_SetModel",{C_POINTER})

public procedure GPU_SetModel(atom a)
	c_proc(xGPU_SetModel,{a})
end procedure

export constant xGPU_SetProjectionFromStack = define_c_proc(gpu,"+GPU_SetProjectionFromStack",{C_POINTER})

public procedure GPU_SetProjectionFromStack(atom st)
	c_proc(xGPU_SetProjectionFromStack,{st})
end procedure

export constant xGPU_SetViewFromStack = define_c_proc(gpu,"+GPU_SetViewFromStack",{C_POINTER})

public procedure GPU_SetViewFromStack(atom st)
	c_proc(xGPU_SetViewFromStack,{st})
end procedure

export constant xGPU_SetModelFromStack = define_c_proc(gpu,"+GPU_SetModelFromStack",{C_POINTER})

public procedure GPU_SetModelFromStack(atom st)
	c_proc(xGPU_SetModelFromStack,{st})
end procedure

export constant xGPU_PushMatrix = define_c_proc(gpu,"+GPU_PushMatrix",{})

public procedure GPU_PushMatrix()
	c_proc(xGPU_PushMatrix,{})
end procedure

export constant xGPU_PopMatrix = define_c_proc(gpu,"+GPU_PopMatrix",{})

public procedure GPU_PopMatrix()
	c_proc(xGPU_PopMatrix,{})
end procedure

export constant xGPU_LoadIdentity = define_c_proc(gpu,"+GPU_LoadIdentity",{})

public procedure GPU_LoadIdentity()
	c_proc(xGPU_LoadIdentity,{})
end procedure

export constant xGPU_LoadMatrix = define_c_proc(gpu,"+GPU_LoadMatrix",{C_POINTER})

public procedure GPU_LoadMatrix(atom mat)
	c_proc(xGPU_LoadMatrix,{mat})
end procedure

export constant xGPU_Ortho = define_c_proc(gpu,"+GPU_Ortho",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_Ortho(atom left,atom right,atom bottom,atom top,atom z_near,atom z_far)
	c_proc(xGPU_Ortho,{left,right,bottom,top,z_near,z_far})
end procedure

export constant xGPU_Frustum = define_c_proc(gpu,"+GPU_Frustum",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_Frustum(atom left,atom right,atom bottom,atom top,atom z_near,atom z_far)
	c_proc(xGPU_Frustum,{left,right,bottom,top,z_near,z_far})
end procedure

export constant xGPU_Perspective = define_c_proc(gpu,"+GPU_Perspective",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_Perspective(atom fovy,atom as,atom zn,atom zf)
	c_proc(xGPU_Perspective,{fovy,as,zn,zf})
end procedure

export constant xGPU_LookAt = define_c_proc(gpu,"+GPU_LookAt",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_LookAt(atom ex,atom ey,atom ez,atom tx,atom ty,atom tz,atom ux,atom uy,atom uz)
	c_proc(xGPU_LookAt,{ex,ey,ez,tx,ty,tz,ux,uy,uz})
end procedure

export constant xGPU_Translate = define_c_proc(gpu,"+GPU_Translate",{C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_Translate(atom x,atom y,atom z)
	c_proc(xGPU_Translate,{x,y,z})
end procedure

export constant xGPU_Scale = define_c_proc(gpu,"+GPU_Scale",{C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_Scale(atom x,atom y,atom z)
	c_proc(xGPU_Scale,{x,y,z})
end procedure

export constant xGPU_Rotate = define_c_proc(gpu,"+GPU_Rotate",{C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_Rotate(atom deg,atom x,atom y,atom z)
	c_proc(xGPU_Rotate,{deg,x,y,z})
end procedure

export constant xGPU_MultMatrix = define_c_proc(gpu,"+GPU_MultMatrix",{C_POINTER})

public procedure GPU_MultMatrix(atom m)
	c_proc(xGPU_MultMatrix,{m})
end procedure

export constant xGPU_Clear = define_c_proc(gpu,"+GPU_Clear",{C_POINTER})

public procedure GPU_Clear(atom tar)
	c_proc(xGPU_Clear,{tar})
end procedure

export constant xGPU_ClearColor = define_c_proc(gpu,"+GPU_ClearColor",{C_POINTER,SDL_Color})

public procedure GPU_ClearColor(atom tar,sequence col)
	c_proc(xGPU_ClearColor,{tar,col})
end procedure

export constant xGPU_ClearRGB = define_c_proc(gpu,"+GPU_ClearRGB",{C_POINTER,C_UINT8,C_UINT8,C_UINT8})

public procedure GPU_ClearRGB(atom tar,atom r,atom g,atom b)
	c_proc(xGPU_ClearRGB,{tar,r,g,b})
end procedure

export constant xGPU_ClearRGBA = define_c_proc(gpu,"+GPU_ClearRGBA",{C_POINTER,C_UINT8,C_UINT8,C_UINT8})

public procedure GPU_ClearRGBA(atom tar,atom r,atom g,atom b,atom a)
	c_proc(xGPU_ClearRGBA,{tar,r,g,b,a})
end procedure

export constant xGPU_Blit = define_c_proc(gpu,"+GPU_Blit",{C_POINTER,C_POINTER,C_POINTER,C_FLOAT,C_FLOAT})

public procedure GPU_Blit(atom img,atom src,atom tar,atom x,atom y)
	c_proc(xGPU_Blit,{img,src,tar,x,y})
end procedure

export constant xGPU_BlitRotate = define_c_proc(gpu,"+GPU_BlitRotate",{C_POINTER,C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_BlitRotate(atom img,atom src,atom tar,atom x,atom y,atom deg)
	c_proc(xGPU_BlitRotate,{img,src,tar,x,y,deg})
end procedure

export constant xGPU_BlitScale = define_c_proc(gpu,"+GPU_BlitScale",{C_POINTER,C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_BlitScale(atom img,atom src,atom tar,atom x,atom y,atom sx,atom sy)
	c_proc(xGPU_BlitScale,{img,src,tar,x,y,sx,sy})
end procedure

export constant xGPU_BlitTransform = define_c_proc(gpu,"+GPU_BlitTransform",{C_POINTER,C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_BlitTransform(atom img,atom src,atom tar,atom x,atom y,atom deg,atom sx,atom sy)
	c_proc(xGPU_BlitTransform,{img,src,tar,x,y,deg,sx,sy})
end procedure

export constant xGPU_BlitTransformX = define_c_proc(gpu,"+GPU_BlitTransformX",{C_POINTER,C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT})

public procedure GPU_BlitTransformX(atom img,atom src,atom tar,atom x,atom y,atom px,atom py,atom deg,atom sx,atom sy)
	c_proc(xGPU_BlitTransformX,{img,src,tar,x,y,px,py,deg,sx,sy})
end procedure

export constant xGPU_BlitRect = define_c_proc(gpu,"+GPU_BlitRect",{C_POINTER,C_POINTER,C_POINTER,C_POINTER})

public procedure GPU_BlitRect(atom img,atom src,atom tar,atom dst)
	c_proc(xGPU_BlitRect,{img,src,tar,dst})
end procedure

export constant xGPU_BlitRectX = define_c_proc(gpu,"+GPU_BlitRectX",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_INT})

public procedure GPU_BlitRectX(atom img,atom src,atom tar,atom dst,atom deg,atom x,atom y,atom flip)
	c_proc(xGPU_BlitRectX,{img,src,tar,dst,deg,x,y,flip})
end procedure

export constant xGPU_TriangleBatch = define_c_proc(gpu,"+GPU_TriangleBatch",{C_POINTER,C_POINTER,C_USHORT,C_POINTER,C_UINT,C_POINTER,C_INT})

public procedure GPU_TriangleBatch(atom img,atom tar,atom num,atom val,atom num_i,atom idc,atom flags)
	c_proc(xGPU_TriangleBatch,{img,tar,num,val,num_i,idc,flags})
end procedure

export constant xGPU_TriangleBatchX = define_c_proc(gpu,"+GPU_TriangleBatchX",{C_POINTER,C_POINTER,C_USHORT,C_POINTER,C_UINT,C_POINTER,C_INT})

public procedure GPU_TriangleBatchX(atom img,atom tar,atom num,atom val,atom idc,atom idcs,atom flags)
	c_proc(xGPU_TriangleBatchX,{img,tar,num,val,idc,idcs,flags})
end procedure

export constant xGPU_PrimitiveBatch = define_c_proc(gpu,"+GPU_PrimitiveBatch",{C_POINTER,C_POINTER,C_INT,C_USHORT,C_POINTER,C_UINT,C_POINTER,C_INT})

public procedure GPU_PrimitiveBatch(atom img,atom tar,atom pt,atom num_vert,atom val,atom num_idc,atom idc,atom flag)
	c_proc(xGPU_PrimitiveBatch,{img,tar,pt,num_vert,val,num_idc,idc,flag})
end procedure

export constant xGPU_PrimitiveBatchV = define_c_proc(gpu,"+GPU_PrimitiveBatchV",{C_POINTER,C_POINTER,C_INT,C_USHORT,C_POINTER,C_UINT,C_POINTER,C_INT})

public procedure GPU_PrimitiveBatchV(atom img,atom tar,atom pt,atom num_vert,atom val,atom num_idc,atom idc,atom flag)
	c_proc(xGPU_PrimitiveBatchV,{img,tar,pt,num_vert,val,num_idc,idc,flag})
end procedure

export constant xGPU_FlushBlitBuffer = define_c_proc(gpu,"+GPU_FlushBlitBuffer",{})

public procedure GPU_FlushBlitBuffer()
	c_proc(xGPU_FlushBlitBuffer,{})
end procedure

export constant xGPU_Flip = define_c_proc(gpu,"+GPU_Flip",{C_POINTER})

public procedure GPU_Flip(atom tar)
	c_proc(xGPU_Flip,{tar})
end procedure

export constant xGPU_Pixel = define_c_proc(gpu,"+GPU_Pixel",{C_POINTER,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_Pixel(atom tar,atom x,atom y,sequence col)
	c_proc(xGPU_Pixel,{tar,x,y,col})
end procedure

export constant xGPU_Line = define_c_proc(gpu,"+GPU_Line",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_Line(atom tar,atom x,atom y,atom x2,atom y2,sequence col)
	c_proc(xGPU_Line,{tar,x,y,x2,y2,col})
end procedure

export constant xGPU_Arc = define_c_proc(gpu,"+GPU_Arc",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_Arc(atom tar,atom x,atom y,atom rad,atom sa,atom ea,sequence col)
	c_proc(xGPU_Arc,{tar,x,y,rad,sa,ea,col})
end procedure

export constant xGPU_ArcFilled = define_c_proc(gpu,"+GPU_ArcFilled",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_ArcFilled(atom tar,atom x,atom y,atom rad,atom sa,atom ea,sequence col)
	c_proc(xGPU_ArcFilled,{tar,x,y,rad,sa,ea,col})
end procedure

export constant xGPU_Circle = define_c_proc(gpu,"+GPU_Circle",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_Circle(atom tar,atom x,atom y,atom rad,sequence col)
	c_proc(xGPU_Circle,{tar,x,y,rad,col})
end procedure

export constant xGPU_CircleFilled = define_c_proc(gpu,"+GPU_CircleFilled",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_CircleFilled(atom tar,atom x,atom y,atom rad,sequence col)
	c_proc(xGPU_CircleFilled,{tar,x,y,rad,col})
end procedure

export constant xGPU_Ellipse = define_c_proc(gpu,"+GPU_Ellipse",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_Ellipse(atom tar,atom x,atom y,atom rx,atom ry,atom deg, sequence col)
	c_proc(xGPU_Ellipse,{tar,x,y,rx,ry,deg,col})
end procedure

export constant xGPU_EllipseFilled = define_c_proc(gpu,"+GPU_EllipseFilled",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_EllipseFilled(atom tar,atom x,atom y,atom rx,atom ry,atom deg, sequence col)
	c_proc(xGPU_EllipseFilled,{tar,x,y,rx,ry,deg,col})
end procedure

export constant xGPU_Sector = define_c_proc(gpu,"+GPU_Sector",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_Sector(atom tar,atom x,atom y,atom in_rad,atom out_rad,atom sa,atom ea,sequence col)
	c_proc(xGPU_Sector,{tar,x,y,in_rad,out_rad,sa,ea,col})
end procedure

export constant xGPU_SectorFilled = define_c_proc(gpu,"+GPU_SectorFilled",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_SectorFilled(atom tar,atom x,atom y,atom in_rad,atom out_rad,atom sa,atom ea,sequence col)
	c_proc(xGPU_SectorFilled,{tar,x,y,in_rad,out_rad,sa,ea,col})
end procedure

export constant xGPU_Tri = define_c_proc(gpu,"+GPU_Tri",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_Tri(atom tar,atom x,atom y,atom x2,atom y2,atom x3,atom y3,sequence col)
	c_proc(xGPU_Tri,{tar,x,y,x2,y2,x3,y3,col})
end procedure

export constant xGPU_TriFilled = define_c_proc(gpu,"+GPU_TriFilled",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_TriFilled(atom tar,atom x,atom y,atom x2,atom y2,atom x3,atom y3,sequence col)
	c_proc(xGPU_TriFilled,{tar,x,y,x2,y2,x3,y3,col})
end procedure

export constant xGPU_Rectangle = define_c_proc(gpu,"+GPU_Rectangle",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_Rectangle(atom tar,atom x,atom y,atom x2,atom y2,sequence col)
	c_proc(xGPU_Rectangle,{tar,x,y,x2,y2,col})
end procedure

export constant xGPU_Rectangle2 = define_c_proc(gpu,"+GPU_Rectangle2",{C_POINTER,GPU_Rect,SDL_Color})

public procedure GPU_Rectangle2(atom tar,sequence rect,sequence col)
	c_proc(xGPU_Rectangle2,{tar,rect,col})
end procedure

export constant xGPU_RectangleFilled = define_c_proc(gpu,"+GPU_RectangleFilled",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_RectangleFilled(atom tar,atom x,atom y,atom x2,atom y2,sequence col)
	c_proc(xGPU_RectangleFilled,{tar,x,y,x2,y2,col})
end procedure

export constant xGPU_RectangleFilled2 = define_c_proc(gpu,"+GPU_RectangleFilled2",{C_POINTER,GPU_Rect,SDL_Color})

public procedure GPU_RectangleFilled2(atom tar,sequence rect,sequence col)
	c_proc(xGPU_RectangleFilled2,{tar,rect,col})
end procedure

export constant xGPU_RectangleRound = define_c_proc(gpu,"+GPU_RectangleRound",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_RectangleRound(atom tar,atom x,atom y,atom x2,atom y2,atom rad,sequence col)
	c_proc(xGPU_RectangleRound,{tar,x,y,x2,rad,col})
end procedure

export constant xGPU_RectangleRound2 = define_c_proc(gpu,"+GPU_RectangleRound2",{C_POINTER,GPU_Rect,SDL_Color})

public procedure GPU_RectangleRound2(atom tar,sequence rect,sequence col)
	c_proc(xGPU_RectangleRound2,{tar,rect,col})
end procedure

export constant xGPU_RectangleRoundFilled = define_c_proc(gpu,"+GPU_RectangleRoundFilled",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT,SDL_Color})

public procedure GPU_RectangleRoundFilled(atom tar,atom x,atom y,atom x2,atom y2,atom rad,sequence col)
	c_proc(xGPU_RectangleRoundFilled,{tar,x,y,x2,rad,col})
end procedure

export constant xGPU_RectangleRoundFilled2 = define_c_proc(gpu,"+GPU_RectangleRoundFilled2",{C_POINTER,GPU_Rect,C_FLOAT,SDL_Color})

public procedure GPU_RectangleRoundFilled2(atom tar,sequence rect,atom rad,sequence col)
	c_proc(xGPU_RectangleRoundFilled2,{tar,rect,col})
end procedure

export constant xGPU_Polygon = define_c_proc(gpu,"+GPU_Polygon",{C_POINTER,C_UINT,C_POINTER,SDL_Color})

public procedure GPU_Polygon(atom tar,atom num,atom verts,sequence col)
	c_proc(xGPU_Polygon,{tar,num,verts,col})
end procedure

export constant xGPU_Polyline = define_c_proc(gpu,"+GPU_Polyline",{C_POINTER,C_UINT,C_POINTER,SDL_Color,C_BOOL})

public procedure GPU_Polyline(atom tar,atom num,atom verts,sequence col,atom cls)
	c_proc(xGPU_Polyline,{tar,num,verts,col,cls})
end procedure

export constant xGPU_PolygonFilled = define_c_proc(gpu,"+GPU_PolygonFilled",{C_POINTER,C_UINT,C_POINTER,SDL_Color})

public procedure GPU_PolygonFilled(atom tar,atom num,atom vert,sequence col)
	c_proc(xGPU_PolygonFilled,{tar,num,vert,col})
end procedure

export constant xGPU_CreateShaderProgram = define_c_func(gpu,"+GPU_CreateShaderProgram",{},C_UINT32)

public function GPU_CreateShaderProgram()
	return c_func(xGPU_CreateShaderProgram,{})
end function

export constant xGPU_FreeShaderProgram = define_c_proc(gpu,"+GPU_FreeShaderProgram",{C_UINT32})

public procedure GPU_FreeShaderProgram(atom po)
	c_proc(xGPU_FreeShaderProgram,{po})
end procedure

export constant xGPU_CompileShader_RW = define_c_func(gpu,"+GPU_CompileShader_RW",{C_INT,C_POINTER,C_BOOL},C_UINT32)

public function GPU_CompileShader_RW(atom st,atom src,atom fr)
	return c_func(xGPU_CompileShader_RW,{st,src,fr})
end function

export constant xGPU_CompileShader = define_c_func(gpu,"+GPU_CompileShader",{C_INT,C_STRING},C_UINT32)

public function GPU_CompileShader(atom st,sequence src)
	return c_func(xGPU_CompileShader,{st,src})
end function

export constant xGPU_LoadShader = define_c_func(gpu,"+GPU_LoadShader",{C_INT,C_STRING},C_UINT32)

public function GPU_LoadShader(atom st,sequence fname)
	return c_func(xGPU_LoadShader,{st,fname})
end function

export constant xGPU_LinkShaders = define_c_func(gpu,"+GPU_LinkShaders",{C_UINT32,C_UINT32},C_UINT32)

public function GPU_LinkShaders(atom so,atom so2)
	return c_func(xGPU_LinkShaders,{so,so2})
end function

export constant xGPU_LinkManyShaders = define_c_func(gpu,"+GPU_LinkManyShaders",{C_POINTER,C_INT},C_UINT32)

public function GPU_LinkManyShaders(atom so,atom cnt)
	return c_func(xGPU_LinkManyShaders,{so,cnt})
end function

export constant xGPU_AttachShader = define_c_proc(gpu,"+GPU_AttachShader",{C_UINT32,C_UINT32})

public procedure GPU_AttachShader(atom po,atom so)
	c_proc(xGPU_AttachShader,{po,so})
end procedure

export constant xGPU_DetachShader = define_c_proc(gpu,"+GPU_DetachShader",{C_UINT32,C_UINT32})

public procedure GPU_DetachShader(atom po,atom so)
	c_proc(xGPU_DetachShader,{po,so})
end procedure

export constant xGPU_LinkShaderProgram = define_c_func(gpu,"+GPU_LinkShaderProgram",{C_UINT32},C_BOOL)

public function GPU_LinkShaderProgram(atom po)
	return c_func(xGPU_LinkShaderProgram,{po})
end function

export constant xGPU_GetCurrentShaderProgram = define_c_func(gpu,"+GPU_GetCurrentShaderProgram",{},C_UINT32)

public function GPU_GetCurrentShaderProgram()
	return c_func(xGPU_GetCurrentShaderProgram,{})
end function

export constant xGPU_IsDefaultShaderProgram = define_c_func(gpu,"+GPU_IsDefaultShaderProgram",{C_UINT32},C_BOOL)

public function GPU_IsDefaultShaderProgram(atom po)
	return c_func(xGPU_IsDefaultShaderProgram,{po})
end function

export constant xGPU_ActivateShaderProgram = define_c_proc(gpu,"+GPU_ActivateShaderProgram",{C_UINT32,C_POINTER})

public procedure GPU_ActivateShaderProgram(atom po,atom blk)
	c_proc(xGPU_ActivateShaderProgram,{po,blk})
end procedure

export constant xGPU_DeactivateShaderProgram = define_c_proc(gpu,"+GPU_DeactivateShaderProgram",{})

public procedure GPU_DeactivateShaderProgram()
	c_proc(xGPU_DeactivateShaderProgram,{})
end procedure

export constant xGPU_GetShaderMessage = define_c_func(gpu,"+GPU_GetShaderMessage",{},C_STRING)

public function GPU_GetShaderMessage()
	return c_func(xGPU_GetShaderMessage,{})
end function

export constant xGPU_GetAttributeLocation = define_c_func(gpu,"+GPU_GetAttributeLocation",{C_UINT32,C_STRING},C_INT)

public function GPU_GetAttributeLocation(atom po,sequence name)
	return c_func(xGPU_GetAttributeLocation,{po,name})
end function

export constant xGPU_MakeAttributeFormat = define_c_func(gpu,"+GPU_MakeAttributeFormat",{C_INT,C_INT,C_BOOL,C_INT,C_INT},C_INT)

public function GPU_MakeAttributeFormat(atom num,atom xt,atom norm,atom sb,atom ob)
	return c_func(xGPU_MakeAttributeFormat,{num,xt,norm,sb,ob})
end function

export constant xGPU_GetUniformLocation = define_c_func(gpu,"+GPU_GetUniformLocation",{C_UINT32,C_STRING},C_INT)

public function GPU_GetUniformLocation(atom po,sequence name)
	return c_func(xGPU_GetUniformLocation,{po,name})
end function

export constant xGPU_LoadShaderBlock = define_c_func(gpu,"+GPU_LoadShaderBlock",{C_UINT32,C_STRING,C_STRING,C_STRING,C_STRING},C_INT)

public function GPU_LoadShaderBlock(atom po,sequence pos_name,sequence tex_name,sequence col_name,sequence m_name)
	return c_func(xGPU_LoadShaderBlock,{po,pos_name,tex_name,col_name,m_name})
end function

export constant xGPU_SetShaderBlock = define_c_proc(gpu,"+GPU_SetShaderBlock",{C_INT})

public procedure GPU_SetShaderBlock(atom blk)
	c_proc(xGPU_SetShaderBlock,{blk})
end procedure

export constant xGPU_GetShaderBlock = define_c_func(gpu,"+GPU_GetShaderBlock",{},C_INT)

public function GPU_GetShaderBlock()
	return c_func(xGPU_GetShaderBlock,{})
end function

export constant xGPU_SetShaderImage = define_c_proc(gpu,"+GPU_SetShaderImage",{C_POINTER,C_INT,C_INT})

public procedure GPU_SetShaderImage(atom img,atom loc,atom iu)
	c_proc(xGPU_SetShaderImage,{img,loc,iu})
end procedure

export constant xGPU_GetUniformv = define_c_proc(gpu,"+GPU_GetUniformv",{C_UINT32,C_INT,C_POINTER})

public procedure GPU_GetUniformv(atom po,atom loc,atom val)
	c_proc(xGPU_GetUniformv,{po,loc,val})
end procedure

export constant xGPU_SetUniformi = define_c_proc(gpu,"+GPU_SetUniformi",{C_INT,C_INT})

public procedure GPU_SetUniformi(atom loc,atom val)
	c_proc(xGPU_SetUniformi,{loc,val})
end procedure

export constant xGPU_SetUniformiv = define_c_proc(gpu,"+GPU_SetUniformiv",{C_INT,C_INT,C_INT,C_POINTER})

public procedure GPU_SetUniformiv(atom loc,atom num,atom num_val,atom val)
	c_proc(xGPU_SetUniformiv,{loc,num,num_val,val})
end procedure

export constant xGPU_GetUniformuiv = define_c_proc(gpu,"+GPU_GetUniformuiv",{C_UINT32,C_INT,C_POINTER})

public procedure GPU_GetUniformuiv(atom po,atom loc,atom val)
	c_proc(xGPU_GetUniformuiv,{po,loc,val})
end procedure

export constant xGPU_SetUniformui = define_c_proc(gpu,"+GPU_SetUniformui",{C_INT,C_UINT})

public procedure GPU_SetUniformui(atom loc,atom val)
	c_proc(xGPU_SetUniformui,{loc,val})
end procedure

export constant xGPU_GetUniformfv = define_c_proc(gpu,"+GPU_GetUniformfv",{C_UINT32,C_INT,C_POINTER})

public procedure GPU_GetUniformfv(atom po,atom loc,atom val)
	c_proc(xGPU_GetUniformfv,{po,loc,val})
end procedure

export constant xGPU_SetUniformf = define_c_proc(gpu,"+GPU_SetUniformf",{C_INT,C_FLOAT})

public procedure GPU_SetUniformf(atom loc,atom val)
	c_proc(xGPU_SetUniformf,{loc,val})
end procedure

export constant xGPU_SetUniformfv = define_c_proc(gpu,"+GPU_SetUniformfv",{C_INT,C_INT,C_INT,C_POINTER})

public procedure GPU_SetUniformfv(atom loc,atom num,atom num_val,atom val)
	c_proc(xGPU_SetUniformfv,{loc,num,num_val,val})
end procedure

export constant xGPU_GetUniformMatrixfv = define_c_proc(gpu,"+GPU_GetUniformMatrixfv",{C_UINT32,C_INT,C_POINTER})

public procedure GPU_GetUniformMatrixfv(atom po,atom loc,atom val)
	c_proc(xGPU_GetUniformMatrixfv,{po,loc,val})
end procedure

export constant xGPU_SetUniformMatrixfv = define_c_proc(gpu,"+GPU_SetUniformMatrixfv",{C_INT,C_INT,C_INT,C_INT,C_BOOL,C_POINTER})

public procedure GPU_SetUniformMatrixfv(atom loc,atom num,atom rows,atom col,atom trans,atom val)
	c_proc(xGPU_SetUniformMatrixfv,{loc,num,rows,col,trans,val})
end procedure

export constant xGPU_SetAttributef = define_c_proc(gpu,"+GPU_SetAttributef",{C_INT,C_FLOAT})

public procedure GPU_SetAttributef(atom loc,atom val)
	c_proc(xGPU_SetAttributef,{loc,val})
end procedure

export constant xGPU_SetAttributei = define_c_proc(gpu,"+GPU_SetAttributei",{C_INT,C_INT})

public procedure GPU_SetAttributei(atom loc,atom val)
	c_proc(xGPU_SetAttributei,{loc,val})
end procedure

export constant xGPU_SetAttributeui = define_c_proc(gpu,"+GPU_SetAttributeui",{C_INT,C_UINT})

public procedure GPU_SetAttributeui(atom loc,atom val)
	c_proc(xGPU_SetAttributeui,{loc,val})
end procedure

export constant xGPU_SetAttributefv = define_c_proc(gpu,"+GPU_SetAttributefv",{C_INT,C_INT,C_POINTER})

public procedure GPU_SetAttributefv(atom loc,atom num,atom val)
	c_proc(xGPU_SetAttributefv,{loc,num,val})
end procedure

export constant xGPU_SetAttributeiv = define_c_proc(gpu,"+GPU_SetAttributeiv",{C_INT,C_INT,C_POINTER})

public procedure GPU_SetAttributeiv(atom loc,atom num,atom val)
	c_proc(xGPU_SetAttributeiv,{loc,num,val})
end procedure

export constant xGPU_SetAttributeuiv = define_c_proc(gpu,"+GPU_SetAttributeuiv",{C_INT,C_INT,C_POINTER})

public procedure GPU_SetAttributeuiv(atom loc,atom num,atom val)
	c_proc(xGPU_SetAttributeuiv,{loc,num,val})
end procedure

export constant xGPU_SetAttributeSource = define_c_proc(gpu,"+GPU_SetAttributeSource",{C_INT,C_INT})

public procedure GPU_SetAttributeSource(atom num,atom src)
	c_proc(xGPU_SetAttributeSource,{num,src})
end procedure
­23.9