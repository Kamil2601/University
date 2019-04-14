#include "main_screen.hpp"

void Main_Window::rem_close()
{
	rem_win->hide();
}

void Main_Window::rem_hide()
{
	delete rem_win;
}

void Main_Window::usr_close()
{
	usr_win->hide();
}

void Main_Window::usr_hide()
{
	delete usr_win;
}

void Main_Window::quit_signal()
{
	hide();
}