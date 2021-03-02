#include "add_user_screen.hpp"
#include <iostream>

User_Window::User_Window()
: ads("Add"),
  close("Close"),
  nick("Nick:   "),
  name("Name:  "),
  surname("Surname: ")
{
	set_title("Add User");
    set_position(Gtk::WIN_POS_CENTER);
    set_border_width(5);
    set_default_size(250, 110);
    
    add(Vbox);
    
    Vbox.pack_start(Hbox1, Gtk::PACK_EXPAND_WIDGET, 0);
    Vbox.pack_start(Hbox2, Gtk::PACK_EXPAND_WIDGET, 0);
    Vbox.pack_start(Hbox3, Gtk::PACK_EXPAND_WIDGET, 0);
    Vbox.pack_start(Hbox4, Gtk::PACK_EXPAND_WIDGET, 0);
    
    Hbox1.set_homogeneous(true);
    Hbox1.pack_start(nick, Gtk::PACK_EXPAND_WIDGET, 1);
    Hbox1.pack_start(E_nick, Gtk::PACK_EXPAND_WIDGET, 1);
    
    Hbox2.set_homogeneous(true);
    Hbox2.pack_start(name, Gtk::PACK_EXPAND_WIDGET, 1);
    Hbox2.pack_start(E_name, Gtk::PACK_EXPAND_WIDGET, 1);
    
    Hbox3.set_homogeneous(true);
    Hbox3.pack_start(surname, Gtk::PACK_EXPAND_WIDGET, 1);
    Hbox3.pack_start(E_surname, Gtk::PACK_EXPAND_WIDGET, 1);
    
    Hbox4.pack_start(ads, Gtk::PACK_EXPAND_WIDGET, 1);
    Hbox4.pack_start(close, Gtk::PACK_EXPAND_WIDGET, 1);
    
    show_all_children();
}

User_Window::~User_Window()
{}