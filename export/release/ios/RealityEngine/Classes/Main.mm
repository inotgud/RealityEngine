#include <stdio.h>

extern "C" const char *hxRunLibrary ();
extern "C" void hxcpp_set_top_of_stack ();

extern "C" int zlib_register_prims ();
extern "C" int lime_register_prims ();

extern "C" int lime_register_prims ();
extern "C" int extension_webm_register_prims ();


extern "C" int SDL_main (int argc, char *argv[]) {

	hxcpp_set_top_of_stack ();

	zlib_register_prims ();
	lime_register_prims ();
	
	lime_register_prims ();
	extension_webm_register_prims ();

	const char *err = NULL;
	err = hxRunLibrary ();

	if (err) {

		printf ("Error %s\n", err);
		return -1;

	}

	return 0;

}