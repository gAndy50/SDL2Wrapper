include std/ffi.e
include sdl.e
include sdl_gpu.e

atom done = 0
atom evt = 0
atom e_type = 0

atom scr = 0

scr = allocate_struct(GPU_Target)

evt = allocate_struct(SDL_Event)

scr = GPU_Init(800,600,GPU_DEFAULT_INIT_FLAGS)

if scr = -1 then
	puts(1,"Failed")
end if

while done = 0 do

	while SDL_PollEvent(evt) != 0 do
		e_type = peek_type(evt,C_UINT32)
		if e_type = SDL_QUIT then
			done = 1
		end if
	end while
	
	GPU_Clear(scr)
	
	GPU_Flip(scr)

end while

GPU_Quit()
­15.46