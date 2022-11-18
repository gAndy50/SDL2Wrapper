include std/ffi.e

include SDL_rect.e
include SDL_video.e

include sdl.e

public enum type SDL_RenderFlags
	SDL_RENDERER_SOFTWARE = 1,
	SDL_RENDERER_ACCELERATED = 2,
	SDL_RENDERER_PRESENTVSYNC = 4,
	SDL_RENDERER_TARGETEXTURE = 8
end type

public constant SDL_RendererInfo = define_c_type({
	C_STRING, --name
	C_UINT, --flags
	C_UINT, --num_texture_formats
	{C_UINT,16}, --texture formats
	C_INT, --max_tex_width
	C_INT --max_tex_height
})

public constant SDL_Vertex = define_c_type({
	SDL_FPoint, --position
	SDL_Color, --color
	SDL_FPoint --tex_coord
})

public enum type SDL_ScaleMode
	SDL_ScaleModeNearest = 0,
	SDL_ScaleModeLinear,
	SDL_ScaleModeBest
end type

public enum type SDL_TextureAccess
	SDL_TEXTUREACCESS_STATIC = 0,
	SDL_TEXTUREACCESS_STREAMING,
	SDL_TEXTUREACCESS_TARGET
end type

public enum type SDL_TextureModulate
	SDL_TEXTUREMODULATE_NONE = 0,
	SDL_TEXTUREMODULATE_COLOR = 1,
	SDL_TEXTUREMODULATE_ALPHA = 2
end type

public enum type SDL_RendererFlip
	SDL_FLIP_NONE = 0,
	SDL_FLIP_HORIZONTAL = 1,
	SDL_FLIP_VERTICAL = 2
end type

export constant xSDL_GetNumRenderDrivers = define_c_func(sdl,"+SDL_GetNumRenderDrivers",{},C_INT)

public function SDL_GetNumRenderDrivers()
	return c_func(xSDL_GetNumRenderDrivers,{})
end function

export constant xSDL_GetRenderDriverInfo = define_c_func(sdl,"+SDL_GetRenderDriverInfo",{C_INT,SDL_RendererInfo},C_INT)

public function SDL_GetRenderDriverInfo(atom index,sequence info)
	return c_func(xSDL_GetRenderDriverInfo,{index,info})
end function

export constant xSDL_CreateWindowAndRenderer = define_c_func(sdl,"+SDL_CreateWindowAndRenderer",{C_INT,C_INT,C_UINT,C_POINTER,C_POINTER},C_INT)

public function SDL_CreateWindowAndRenderer(atom w,atom h,atom flags,atom win,atom ren)
	return c_func(xSDL_CreateWindowAndRenderer,{w,h,flags,win,ren})
end function

export constant xSDL_CreateRenderer = define_c_func(sdl,"+SDL_CreateRenderer",{C_POINTER,C_INT,C_UINT},C_POINTER)

public function SDL_CreateRenderer(atom win,atom index,atom flags)
	return c_func(xSDL_CreateRenderer,{win,index,flags})
end function

export constant xSDL_CreateSoftwareRenderer = define_c_func(sdl,"+SDL_CreateSoftwareRenderer",{SDL_Surface},C_POINTER)

public function SDL_CreateSoftwareRenderer(sequence surf)
	return c_func(xSDL_CreateSoftwareRenderer,{surf})
end function

export constant xSDL_GetRenderer = define_c_func(sdl,"+SDL_GetRenderer",{C_POINTER},C_POINTER)

public function SDL_GetRenderer(atom win)
	return c_func(xSDL_GetRenderer,{win})
end function

export constant xSDL_RenderGetWindow = define_c_func(sdl,"+SDL_RenderGetWindow",{C_POINTER},C_POINTER)

public function SDL_RenderGetWindow(atom ren)
	return c_func(xSDL_RenderGetWindow,{ren})
end function

export constant xSDL_GetRendererInfo = define_c_func(sdl,"+SDL_GetRendererInfo",{C_POINTER,SDL_RendererInfo},C_INT)

public function SDL_GetRendererInfo(atom ren,sequence info)
	return c_func(xSDL_GetRendererInfo,{ren,info})
