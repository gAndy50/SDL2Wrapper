--Simple Window
--SDL2 Wrapper for Euphoria

include std/ffi.e
include sdl.e
--include SDL_pixels.e

constant MAX_WIDTH = 640,
		 MAX_HEIGHT = 480
		 
public constant TRUE = 1,
				FALSE = 0

procedure main()

 atom win = 0
 
 if SDL_Init(SDL_INIT_VIDEO) = -1 then
 	puts(1,"Failed to init SDL!\n")
 	abort(0)
 end if
 
 win = SDL_CreateWindow("Simple Window (Closes after 3 seconds)",SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,MAX_WIDTH,MAX_HEIGHT,SDL_WINDOW_SHOWN)
 
 if win = -1 then
 	puts(1,"Failed to create window!\n")
 	abort(0)
 end if
 
 SDL_Delay(3000) --3 seconds
 
 
 SDL_DestroyWindow(win)
 SDL_Quit()
end procedure

main()
­23.63