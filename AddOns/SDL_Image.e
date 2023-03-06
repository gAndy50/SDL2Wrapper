--SDL Image 2 Wrapper
--Written By Andy P. (Icy_Viking)
--Uses's Greg's FFI library

without warning

include std/ffi.e
include std/machine.e
include std/os.e

include SDL_rwops.e
include SDL_surface.e
include SDL_version.e

atom img = 0

ifdef WINDOWS then
	img = open_dll("SDL2_image.dll")
	elsifdef LINUX or FREEBSD then
	img = open_dll("SDL2_image.so")
end ifdef

public constant SDL_IMAGE_MAJOR_VERSION = 2,
				SDL_IMAGE_MINOR_VERSION = 6,
				SDL_IMAGE_PATCHLEVEL = 2
				
export constant xIMG_Linked_Version = define_c_func(img,"+IMG_Linked_Version",{},C_POINTER)

public function IMG_Linked_Version()
	return c_func(xIMG_Linked_Version,{})
end function

public enum type IMG_InitFlags
	IMG_INIT_JPG = 0x00000001,
	IMG_INIT_PNG = 0x00000002,
	IMG_INIT_TIF = 0x00000004,
	IMG_INIT_WEBP = 0x00000008,
	IMG_INIT_JXL = 0x00000010,
	IMG_INIT_AVIF = 0x00000020
end type

export constant xIMG_Init = define_c_func(img,"+IMG_Init",{C_INT},C_INT)

public function IMG_Init(atom flags)
	return c_func(xIMG_Init,{flags})
end function

export constant xIMG_Quit = define_c_proc(img,"+IMG_Quit",{})

public procedure IMG_Quit()
	c_proc(xIMG_Quit,{})
end procedure

export constant xIMG_LoadTyped_RW = define_c_func(img,"+IMG_LoadTyped_RW",{C_POINTER,C_INT,C_STRING},C_POINTER)

public function IMG_LoadTyped_RW(atom src,atom freesrc,sequence xtype)
	return c_func(xIMG_LoadTyped_RW,{src,freesrc,xtype})
end function

export constant xIMG_Load = define_c_func(img,"+IMG_Load",{C_STRING},C_POINTER)

public function IMG_Load(sequence file)
	return c_func(xIMG_Load,{file})
end function

export constant xIMG_Load_RW = define_c_func(img,"+IMG_Load_RW",{C_POINTER,C_INT},C_POINTER)

public function IMG_Load_RW(atom src,atom freesrc)
	return c_func(xIMG_Load_RW,{src,freesrc})
end function

export constant xIMG_LoadTexture = define_c_func(img,"+IMG_LoadTexture",{C_POINTER,C_STRING},C_POINTER)

public function IMG_LoadTexture(atom ren,sequence file)
	return c_func(xIMG_LoadTexture,{ren,file})
end function

export constant xIMG_LoadTexture_RW = define_c_func(img,"+IMG_LoadTexture_RW",{C_POINTER,C_POINTER,C_INT},C_POINTER)

public function IMG_LoadTexture_RW(atom ren,atom src,atom freesrc)
	return c_func(xIMG_LoadTexture_RW,{ren,src,freesrc})
end function

export constant xIMG_LoadTextureTyped_RW = define_c_func(img,"+IMG_LoadTextureTyped_RW",{C_POINTER,C_POINTER,C_INT,C_STRING},C_POINTER)

public function IMG_LoadTextureTyped_RW(atom ren,atom src,atom freesrc,sequence xtype)
	return c_func(xIMG_LoadTextureTyped_RW,{ren,src,freesrc,xtype})
end function

export constant xIMG_isAVIF = define_c_func(img,"+IMG_isAVIF",{C_POINTER},C_INT)

public function IMG_isAVIF(atom src)
	return c_func(xIMG_isAVIF,{src})
end function

export constant xIMG_isICO = define_c_func(img,"+IMG_isICO",{C_POINTER},C_INT)

public function IMG_isICO(atom src)
	return c_func(xIMG_isICO,{src})
end function

export constant xIMG_isCUR = define_c_func(img,"+IMG_isCUR",{C_POINTER},C_INT)

