# SDL2Wrapper
Wrapper of SDL 2 for Euphoria using Greg's FFI library. Special thanks to Chris for his contributions.

# About
This is a wrapper for SDL2 for use with the Euphoria programming library. You can use SDL2 with Euphoria is the main point of this wrapper. SDL is used to make games, and multimedia applications. 

Note: This wrapper is currently using SDL 2.30.7 and will be updated as SDL 2 gets updated. For compatbility reasons, the 32-bit DLL is being used. You may use the 64-bit DLL if you'd like, but it has not been tested. All example programs written by author of SDL2 Wrapper unless otherwise stated. 

Copyright (c) 2024

# Example
```euphoria
--Simple Window
--SDL2 Wrapper for Euphoria

include std/ffi.e
include sdl.e

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
 
 win = SDL_CreateWindow("Simple Window (Closes after 3 seconds)",
 SDL_WINDOWPOS_UNDEFINED,SDL_WINDOWPOS_UNDEFINED,MAX_WIDTH,MAX_HEIGHT,SDL_WINDOW_SHOWN)
 
 if win = -1 then
 	puts(1,"Failed to create window!\n")
 	abort(0)
 end if
 
 SDL_Delay(3000) --3 seconds
 
 SDL_DestroyWindow(win)
 SDL_Quit()
end procedure

main()
```

# Another Example
```euphoria
--Simple event window with SDL2 FFI
--Click the X to close the window
without warning

include SDL.e
include std/ffi.e

constant WIDTH = 800
constant HEIGHT = 600
constant NULL = 0

constant TRUE = 1, FALSE = 0

object meh

if SDL_Init(SDL_INIT_EVERYTHING) < 0 then
	puts(1,"Failed to init SDL!\n")
end if

atom win = SDL_CreateWindow("SDL Event Example (Click X to close)",SDL_WINDOWPOS_CENTERED,SDL_WINDOWPOS_CENTERED,WIDTH,HEIGHT,SDL_WINDOW_SHOWN)
atom surf = SDL_GetWindowSurface(win)

integer q = 0
atom e = 0
atom e_type = 0

q = FALSE

e = allocate_struct(SDL_Event)

while q = FALSE do

	while SDL_PollEvent(e) != 0 do
		e_type = peek_type(e,C_UINT32)
		if e_type = SDL_QUIT then
			q = TRUE
		end if
	end while
	
	SDL_UpdateWindowSurface(win)
	
end while


SDL_DestroyWindow(win)
SDL_Quit()
```

# License
You use this software at your own risk. There is no warranty for this software. You may not hold the developer(s) responsible for anything you do with
this software. You may use this software to use the SDL2 library to write Euphoria programs. You may distribute the programs you write with this wrapper
how you please. You may not claim you wrote the original wrapper. 
