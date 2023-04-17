include std/ffi.e
include SDL_gfx.e

public constant M_PI = 3.1415926535897932384626433832795

public constant SMOOTHING_OFF = 0
public constant SMOOTHING_ON = 1

export constant xrotozoomSurface = define_c_func(gfx,"+rotozoomSurface",{C_POINTER,C_DOUBLE,C_DOUBLE,C_INT},C_POINTER)

public function rotozoomSurface(atom src,atom ang,atom zo,atom sm)
	return c_func(xrotozoomSurface,{src,ang,zo,sm})
end function

export constant xrotozoomSurfaceXY = define_c_func(gfx,"+rotozoomSurfaceXY",{C_POINTER,C_DOUBLE,C_DOUBLE,C_DOUBLE,C_INT},C_POINTER)

public function rotozoomSurfaceXY(atom src,atom ang,atom zx,atom zy,atom sm)
	return c_func(xrotozoomSurfaceXY,{src,ang,zx,zy,sm})
end function

export constant xrotozoomSurfaceSize = define_c_proc(gfx,"+rotozoomSurfaceSize",{C_INT,C_INT,C_DOUBLE,C_DOUBLE,C_POINTER,C_POINTER})

public procedure rotozoomSurfaceSize(atom w,atom h,atom ang,atom z,atom dw,atom dh)
	c_proc(xrotozoomSurfaceSize,{w,h,ang,z,dw,dh})
end procedure

export constant xrotozoomSurfaceSizeXY = define_c_proc(gfx,"+rotozoomSurfaceSizeXY",{C_INT,C_INT,C_DOUBLE,C_DOUBLE,C_DOUBLE,C_POINTER,C_POINTER})

public procedure rotozoomSurfaceSizeXY(atom w,atom h,atom ang,atom zx,atom zy,atom dw,atom dh)
	c_proc(xrotozoomSurfaceSizeXY,{w,h,ang,zx,zy,dw,dh})
end procedure

export constant xzoomSurface = define_c_func(gfx,"+zoomSurface",{C_POINTER,C_DOUBLE,C_DOUBLE,C_INT},C_POINTER)

public function zoomSurface(atom src,atom zx,atom zy,atom sm)
	return c_func(xzoomSurface,{src,zx,zy,sm})
end function

export constant xzoomSurfaceSize = define_c_proc(gfx,"+zoomSurfaceSize",{C_INT,C_INT,C_DOUBLE,C_DOUBLE,C_POINTER,C_POINTER})

public procedure zoomSurfaceSize(atom w,atom h,atom zx,atom zy,atom dw,atom dh)
	c_proc(xzoomSurfaceSize,{w,h,zx,zy,dw,dh})
end procedure

export constant xshrinkSurface = define_c_func(gfx,"+shrinkSurface",{C_POINTER,C_INT,C_INT},C_POINTER)

public function shrinkSurface(atom src,atom x,atom y)
	return c_func(xshrinkSurface,{src,x,y})
end function

export constant xrotateSurface90Degrees = define_c_func(gfx,"+rotateSurface90Degrees",{C_POINTER,C_INT},C_POINTER)

public function rotateSurface90Degrees(atom src,atom num)
	return c_func(xrotateSurface90Degrees,{src,num})
end function
­54.49