public function IMG_isCUR(atom src)
	return c_func(xIMG_isCUR,{src})
end function

export constant xIMG_isBMP = define_c_func(img,"+IMG_isBMP",{C_POINTER},C_INT)

public function IMG_isBMP(atom src)
	return c_func(xIMG_isBMP,{src})
end function

export constant xIMG_isGIF = define_c_func(img,"+IMG_isGIF",{C_POINTER},C_INT)

public function IMG_isGIF(atom src)
	return c_func(xIMG_isGIF,{src})
end function

export constant xIMG_isJPG = define_c_func(img,"+IMG_isJPG",{C_POINTER},C_INT)

public function IMG_isJPG(atom src)
	return c_func(xIMG_isJPG,{src})
end function

export constant xIMG_isJXL = define_c_func(img,"+IMG_isJXL",{C_POINTER},C_INT)

public function IMG_isJXL(atom src)
	return c_func(xIMG_isJXL,{src})
end function

export constant xIMG_isLBM = define_c_func(img,"+IMG_isLBM",{C_POINTER},C_INT)

public function IMG_isLBM(atom src)
	return c_func(xIMG_isLBM,{src})
end function

export constant xIMG_isPCX = define_c_func(img,"+IMG_isPCX",{C_POINTER},C_INT)

public function IMG_isPCX(atom src)
	return c_func(xIMG_isPCX,{src})
end function

export constant xIMG_isPNG = define_c_func(img,"+IMG_isPNG",{C_POINTER},C_INT)

public function IMG_isPNG(atom src)
	return c_func(xIMG_isPNG,{src})
end function

export constant xIMG_isPNM = define_c_func(img,"+IMG_isPNM",{C_POINTER},C_INT)

public function IMG_isPNM(atom src)
	return c_func(xIMG_isPNM,{src})
end function

export constant xIMG_isSVG = define_c_func(img,"+IMG_isSVG",{C_POINTER},C_INT)

public function IMG_isSVG(atom src)
	return c_func(xIMG_isSVG,{src})
end function

export constant xIMG_isQOI = define_c_func(img,"+IMG_isQOI",{C_POINTER},C_INT)

public function IMG_isQOI(atom src)
	return c_func(xIMG_isQOI,{src})
end function

export constant xIMG_isTIF = define_c_func(img,"+IMG_isTIF",{C_POINTER},C_INT)

public function IMG_isTIF(atom src)
	return c_func(xIMG_isTIF,{src})
end function

export constant xIMG_isXCF = define_c_func(img,"+IMG_isXCF",{C_POINTER},C_INT)

public function IMG_isXCF(atom src)
	return c_func(xIMG_isXCF,{src})
end function

export constant xIMG_isXPM = define_c_func(img,"+IMG_isXPM",{C_POINTER},C_INT)

public function IMG_isXPM(atom src)
	return c_func(xIMG_isXPM,{src})
end function

export constant xIMG_isXV = define_c_func(img,"+IMG_isXV",{C_POINTER},C_INT)

public function IMG_isXV(atom src)
	return c_func(xIMG_isXV,{src})
end function

export constant xIMG_isWEBP = define_c_func(img,"+IMG_isWEBP",{C_POINTER},C_INT)

public function IMG_isWEBP(atom src)
	return c_func(xIMG_isWEBP,{src})
end function

export constant xIMG_LoadAVIF_RW = define_c_func(img,"+IMG_LoadAVIF_RW",{C_POINTER},C_POINTER)

public function IMG_LoadAVIF_RW(atom src)
	return c_func(xIMG_LoadAVIF_RW,{src})
end function

export constant xIMG_LoadICO_RW = define_c_func(img,"+IMG_LoadICO_RW",{C_POINTER},C_POINTER)

public function IMG_LoadICO_RW(atom src)
	return c_func(xIMG_LoadICO_RW,{src})
end function

export constant xIMG_LoadCUR_RW = define_c_func(img,"+IMG_LoadCUR_RW",{C_POINTER},C_POINTER)

public function IMG_LoadCUR_RW(atom src)
	return c_func(xIMG_LoadCUR_RW,{src})
end function

export constant xIMG_LoadBMP_RW = define_c_func(img,"+IMG_LoadBMP_RW",{C_POINTER},C_POINTER)

