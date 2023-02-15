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
­44.0