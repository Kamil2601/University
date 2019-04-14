#include "main_screen.hpp"
#include <gtkmm/main.h>

int main (int argc, char *argv[])
{
	Gtk::Main kit(argc, argv);
	Main_Window main;
	//Shows the window and returns when it is closed.
	Gtk::Main::run(main);
	return 0;
}