public function IMG_LoadBMP_RW(atom src)
	return c_func(xIMG_LoadBMP_RW,{src})
end function

export constant xIMG_LoadGIF_RW = define_c_func(img,"+IMG_LoadGIF_RW",{C_POINTER},C_POINTER)

public function IMG_LoadGIF_RW(atom src)
	return c_func(xIMG_LoadGIF_RW,{src})
end function

export constant xIMG_LoadJPG_RW = define_c_func(img,"+IMG_LoadJPG_RW",{C_POINTER},C_POINTER)

public function IMG_LoadJPG_RW(atom src)
	return c_func(xIMG_LoadJPG_RW,{src})
end function

export constant xIMG_LoadJXL_RW = define_c_func(img,"+IMG_LoadJXL_RW",{C_POINTER},C_POINTER)

public function IMG_LoadJXL_RW(atom src)
	return c_func(xIMG_LoadJXL_RW,{src})
end function

export constant xIMG_LoadLBM_RW = define_c_func(img,"+IMG_LoadLBM_RW",{C_POINTER},C_POINTER)

public function IMG_LoadLBM_RW(atom src)
	return c_func(xIMG_LoadLBM_RW,{src})
end function

export constant xIMG_LoadPCX_RW = define_c_func(img,"+IMG_LoadPCX_RW",{C_POINTER},C_POINTER)

public function IMG_LoadPCX_RW(atom src)
	return c_func(xIMG_LoadPCX_RW,{src})
end function

export constant xIMG_LoadPNG_RW = define_c_func(img,"+IMG_LoadPNG_RW",{C_POINTER},C_POINTER)

public function IMG_LoadPNG_RW(atom src)
	return c_func(xIMG_LoadPNG_RW,{src})
end function

export constant xIMG_LoadPNM_RW = define_c_func(img,"+IMG_LoadPNM_RW",{C_POINTER},C_POINTER)

public function IMG_LoadPNM_RW(atom src)
	return c_func(xIMG_LoadPNM_RW,{src})
end function

export constant xIMG_LoadSVG_RW = define_c_func(img,"+IMG_LoadSVG_RW",{C_POINTER},C_POINTER)

public function IMG_LoadSVG_RW(atom src)
	return c_func(xIMG_LoadSVG_RW,{src})
end function

export constant xIMG_LoadQOI_RW = define_c_func(img,"+IMG_LoadQOI_RW",{C_POINTER},C_POINTER)

public function IMG_LoadQOI_RW(atom src)
	return c_func(xIMG_LoadQOI_RW,{src})
end function

export constant xIMG_LoadTGA_RW = define_c_func(img,"+IMG_LoadTGA_RW",{C_POINTER},C_POINTER)

public function IMG_LoadTGA_RW(atom src)
	return c_func(xIMG_LoadTGA_RW,{src})
end function

export constant xIMG_LoadTIF_RW = define_c_func(img,"+IMG_LoadTIF_RW",{C_POINTER},C_POINTER)

public function IMG_LoadTIF_RW(atom src)
	return c_func(xIMG_LoadTIF_RW,{src})
end function

export constant xIMG_LoadXCF_RW = define_c_func(img,"+IMG_LoadXCF_RW",{C_POINTER},C_POINTER)

public function IMG_LoadXCF_RW(atom src)
	return c_func(xIMG_LoadXCF_RW,{src})
end function

export constant xIMG_LoadXPM_RW = define_c_func(img,"+IMG_LoadXPM_RW",{C_POINTER},C_POINTER)

public function IMG_LoadXPM_RW(atom src)
	return c_func(xIMG_LoadXPM_RW,{src})	
end function

export constant xIMG_LoadXV_RW = define_c_func(img,"+IMG_LoadXV_RW",{C_POINTER},C_POINTER)

public function IMG_LoadXV_RW(atom src)
	return c_func(xIMG_LoadXV_RW,{src})
end function

export constant xIMG_LoadWEBP_RW = define_c_func(img,"+IMG_LoadWEBP_RW",{C_POINTER},C_POINTER)

public function IMG_LoadWEBP_RW(atom src)
	return c_func(xIMG_LoadWEBP_RW,{src})
