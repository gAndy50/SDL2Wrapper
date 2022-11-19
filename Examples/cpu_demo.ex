--Show CPU Info Demo

include sdl.e

puts(1,"1 Means True, 0 Means False\n")

printf(1,"CPU Count: %d\n",{SDL_GetCPUCount() })
printf(1,"Cache Line Size: %d\n",{SDL_GetCPUCacheLineSize() })
printf(1,"Has RDTSC: %d\n",{SDL_HasRDTSC() })
printf(1,"Has AtltiVec: %d\n",{SDL_HasAltiVec() })
printf(1,"Has MMX:%d\n",{SDL_HasMMX() })
printf(1,"Has 3D Now:%d\n",{SDL_Has3DNow() })
printf(1,"Has SSE:%d\n",{SDL_HasSSE() })
printf(1,"Has SSE2:%d\n",{SDL_HasSSE2() })
printf(1,"Has SSE3:%d\n",{SDL_HasSSE3() })
printf(1,"Has SSE41:%d\n",{SDL_HasSSE41() })
printf(1,"Has SSE42:%d\n",{SDL_HasSSE42() })
printf(1,"Has AVX:%d\n",{SDL_HasAVX() })
printf(1,"Has AVX2:%d\n",{SDL_HasAVX2() })
printf(1,"Has AVX512F:%d\n",{SDL_HasAVX512F() })
printf(1,"Has ARMSIMD:%d\n",{SDL_HasARMSIMD() })
printf(1,"Has NEON:%d\n",{SDL_HasNEON() })
printf(1,"Has LSX:%d\n",{SDL_HasLSX() })
printf(1,"Has LASX:%d\n",{SDL_HasLASX() })
printf(1,"RAM: %d\n",{SDL_GetSystemRAM() })
printf(1,"OS: %s\n",{SDL_GetPlatform() })
­26.39