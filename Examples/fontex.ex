include std/ffi.e

include SDL.e
include SDL_ttf.e

if SDL_Init(SDL_INIT_VIDEO) = -1 then
	puts(1,"Failed to init SDL!\n")
	abort(0)
end if

atom win = SDL_CreateWindow("Font Ex",10,10,800,600,SDL_WINDOW_SHOWN)

if win = -1 then
	puts(1,"Failed to create window!\n")
	abort(0)
end if

atom ren = SDL_CreateRenderer(win,-1,0)

if ren = -1 then
	puts(1,"Failed to create renderer!\n")
	abort(0)
end if

atom x = TTF_Init()

if x = -1 then
	puts(1,"Failed to init TTF!\n")
	abort(0)
end if

atom font = TTF_OpenFont("arial.ttf",20)

if font = -1 then
	puts(1,"Failed to open font!\n")
	abort(0)
end if

atom r = SDL_SetRenderDrawColor(ren,0,0,0,0)
atom run = 1

--Color of text (default red)
--change values to experiment with different colors
sequence col = {255,0,0,0}

atom h = TTF_RenderText_Solid(font,"Hello World",col)
atom ht = SDL_CreateTextureFromSurface(ren,h)

atom evt = 0
atom evt_type = 0

atom key = SDL_GetKeyboardState(NULL)

--allocate struct for position and size of text "Hello World"
atom rect = allocate_struct(SDL_Rect,{800/4,600/4,200,200})

evt = allocate_struct(SDL_Event)

while run = 1 do

	while SDL_PollEvent(evt) != 0 do
	
		evt_type = peek_type(evt,C_UINT32)
		
		if evt_type = SDL_QUIT then
			run = 0				
		end if
		
	end while
	
	--quick and dirty code to close program with ESC key
	SDL_PumpEvents()
	if peek(key+SDL_SCANCODE_ESCAPE) > 0 then
		run = 0
	end if
	--
	
	SDL_RenderClear(ren)
	
	SDL_RenderCopy(ren,ht,0,rect)
	
	SDL_RenderPresent(ren)
	
end while

SDL_DestroyRenderer(ren)
SDL_DestroyWindow(win)

TTF_CloseFont(font)

TTF_Quit()
SDL_Quit()
­84.9