end function

export constant xIMG_LoadSizedSVG_RW = define_c_func(img,"+IMG_LoadSizedSVG_RW",{C_POINTER,C_INT,C_INT},C_POINTER)

public function IMG_LoadSizedSVG_RW(atom src,atom w,atom h)
	return c_func(xIMG_LoadSizedSVG_RW,{src,w,h})
end function

export constant xIMG_ReadXPMFromArray = define_c_func(img,"+IMG_ReadXPMFromArray",{C_POINTER},C_POINTER)

public function IMG_ReadXPMFromArray(sequence xpm)
	return c_func(xIMG_ReadXPMFromArray,{xpm})
end function

export constant xIMG_ReadXPMFromArrayToRGB888 = define_c_func(img,"+IMG_ReadXPMFromArrayToRGB888",{C_POINTER},C_POINTER)

public function IMG_ReadXPMFromArrayToRGB888(sequence xpm)
	return c_func(xIMG_ReadXPMFromArrayToRGB888,{xpm})
end function

export constant xIMG_SavePNG_RW = define_c_func(img,"+IMG_SavePNG_RW",{C_POINTER,C_POINTER,C_INT},C_INT)

public function IMG_SavePNG_RW(atom surf,atom dst,atom fdst)
	return c_func(xIMG_SavePNG_RW,{surf,dst,fdst})
end function

export constant xIMG_SavePNG = define_c_func(img,"+IMG_SavePNG",{C_POINTER,C_STRING},C_INT)

public function IMG_SavePNG(atom surf,sequence file)
	return IMG_SavePNG_RW(surf,SDL_RWFromFile(file,"wb"),1)
end function

export constant xIMG_SaveJPG_RW = define_c_func(img,"+IMG_SaveJPG_RW",{C_POINTER,C_POINTER,C_INT,C_INT},C_INT)

public function IMG_SaveJPG_RW(atom surf,atom dst,atom fdst,atom qua)
	return c_func(xIMG_SaveJPG_RW,{surf,dst,fdst,qua})
end function

export constant xIMG_SaveJPG = define_c_func(img,"+IMG_SaveJPG",{C_POINTER,C_STRING,C_INT},C_INT)

public function IMG_SaveJPG(atom surf,sequence file,atom qua)
	return IMG_SaveJPG_RW(surf,SDL_RWFromFile(file,"wb"),1,qua)
end function

public constant IMG_Animation = define_c_struct({
	C_INT, --w
	C_INT, --h
	C_INT, --count
	SDL_Surface, --surface (frames)
	C_POINTER --delays
})

export constant xIMG_LoadAnimation_RW = define_c_func(img,"+IMG_LoadAnimation_RW",{C_POINTER,C_INT},C_POINTER)

public function IMG_LoadAnimation_RW(atom src,atom fsrc)
	return c_func(xIMG_LoadAnimation_RW,{src,fsrc})
end function

export constant xIMG_LoadAnimation = define_c_func(img,"+IMG_LoadAnimation",{C_STRING},C_POINTER)

public function IMG_LoadAnimation(sequence file)
	return IMG_LoadAnimation_RW(SDL_RWFromFile(file,"rb"),1)
end function

export constant xIMG_LoadAnimationTyped_RW = define_c_func(img,"+IMG_LoadAnimationTyped_RW",{C_POINTER,C_INT,C_STRING},C_POINTER)

public function IMG_LoadAnimationTyped_RW(atom src,atom fsrc,sequence xtype)
	return c_func(xIMG_LoadAnimationTyped_RW,{src,fsrc,xtype})
end function

export constant xIMG_FreeAnimation = define_c_proc(img,"+IMG_FreeAnimation",{C_POINTER})

public procedure IMG_FreeAnimation(atom ani)

	c_proc(xIMG_FreeAnimation,{ani})
end procedure

export constant xIMG_LoadGIFAnimation_RW = define_c_func(img,"+IMG_LoadGIFAnimation_RW",{C_POINTER},IMG_Animation)

public function IMG_LoadGIFAnimation_RW(atom src)
	return c_func(xIMG_LoadGIFAnimation_RW,{src})
end function
­354.47