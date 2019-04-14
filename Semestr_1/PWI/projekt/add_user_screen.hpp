#ifndef ADD_USER_SCREEN
#define ADD_USER_SCREEN

#include <gtkmm.h>

class User_Window : public Gtk::Window
{
	
public:
    User_Window();
    virtual ~User_Window();
    
	Gtk::Button ads, close;
	Gtk::Label nick, name, surname;
	Gtk::Entry E_nick, E_name, E_surname;
	Gtk::VBox Vbox;
	Gtk::HBox Hbox1, Hbox2, Hbox3, Hbox4;
};

#endif
