include std/ffi.e
include SDL_gfx.e

public constant M_PI = 3.1415926535897932384626433832795

public constant SDL2_GFXPRIMITIVES_MAJOR = 1,
				SDL2_GFXPRIMITIVES_MINOR = 0,
				SDL2_GFXPRIMITIVES_MICRO = 4
				
export constant xpixelColor = define_c_func(gfx,"+pixelColor",{C_POINTER,C_INT,C_INT,C_UINT32},C_INT),
				xpixelRGBA = define_c_func(gfx,"+pixelRGBA",{C_POINTER,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function pixelColor(atom ren,atom x,atom y,atom col)
	return c_func(xpixelColor,{ren,x,y,col})
end function

public function pixelRGBA(atom ren,atom x,atom y,atom r,atom g,atom b,atom a)
	return c_func(xpixelRGBA,{ren,x,y,r,g,b,a})
end function

export constant xhlineColor = define_c_func(gfx,"+hlineColor",{C_POINTER,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xhlineRGBA = define_c_func(gfx,"+hlineRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function hlineColor(atom ren,atom x,atom x2,atom y,atom col)
	return c_func(xhlineColor,{ren,x,x2,y,col})
end function

public function hlineRGBA(atom ren,atom x,atom x2,atom y,atom r,atom g,atom b,atom a)
	return c_func(xhlineRGBA,{ren,x,x2,y,r,g,b,a})
end function

export constant vhlineColor = define_c_func(gfx,"+vlineColor",{C_POINTER,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				vhlineRGBA = define_c_func(gfx,"+vlineRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function vlineColor(atom ren,atom x,atom x2,atom y,atom col)
	return c_func(vhlineColor,{ren,x,x2,y,col})
end function

public function vlineRGBA(atom ren,atom x,atom x2,atom y,atom r,atom g,atom b,atom a)
	return c_func(vhlineRGBA,{ren,x,x2,y,r,g,b,a})
end function

export constant xrectangleColor = define_c_func(gfx,"+rectangleColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xrectangleRGBA = define_c_func(gfx,"+rectangleRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function rectangleColor(atom ren,atom x,atom y,atom x2,atom y2,atom col)
	return c_func(xrectangleColor,{ren,x,y,x2,y2,col})
end function

public function rectangleRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom r,atom g,atom b,atom a)
	return c_func(xrectangleRGBA,{ren,x,y,x2,y2,r,g,b,a})
end function

export constant xroundedRectangleColor = define_c_func(gfx,"+roundedRectangleColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xroundedRectangleRGBA = define_c_func(gfx,"+roundedRectangleRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function roundedRectangleColor(atom ren,atom x,atom y,atom x2,atom y2,atom col)
	return c_func(xroundedRectangleColor,{ren,x,y,x2,y2,col})
end function

public function roundedRectangleRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom r,atom g,atom b,atom a)
	return c_func(xroundedRectangleRGBA,{ren,x,y,x2,y2,r,g,b,a})
end function

export constant xboxColor = define_c_func(gfx,"+boxColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xboxRGBA = define_c_func(gfx,"+boxRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function boxColor(atom ren,atom x,atom y,atom x2,atom y2,atom col)
	return c_func(xboxColor,{ren,x,y,x2,y2,col})
end function

public function boxRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom r,atom g,atom b,atom a)
	return c_func(xboxRGBA,{ren,x,y,x2,y2,r,g,b,a})
end function

export constant xroundedBoxColor = define_c_func(gfx,"+roundedBoxColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xroundedBoxRGBA = define_c_func(gfx,"+roundedBoxRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function roundedBoxColor(atom ren,atom x,atom y,atom x2,atom y2,atom rad,atom col)
	return c_func(xroundedBoxColor,{ren,x,y,x2,y2,rad,col})
end function

public function roundedBoxRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom rad,atom r,atom g,atom b,atom a)
	return c_func(xroundedBoxRGBA,{ren,x,y,x2,y2,rad,r,g,b,a})
end function

export constant xlineColor = define_c_func(gfx,"+lineColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xlineRGBA = define_c_func(gfx,"+lineRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function lineColor(atom ren,atom x,atom y,atom x2,atom y2,atom col)
	return c_func(xlineColor,{ren,x,y,x2,y2,col})
end function

public function lineRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom r,atom g,atom b,atom a)
	return c_func(xlineRGBA,{ren,x,y,x2,y2,r,g,b,a})
end function

export constant xaalineColor = define_c_func(gfx,"+aalineColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xaalineRGBA = define_c_func(gfx,"+aalineRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function aalineColor(atom ren,atom x,atom y,atom x2,atom y2,atom col)
	return c_func(xaalineColor,{ren,x,y,x2,y2,col})
end function

public function aalineRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom r,atom g,atom b,atom a)
	return c_func(xaalineRGBA,{ren,x,y,x2,y2,r,g,b,a})
end function

export constant xthickLineColor = define_c_func(gfx,"+thickLineColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT32},C_INT),
				xthickLineRGBA = define_c_func(gfx,"+thickLineRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function thickLineColor(atom ren,atom x,atom y,atom x2,atom y2,atom w,atom col)
	return c_func(xthickLineColor,{ren,x,y,x2,y2,w,col})
end function

public function thickLineRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom w,atom r,atom g,atom b,atom a)
	return c_func(xthickLineRGBA,{ren,x,y,x2,y2,w,r,g,b,a})
end function

export constant xcircleColor = define_c_func(gfx,"+circleColor",{C_POINTER,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xcircleRGBA = define_c_func(gfx,"+circleRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function circleColor(atom ren,atom x,atom y,atom rad,atom col)
	return c_func(xcircleColor,{ren,x,y,rad,col})
end function

public function circleRGBA(atom ren,atom x,atom y,atom rad,atom r,atom g,atom b,atom a)
	return c_func(xcircleRGBA,{ren,x,y,rad,r,g,b,a})
end function

export constant xarcColor = define_c_func(gfx,"+arcColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xarcRGBA = define_c_func(gfx,"+arcRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function arcColor(atom ren,atom x,atom y,atom rad,atom st,atom e,atom col)
	return c_func(xarcColor,{ren,x,y,rad,st,e,col})
end function

public function arcRGBA(atom ren,atom x,atom y,atom rad,atom st,atom e,atom r,atom g,atom b,atom a)
	return c_func(xarcRGBA,{ren,x,y,rad,st,e,r,g,b,a})
end function

export constant xaacircleColor = define_c_func(gfx,"+aacircleColor",{C_POINTER,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xaacircleRGBA = define_c_func(gfx,"+aacircleRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function aacircleColor(atom ren,atom x,atom y,atom rad,atom col)
	return c_func(xaacircleColor,{ren,x,y,rad,col})
end function

public function aacircleRGBA(atom ren,atom x,atom y,atom rad,atom r,atom g,atom b,atom a)
	return c_func(xaacircleRGBA,{ren,x,y,rad,r,g,b,a})
end function

export constant xfilledCircleColor = define_c_func(gfx,"+filledCircleColor",{C_POINTER,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xfilledCircleRGBA = define_c_func(gfx,"+filledCircleRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function filledCircleColor(atom ren,atom x,atom y,atom r,atom col)
	return c_func(xfilledCircleColor,{ren,x,y,r,col})
end function

public function filledCircleRGBA(atom ren,atom x,atom y,atom rad,atom r,atom g,atom b,atom a)
	return c_func(xfilledCircleRGBA,{ren,x,y,rad,r,g,b,a})
end function

export constant xellipseColor = define_c_func(gfx,"+ellipseColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xellipseRGBA = define_c_func(gfx,"+ellipseRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function ellipseColor(atom ren,atom x,atom y,atom rx,atom ry,atom col)
	return c_func(xellipseColor,{ren,x,y,rx,ry,col})
end function

public function ellipseRGBA(atom ren,atom x,atom y,atom rx,atom ry,atom r,atom g,atom b,atom a)
	return c_func(xellipseRGBA,{ren,x,y,rx,ry,r,g,b,a})
end function

export constant xaaellipseColor = define_c_func(gfx,"+aaellipseColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xaaellipseRGBA = define_c_func(gfx,"+aaellipseRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function aaellipseColor(atom ren,atom x,atom y,atom rx,atom ry,atom col)
	return c_func(xaaellipseColor,{ren,x,y,rx,ry,col})
end function

public function aaellipseRGBA(atom ren,atom x,atom y,atom rx,atom ry,atom r,atom g,atom b,atom a)
	return c_func(xaaellipseRGBA,{ren,x,y,rx,ry,r,g,b,a})
end function

export constant xfilledEllipseColor = define_c_func(gfx,"+filledEllipseColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xfilledEllipseRGBA = define_c_func(gfx,"+filledEllipseRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function filledEllipseColor(atom ren,atom x,atom y,atom rx,atom ry,atom col)
	return c_func(xfilledEllipseColor,{ren,x,y,rx,ry,col})
end function

public function filledEllipseRGBA(atom ren,atom x,atom y,atom rx,atom ry,atom r,atom g,atom b,atom a)
	return c_func(xfilledEllipseRGBA,{ren,x,y,rx,ry,r,g,b,a})
end function

export constant xpieColor = define_c_func(gfx,"+pieColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xpieRGBA = define_c_func(gfx,"+pieRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function pieColor(atom ren,atom x,atom y,atom rad,atom st,atom e,atom col)
	return c_func(xpieColor,{ren,x,y,rad,st,e,col})
end function

public function pieRGBA(atom ren,atom x,atom y,atom rad,atom st,atom e,atom r,atom g,atom b,atom a)
	return c_func(xpieRGBA,{ren,x,y,rad,st,e,r,g,b,a})
end function

export constant xfilledPieColor = define_c_func(gfx,"+filledPieColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xfilledPieRGBA = define_c_func(gfx,"+filledPieRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function filledPieColor(atom ren,atom x,atom y,atom rad,atom st,atom e,atom col)
	return c_func(xfilledPieColor,{ren,x,y,rad,st,e,col})
end function

public function filledPieRGBA(atom ren,atom x,atom y,atom rad,atom st,atom e,atom r,atom g,atom b,atom a)
	return c_func(xfilledPieRGBA,{ren,x,y,rad,st,e,r,g,b,a})
end function

export constant xtrigonColor = define_c_func(gfx,"+trigonColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xtrigonRGBA = define_c_func(gfx,"+trigonRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function trigonColor(atom ren,atom x,atom y,atom x2,atom y2,atom x3,atom y3,atom col)
	return c_func(xtrigonColor,{ren,x,y,x2,y2,x3,y3,col})
end function

public function trigonRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom x3,atom y3,atom r,atom g,atom b,atom a)
	return c_func(xtrigonRGBA,{ren,x,y,x2,y2,x3,y3,r,g,b,a})
end function

export constant xaatrigonColor = define_c_func(gfx,"+aatrigonColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xaatrigonRGBA = define_c_func(gfx,"+aatrigonRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function aatrigonColor(atom ren,atom x,atom y,atom x2,atom y2,atom x3,atom y3,atom col)
	return c_func(xaatrigonColor,{ren,x,y,x2,y2,x3,y3,col})
end function

public function aatrigonRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom x3,atom y3,atom r,atom g,atom b,atom a)
	return c_func(xaatrigonRGBA,{ren,x,y,x2,y2,x3,y3,r,g,b,a})
end function

export constant xfilledTrigonColor = define_c_func(gfx,"+filledTrigonColor",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT32},C_INT),
				xfilledTrigonRGBA = define_c_func(gfx,"+filledTrigonRGBA",{C_POINTER,C_INT,C_INT,C_INT,C_INT,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function filledTrigonColor(atom ren,atom x,atom y,atom x2,atom y2,atom x3,atom y3,atom col)
	return c_func(xfilledTrigonColor,{ren,x,y,x2,y2,x3,y3,col})
end function

public function filledTrigonRGBA(atom ren,atom x,atom y,atom x2,atom y2,atom x3,atom y3,atom r,atom g,atom b,atom a)
	return c_func(xfilledTrigonRGBA,{ren,x,y,x2,y2,x3,y3,r,g,b,a})
end function

export constant xpolygonColor = define_c_func(gfx,"+polygonColor",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_UINT32},C_INT),
				xpolygonRGBA = define_c_func(gfx,"+polygonRGBA",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function polygonColor(atom ren,atom x,atom y,atom n,atom col)
	return c_func(xpolygonColor,{ren,x,y,n,col})
end function

public function polygonRGBA(atom ren,atom x,atom y,atom n,atom r,atom g,atom b,atom a)
	return c_func(xpolygonRGBA,{ren,x,y,n,r,g,b,a})
end function

export constant xaapolygonColor = define_c_func(gfx,"+aapolygonColor",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_UINT32},C_INT),
				xaapolygonRGBA = define_c_func(gfx,"+aapolygonRGBA",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function aapolygonColor(atom ren,atom x,atom y,atom n,atom col)
	return c_func(xaapolygonColor,{ren,x,y,n,col})
end function

public function aapolygonRGBA(atom ren,atom x,atom y,atom n,atom r,atom g,atom b,atom a)
	return c_func(xaapolygonRGBA,{ren,x,y,n,r,g,b,a})
end function

export constant xfilledPolygonColor = define_c_func(gfx,"+filledPolygonColor",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_UINT32},C_INT),
				xfilledPolygonRGBA = define_c_func(gfx,"+filledPolygonRGBA",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function filledPolygonColor(atom ren,atom x,atom y,atom n,atom col)
	return c_func(xfilledPolygonColor,{ren,x,y,n,col})
end function

public function filledPolygonRGBA(atom ren,atom x,atom y,atom n,atom r,atom g,atom b,atom a)
	return c_func(xfilledPolygonRGBA,{ren,x,y,n,r,g,b,a})
end function

export constant xtexturedPolygon = define_c_func(gfx,"+texturedPolygon",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_POINTER,C_INT,C_INT},C_INT)

public function texturedPolygon(atom ren,atom x,atom y,atom n,atom tex,atom dx,atom dy)
	return c_func(xtexturedPolygon,{ren,x,y,n,tex,dx,dy})
end function

export constant xbezierColor = define_c_func(gfx,"+bezierColor",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_INT,C_UINT32},C_INT),
				xbezierRGBA = define_c_func(gfx,"+bezierRGBA",{C_POINTER,C_POINTER,C_POINTER,C_INT,C_INT,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public function bezierColor(atom ren,atom x,atom y,atom n,atom s,atom col)
	return c_func(xbezierColor,{ren,x,y,n,s,col})
end function

public function bezierRGBA(atom ren,atom x,atom y,atom n,atom s,atom r,atom g,atom b,atom a)
	return c_func(xbezierRGBA,{ren,x,y,n,s,r,g,b,a})
end function

export constant xgfxPrimitivesSetFont = define_c_proc(gfx,"+gfxPrimitivesSetFont",{C_POINTER,C_UINT32,C_UINT32}),
				xgfxPrimitivesSetFontRotation = define_c_proc(gfx,"+gfxPrimitivesSetFontRotation",{C_UINT32}),
				xcharacterColor = define_c_func(gfx,"+characterColor",{C_POINTER,C_INT,C_INT,C_CHAR,C_UINT32},C_INT),
				xcharacterRGBA = define_c_func(gfx,"+characterRGBA",{C_POINTER,C_INT,C_INT,C_CHAR,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT),
				xstringColor = define_c_func(gfx,"+stringColor",{C_POINTER,C_INT,C_INT,C_STRING,C_UINT32},C_INT),
				xstringRGBA = define_c_func(gfx,"+stringRGBA",{C_POINTER,C_INT,C_INT,C_STRING,C_UINT8,C_UINT8,C_UINT8,C_UINT8},C_INT)
				
public procedure gfxPrimitivesSetFont(atom fd,atom w,atom h)
	c_proc(xgfxPrimitivesSetFont,{fd,w,h})
end procedure

public procedure gfxPrimitivesSetFontRotation(atom rot)
	c_proc(xgfxPrimitivesSetFontRotation,{rot})
end procedure

public function characterColor(atom ren,atom x,atom y,atom c,atom col)
	return c_func(xcharacterColor,{ren,x,y,c,col})
end function

public function characterRGBA(atom ren,atom x,atom y,atom c,atom r,atom g,atom b,atom a)
	return c_func(xcharacterRGBA,{ren,x,y,c,r,g,b,a})
end function

public function stringColor(atom ren,atom x,atom y,sequence s,atom col)
	return c_func(xstringColor,{ren,x,y,s,col})
end function

public function stringRGBA(atom ren,atom x,atom y,sequence s,atom r,atom g,atom b,atom a)
	return c_func(xstringRGBA,{ren,x,y,s,r,g,b,a})
end function
­299.16