end function

export constant xSDL_GetRendererOutputSize = define_c_func(sdl,"+SDL_GetRendererOutputSize",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetRendererOutputSize(atom ren,atom w,atom h)
	return c_func(xSDL_GetRendererOutputSize,{ren,w,h})
end function

export constant xSDL_CreateTexture = define_c_func(sdl,"+SDL_CreateTexture",{C_POINTER,C_UINT,C_INT,C_INT,C_INT},C_POINTER)

public function SDL_CreateTexture(atom ren,atom format,atom acc,atom w,atom h)
	return c_func(xSDL_CreateTexture,{ren,format,acc,w,h})
end function

export constant xSDL_CreateTextureFromSurface = define_c_func(sdl,"+SDL_CreateTextureFromSurface",{C_POINTER,SDL_Surface},C_POINTER)

public function SDL_CreateTextureFromSurface(atom ren,atom surf)
	return c_func(xSDL_CreateTextureFromSurface,{ren,surf})
end function

export constant xSDL_QueryTexture = define_c_func(sdl,"+SDL_QueryTexture",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_QueryTexture(atom tex,atom format,atom acc,atom w,atom h)
	return c_func(xSDL_QueryTexture,{tex,format,acc,w,h})
end function

export constant xSDL_SetTextureColorMod = define_c_func(sdl,"+SDL_SetTextureColorMod",{C_POINTER,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_SetTextureColorMod(atom tex,atom r,atom g,atom b)
	return c_func(xSDL_SetTextureColorMod,{tex,r,g,b})
end function

export constant xSDL_GetTextureColorMod = define_c_func(sdl,"+SDL_GetTextureColorMod",{C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetTextureColorMod(atom tex,atom r,atom g,atom b)
	return c_func(xSDL_GetTextureColorMod,{tex,r,g,b})
end function

export constant xSDL_SetTextureAlphaMod = define_c_func(sdl,"+SDL_SetTextureAlphaMod",{C_POINTER,C_UINT},C_INT)

public function SDL_SetTextureAlphaMod(atom tex,atom al)
	return c_func(xSDL_SetTextureAlphaMod,{tex,al})
end function

export constant xSDL_GetTextureAlphaMod = define_c_func(sdl,"+SDL_GetTextureAlphaMod",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetTextureAlphaMod(atom tex,atom al)
	return c_func(xSDL_GetTextureAlphaMod,{tex,al})
end function

export constant xSDL_SetTextureBlendMode = define_c_func(sdl,"+SDL_SetTextureBlendMode",{C_POINTER,C_INT},C_INT)

public function SDL_SetTextureBlendMode(atom tex,atom mode)
	return c_func(xSDL_SetTextureBlendMode,{tex,mode})
end function

export constant xSDL_GetTextureBlendMode = define_c_func(sdl,"+SDL_GetTextureBlendMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetTextureBlendMode(atom tex,atom mode)
	return c_func(xSDL_GetTextureBlendMode,{tex,mode})
end function

export constant xSDL_SetTextureScaleMode = define_c_func(sdl,"+SDL_SetTextureScaleMode",{C_POINTER,C_INT},C_INT)

public function SDL_SetTextureScaleMode(atom tex,SDL_ScaleMode mode)
	return c_func(xSDL_SetTextureScaleMode,{tex,mode})
end function

export constant xSDL_GetTextureScaleMode = define_c_func(sdl,"+SDL_GetTextureScaleMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetTextureScaleMode(atom tex,SDL_ScaleMode mode)
	return c_func(xSDL_GetTextureScaleMode,{tex,mode})
end function

export constant xSDL_SetTextureUserData = define_c_func(sdl,"+SDL_SetTextureUserData",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetTextureUserData(atom tex,atom ud)
	return c_func(xSDL_SetTextureUserData,{tex,ud})
end function

export constant xSDL_GetTextureUserData = define_c_func(sdl,"+SDL_GetTextureUserData",{C_POINTER},C_POINTER)

public function SDL_GetTextureUserData(atom tex)
	return c_func(xSDL_GetTextureUserData,{tex})
end function

export constant xSDL_UpdateTexture = define_c_func(sdl,"+SDL_UpdateTexture",{C_POINTER,SDL_Rect,C_POINTER,C_INT},C_INT)

public function SDL_UpdateTexture(atom tex,sequence rect,atom pix,atom pit)
	return c_func(xSDL_UpdateTexture,{tex,rect,pix,pit})
end function

export constant xSDL_UpdateYUVTexture = define_c_func(sdl,"+SDL_UpdateYUVTexture",{C_POINTER,SDL_Rect,C_POINTER,C_INT,C_POINTER,C_INT,C_POINTER,C_INT},C_INT)

public function SDL_UpdateYUVTexture(atom tex,sequence rect,atom yplane,atom ypit,atom uplane,atom upit,atom vplane,atom vpit)
	return c_func(xSDL_UpdateYUVTexture,{tex,rect,yplane,ypit,uplane,upit,vplane,vpit})
end function

export constant xSDL_UpdateNVTexture = define_c_func(sdl,"+SDL_UpdateNVTexture",{C_POINTER,SDL_Rect,C_POINTER,C_INT,C_POINTER,C_INT},C_INT)

public function SDL_UpdateNVTexture(atom tex,sequence rect,atom yplane,atom ypit,atom uvplane,atom uvpit)
	return c_func(xSDL_UpdateNVTexture,{tex,rect,yplane,ypit,uvplane,uvpit})
end function

export constant xSDL_LockTexture = define_c_func(sdl,"+SDL_LockTexture",{C_POINTER,SDL_Rect,C_POINTER,C_POINTER},C_INT)

public function SDL_LockTexture(atom tex,sequence rect,atom pix,atom pit)
	return c_func(xSDL_LockTexture,{tex,rect,pix,pit})
end function

export constant xSDL_LockTextureToSurface = define_c_func(sdl,"+SDL_LockTextureToSurface",{C_POINTER,SDL_Rect,SDL_Surface},C_INT)

public function SDL_LockTextureToSurface(atom tex,sequence rect,sequence surf)
	return c_func(xSDL_LockTextureToSurface,{tex,rect,surf})
end function

export constant xSDL_UnlockTexture = define_c_proc(sdl,"+SDL_UnlockTexture",{C_POINTER})

public procedure SDL_UnlockTexture(atom tex)
	c_proc(xSDL_UnlockTexture,{tex})
end procedure

export constant xSDL_RenderTargetSupported = define_c_func(sdl,"+SDL_RenderTargetSupported",{C_POINTER},C_BOOL)

public function SDL_RenderTargetSupported(atom ren)
	return c_func(xSDL_RenderTargetSupported,{ren})
end function

export constant xSDL_SetRenderTarget = define_c_func(sdl,"+SDL_SetRenderTarget",{C_POINTER,C_POINTER},C_INT)

public function SDL_SetRenderTarget(atom ren,atom tex)
	return c_func(xSDL_SetRenderTarget,{ren,tex})
end function

export constant xSDL_GetRenderTarget = define_c_func(sdl,"+SDL_GetRenderTarget",{C_POINTER},C_POINTER)

public function SDL_GetRenderTarget(atom ren)
	return c_func(xSDL_GetRenderTarget,{ren})
end function

export constant xSDL_RenderSetLogicalSize = define_c_func(sdl,"+SDL_RenderSetLogicalSize",{C_POINTER,C_INT,C_INT},C_INT)

public function SDL_RenderSetLogicalSize(atom ren,atom w,atom h)
	return c_func(xSDL_RenderSetLogicalSize,{ren,w,h})
end function

export constant xSDL_RenderGetLogicalSize = define_c_proc(sdl,"+SDL_RenderGetLogicalSize",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_RenderGetLogicalSize(atom ren,atom w,atom h)
	c_proc(xSDL_RenderGetLogicalSize,{ren,w,h})
end procedure

export constant xSDL_RenderSetIntegerScale = define_c_func(sdl,"+SDL_RenderSetIntegerScale",{C_POINTER,C_BOOL},C_INT)

public function SDL_RenderSetIntegerScale(atom ren,atom en)
	return c_func(xSDL_RenderSetIntegerScale,{ren,en})
end function

export constant xSDL_RenderGetIntegerScale = define_c_func(sdl,"+SDL_RenderGetIntegerScale",{C_POINTER},C_BOOL)

public function SDL_RenderGetIntegerScale(atom ren)
	return c_func(xSDL_RenderGetIntegerScale,{ren})
end function

export constant xSDL_RenderSetViewport = define_c_func(sdl,"+SDL_RenderSetViewport",{C_POINTER,SDL_Rect},C_INT)

public function SDL_RenderSetViewport(atom ren,sequence rect)
	return c_func(xSDL_RenderSetViewport,{ren,rect})
end function

export constant xSDL_RenderGetViewport = define_c_proc(sdl,"+SDL_RenderGetViewport",{C_POINTER,SDL_Rect})

public procedure SDL_RenderGetViewport(atom ren,sequence rect)
	c_proc(xSDL_RenderGetViewport,{ren,rect})
end procedure

export constant xSDL_RenderSetClipRect = define_c_func(sdl,"+SDL_RenderSetClipRect",{C_POINTER,SDL_Rect},C_INT)

public function SDL_RenderSetClipRect(atom ren,sequence rect)
	return c_func(xSDL_RenderSetClipRect,{ren,rect})
end function

export constant xSDL_RenderGetClipRect = define_c_proc(sdl,"+SDL_RenderGetClipRect",{C_POINTER,SDL_Rect})

public procedure SDL_RenderGetClipRect(atom ren,sequence rect)
	c_proc(xSDL_RenderGetClipRect,{ren,rect})
end procedure

export constant xSDL_RenderIsClipEnabled = define_c_func(sdl,"+SDL_RenderIsClipEnabled",{C_POINTER},C_BOOL)

public function SDL_RenderIsClipEnabled(atom ren)
	return c_func(xSDL_RenderIsClipEnabled,{ren})
end function

export constant xSDL_RenderSetScale = define_c_func(sdl,"+SDL_RenderSetScale",{C_POINTER,C_FLOAT,C_FLOAT},C_INT)

public function SDL_RenderSetScale(atom ren,atom x,atom y)
	return c_func(xSDL_RenderSetScale,{ren,x,y})
end function

export constant xSDL_RenderGetScale = define_c_proc(sdl,"+SDL_RenderGetScale",{C_POINTER,C_POINTER,C_POINTER})

public procedure SDL_RenderGetScale(atom ren,atom x,atom y)
	c_proc(xSDL_RenderGetScale,{ren,x,y})
end procedure

export constant xSDL_RenderWindowToLogical = define_c_proc(sdl,"+SDL_RenderWindowToLogical",{C_POINTER,C_INT,C_INT,C_POINTER,C_POINTER})

public procedure SDL_RenderWindowToLogical(atom ren,atom x,atom y,atom lx,atom ly)
	c_proc(xSDL_RenderWindowToLogical,{ren,x,y,lx,ly})
end procedure

export constant xSDL_RenderLogicalToWindow = define_c_proc(sdl,"+SDL_RenderLogicalToWindow",{C_POINTER,C_FLOAT,C_FLOAT,C_POINTER,C_POINTER})

public procedure SDL_RenderLogicalToWindow(atom ren,atom x,atom y,atom wx,atom wy)
	c_proc(xSDL_RenderLogicalToWindow,{ren,x,y,wx,wy})
end procedure

export constant xSDL_SetRenderDrawColor = define_c_func(sdl,"+SDL_SetRenderDrawColor",{C_POINTER,C_UINT,C_UINT,C_UINT,C_UINT},C_INT)

public function SDL_SetRenderDrawColor(atom ren,atom r,atom g,atom b,atom a)
	return c_func(xSDL_SetRenderDrawColor,{ren,r,g,b,a})
end function

export constant xSDL_GetRenderDrawColor = define_c_func(sdl,"+SDL_GetRenderDrawColor",{C_POINTER,C_POINTER,C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderDrawColor(atom ren,atom r,atom g,atom b,atom a)
	return c_func(xSDL_GetRenderDrawColor,{ren,r,g,b,a})
end function

export constant xSDL_SetRenderDrawBlendMode = define_c_func(sdl,"+SDL_SetRenderDrawBlendmode",{C_POINTER,C_INT},C_INT)

public function SDL_SetRenderDrawBlendMode(atom ren,atom mode)
	return c_func(xSDL_SetRenderDrawBlendMode,{ren,mode})
end function

export constant xSDL_GetRenderDrawBlendMode = define_c_func(sdl,"+SDL_GetRenderDrawBlendMode",{C_POINTER,C_POINTER},C_INT)

public function SDL_GetRenderDrawBlendMode(atom ren,atom mode)
	return c_func(xSDL_GetRenderDrawBlendMode,{ren,mode})
end function

export constant xSDL_RenderClear = define_c_func(sdl,"+SDL_RenderClear",{C_POINTER},C_INT)

public function SDL_RenderClear(atom ren)
	return c_func(xSDL_RenderClear,{ren})
end function

export constant xSDL_RenderDrawPoint = define_c_func(sdl,"+SDL_RenderDrawPoint",{C_POINTER,C_INT,C_INT},C_INT)

public function SDL_RenderDrawPoint(atom ren,atom x,atom y)
	return c_func(xSDL_RenderDrawPoint,{ren,x,y})
end function

export constant xSDL_RenderDrawPoints = define_c_func(sdl,"+SDL_RenderDrawPoints",{C_POINTER,SDL_Point,C_INT},C_INT)

public function SDL_RenderDrawPoints(atom ren,sequence pts,atom cnt)
	return c_func(xSDL_RenderDrawPoints,{ren,pts,cnt})
end function

export constant xSDL_RenderDrawLine = define_c_func(sdl,"+SDL_RenderDrawLine",{C_POINTER,C_INT,C_INT,C_INT,C_INT},C_INT)

public function SDL_RenderDrawLine(atom ren,atom x,atom y,atom x2,atom y2)
	return c_func(xSDL_RenderDrawLine,{ren,x,y,x2,y2})
end function

export constant xSDL_RenderDrawLines = define_c_func(sdl,"+SDL_RenderDrawLines",{C_POINTER,SDL_Point,C_INT},C_INT)

public function SDL_RenderDrawLines(atom ren,sequence pts,atom cnt)
	return c_func(xSDL_RenderDrawLines,{ren,pts,cnt})
end function

export constant xSDL_RenderDrawRect = define_c_func(sdl,"+SDL_RenderDrawRect",{C_POINTER,SDL_Rect},C_INT)

public function SDL_RenderDrawRect(atom ren,sequence rect)
	return c_func(xSDL_RenderDrawRect,{ren,rect})
end function

export constant xSDL_RenderDrawRects = define_c_func(sdl,"+SDL_RenderDrawRects",{C_POINTER,SDL_Rect,C_INT},C_INT)

public function SDL_RenderDrawRects(atom ren,sequence rect,atom cnt)
	return c_func(xSDL_RenderDrawRects,{ren,rect,cnt})
end function

export constant xSDL_RenderFillRect = define_c_func(sdl,"+SDL_RenderFillRect",{C_POINTER,SDL_Rect},C_INT)

public function SDL_RenderFillRect(atom ren,sequence rect)
	return c_func(xSDL_RenderFillRect,{ren,rect})
end function

export constant xSDL_RenderFillRects = define_c_func(sdl,"+SDL_RenderFillRects",{C_POINTER,SDL_Rect,C_INT},C_INT)

public function SDL_RenderFillRects(atom ren,sequence rect,atom cnt)
	return c_func(xSDL_RenderFillRects,{ren,rect,cnt})
end function

export constant xSDL_RenderCopy = define_c_func(sdl,"+SDL_RenderCopy",{C_POINTER,C_POINTER,SDL_Rect,SDL_Rect},C_INT)

public function SDL_RenderCopy(atom ren,atom tex,sequence src,sequence dst)
	return c_func(xSDL_RenderCopy,{ren,tex,src,dst})
end function

export constant xSDL_RenderCopyEx = define_c_func(sdl,"+SDL_RenderCopyEx",{C_POINTER,C_POINTER,SDL_Rect,SDL_Rect,C_DOUBLE,SDL_Point,C_INT},C_INT)

public function SDL_RenderCopyEx(atom ren,atom tex,sequence src,sequence dst,atom ang,sequence center,SDL_RendererFlip flip)
	return c_func(xSDL_RenderCopyEx,{ren,tex,src,dst,ang,center,flip})
end function

export constant xSDL_RenderDrawPointF = define_c_func(sdl,"+SDL_RenderDrawPointF",{C_POINTER,C_FLOAT,C_FLOAT},C_INT)

public function SDL_RenderDrawPointF(atom ren,atom x,atom y)
	return c_func(xSDL_RenderDrawPointF,{ren,x,y})
end function

export constant xSDL_RenderDrawPointsF = define_c_func(sdl,"+SDL_RenderDrawPointsF",{C_POINTER,SDL_FPoint,C_INT},C_INT)

public function SDL_RenderDrawPointsF(atom ren,sequence pts,atom cnt)
	return c_func(xSDL_RenderDrawPointsF,{ren,pts,cnt})
end function

export constant xSDL_RenderDrawLineF = define_c_func(sdl,"+SDL_RenderDrawLineF",{C_POINTER,C_FLOAT,C_FLOAT,C_FLOAT,C_FLOAT},C_INT)

public function SDL_RenderDrawLineF(atom ren,atom x,atom y,atom x2,atom y2)
	return c_func(xSDL_RenderDrawLineF,{ren,x,y,x2,y2})
end function

export constant xSDL_RenderDrawLinesF = define_c_func(sdl,"+SDL_RenderDrawLinesF",{C_POINTER,SDL_FPoint,C_INT},C_INT)

public function SDL_RenderDrawLinesF(atom ren,sequence pts,atom cnt)
	return c_func(xSDL_RenderDrawLinesF,{ren,pts,cnt})
end function

export constant xSDL_RenderDrawRectF = define_c_func(sdl,"+SDL_RenderDrawRectF",{C_POINTER,SDL_FRect},C_INT)

public function SDL_RenderDrawRectF(atom ren,sequence rect)
	return c_func(xSDL_RenderDrawRectF,{ren,rect})
end function

export constant xSDL_RenderDrawRectsF = define_c_func(sdl,"+SDL_RenderDrawRectsF",{C_POINTER,SDL_FRect,C_INT},C_INT)

public function SDL_RenderDrawRectsF(atom ren,sequence rect,atom cnt)
	return c_func(xSDL_RenderDrawRectsF,{ren,rect,cnt})
end function

export constant xSDL_RenderFillRectF = define_c_func(sdl,"+SDL_RenderFillRectF",{C_POINTER,SDL_FRect},C_INT)

public function SDL_RenderFillRectF(atom ren,sequence rect)
	return c_func(xSDL_RenderFillRectF,{ren,rect})
end function

export constant xSDL_RenderFillRectsF = define_c_func(sdl,"+SDL_RenderFillRectsF",{C_POINTER,SDL_FRect,C_INT},C_INT)

public function SDL_RenderFillRectsF(atom ren,sequence rect,atom cnt)
	return c_func(xSDL_RenderFillRectsF,{ren,rect,cnt})
end function

export constant xSDL_RenderCopyF = define_c_func(sdl,"+SDL_RenderCopyF",{C_POINTER,C_POINTER,SDL_Rect,SDL_FRect},C_INT)

public function SDL_RenderCopyF(atom ren,atom tex,sequence src,sequence dst)
	return c_func(xSDL_RenderCopyF,{ren,tex,src,dst})
end function

export constant xSDL_RenderCopyExF = define_c_func(sdl,"+SDL_RenderCopyExF",{C_POINTER,C_POINTER,SDL_Rect,SDL_FRect,C_DOUBLE,SDL_FPoint,C_INT},C_INT)

public function SDL_RenderCopyExF(atom ren,atom tex,sequence src,sequence dst,atom ang,sequence center,SDL_RendererFlip flip)
	return c_func(xSDL_RenderCopyExF,{ren,tex,src,dst,ang,center,flip})
end function

export constant xSDL_RenderGeometry = define_c_func(sdl,"+SDL_RenderGeometry",{C_POINTER,C_POINTER,SDL_Vertex,C_INT,C_POINTER,C_INT},C_INT)

public function SDL_RenderGeometry(atom ren,atom tex,sequence verts,atom num,atom indice,atom num_id)
	return c_func(xSDL_RenderGeometry,{ren,tex,verts,num,indice,num_id})
end function

export constant xSDL_RenderGeometryRaw = define_c_func(sdl,"+SDL_RenderGeometryRaw",{C_POINTER,C_POINTER,C_POINTER,C_INT,SDL_Color,C_INT,C_POINTER,C_INT,C_INT,C_POINTER,C_INT,C_INT},C_INT)

public function SDL_RenderGeometryRaw(atom ren,atom tex,atom xy,atom xy_stride,sequence col,atom color_stride,atom uv,atom uv_stride,atom num_vertices,atom indices,atom num_indices,atom size)
	return c_func(xSDL_RenderGeometryRaw,{ren,tex,xy,xy_stride,col,color_stride,uv,uv_stride,num_vertices,indices,num_indices,size})
end function

export constant xSDL_RenderReadPixels = define_c_func(sdl,"+SDL_RenderReadPixels",{C_POINTER,SDL_Rect,C_UINT,C_POINTER,C_INT},C_INT)

public function SDL_RenderReadPixels(atom ren,sequence rect,atom format,atom pix,atom pit)
	return c_func(xSDL_RenderReadPixels,{ren,rect,format,pix,pit})
end function

export constant xSDL_RenderPresent = define_c_proc(sdl,"+SDL_RenderPresent",{C_POINTER})

public procedure SDL_RenderPresent(atom ren)
	c_proc(xSDL_RenderPresent,{ren})
end procedure

export constant xSDL_DestroyTexture = define_c_proc(sdl,"+SDL_DestroyTexture",{C_POINTER})

public procedure SDL_DestroyTexture(atom tex)
	c_proc(xSDL_DestroyTexture,{tex})
end procedure

export constant xSDL_DestroyRenderer = define_c_proc(sdl,"+SDL_DestroyRenderer",{C_POINTER})

public procedure SDL_DestroyRenderer(atom ren)
	c_proc(xSDL_DestroyRenderer,{ren})
end procedure

export constant xSDL_RenderFlush = define_c_func(sdl,"+SDL_RenderFlush",{C_POINTER},C_INT)

public function SDL_RenderFlush(atom ren)
	return c_func(xSDL_RenderFlush,{ren})
end function

export constant xSDL_GL_BindTexture = define_c_func(sdl,"+SDL_GL_BindTexture",{C_POINTER,C_POINTER,C_POINTER},C_INT)

public function SDL_GL_BindTexture(atom tex,atom w,atom h)
	return c_func(xSDL_GL_BindTexture,{tex,w,h})
end function

export constant xSDL_GL_UnbindTexture = define_c_func(sdl,"+SDL_GL_UnbindTexture",{C_POINTER},C_INT)

public function SDL_GL_UnbindTexture(atom tex)
	return c_func(xSDL_GL_UnbindTexture,{tex})
end function

export constant xSDL_RenderGetMetalLayer = define_c_func(sdl,"+SDL_RenderGetMetalLayer",{C_POINTER},C_POINTER)

public function SDL_RenderGetMetalLayer(atom ren)
	return c_func(xSDL_RenderGetMetalLayer,{ren})
end function

export constant xSDL_RenderGetMetalCommandEncoder = define_c_func(sdl,"+SDL_RenderGetMetalCommandEncoder",{C_POINTER},C_POINTER)

public function SDL_RenderGetMetalCommandEncoder(atom ren)
	return c_func(xSDL_RenderGetMetalCommandEncoder,{ren})
end function

export constant xSDL_RenderSetVSync = define_c_func(sdl,"+SDL_RenderSetVSync",{C_POINTER,C_INT},C_INT)

public function SDL_RenderSetVSync(atom ren,atom v)
	return c_func(xSDL_RenderSetVSync,{ren,v})
end function
­116.58