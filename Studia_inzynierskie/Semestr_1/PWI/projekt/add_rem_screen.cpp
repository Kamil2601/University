#include "add_rem_screen.hpp"
#include <iostream>
using namespace std;

Rem_Window::Rem_Window()
:
  m_Frame_dat("Date and Time: "),
  m_Frame_desc("Description: "),
  m_VBox_Main(false, 5),
  m_Label_Day("Day: "),
  m_Label_Month("Month: "),
  m_Label_Year("Year: "),
  m_Label_Minute("Minute: "),
  m_Label_Hour("Hour: "),
  m_adjustment_day(1.0, 1.0, 31.0, 1.0, 5.0, 0.0),
  m_adjustment_month(1.0, 1.0, 12.0, 1.0, 5.0, 0.0),
  m_adjustment_year(2018.0, 2018.0, 2100.0, 1.0, 100.0, 0.0),
  m_adjustment_minute(0.0, 0.0, 59.0, 1.0, 10.0, 0.0),
  m_adjustment_hour(0.0, 0.0, 23.0, 1.0, 5.0, 0.0),
  m_SpinButton_Day(m_adjustment_day),
  m_SpinButton_Month(m_adjustment_month),
  m_SpinButton_Year(m_adjustment_year),
  m_SpinButton_Minute(m_adjustment_minute),
  m_SpinButton_Hour(m_adjustment_hour),
  m_Button_add("Add"),
  m_Button_close("Close")
{
	set_title("Add Reminder");
	set_position(Gtk::WIN_POS_CENTER);
    set_border_width(5);

	m_VBox_Main.set_border_width(10);
	add(m_VBox_Main);

  	m_VBox_Main.pack_start(m_Frame_dat);

  	m_VBox.set_border_width(5);
  	m_Frame_dat.add(m_VBox);


  	m_VBox.pack_start(m_HBox_dat, Gtk::PACK_EXPAND_WIDGET, 5);
  	
  	m_Label_Hour.set_alignment(Gtk::ALIGN_START);
  	m_VBox_Hour.pack_start(m_Label_Hour);
  	m_SpinButton_Hour.set_wrap();
  	m_VBox_Hour.pack_start(m_SpinButton_Hour);
  	m_HBox_dat.pack_start(m_VBox_Hour, Gtk::PACK_EXPAND_WIDGET, 5);
  	

  	m_Label_Minute.set_alignment(Gtk::ALIGN_START);
  	m_VBox_Minute.pack_start(m_Label_Minute);
  	m_SpinButton_Minute.set_wrap();
  	m_VBox_Minute.pack_start(m_SpinButton_Minute);
  	m_HBox_dat.pack_start(m_VBox_Minute, Gtk::PACK_EXPAND_WIDGET, 5);

	m_Label_Day.set_alignment(Gtk::ALIGN_START);
  	m_VBox_Day.pack_start(m_Label_Day);
  	m_SpinButton_Day.set_wrap();
  	m_VBox_Day.pack_start(m_SpinButton_Day);
  	m_HBox_dat.pack_start(m_VBox_Day, Gtk::PACK_EXPAND_WIDGET, 5);

	m_Label_Month.set_alignment(Gtk::ALIGN_START);
  	m_VBox_Month.pack_start(m_Label_Month);
  	m_SpinButton_Month.set_wrap();
  	m_VBox_Month.pack_start(m_SpinButton_Month);
  	m_HBox_dat.pack_start(m_VBox_Month, Gtk::PACK_EXPAND_WIDGET, 5);
	

  	m_Label_Year.set_alignment(Gtk::ALIGN_START);
  	m_VBox_Year.pack_start(m_Label_Year);
  	m_SpinButton_Year.set_wrap();
  	m_SpinButton_Year.set_size_request(55, -1);
  	m_VBox_Year.pack_start(m_SpinButton_Year);
  	m_HBox_dat.pack_start(m_VBox_Year, Gtk::PACK_EXPAND_WIDGET, 5);
  	
  	m_VBox_Main.pack_start(m_Frame_desc);
  	m_Frame_desc.add(m_VBox_d);
  	m_VBox_d.pack_start(m_Entry, Gtk::PACK_EXPAND_WIDGET);
  	m_VBox_Main.pack_start(m_HBox_Buttons, Gtk::PACK_EXPAND_WIDGET);
  	
  	m_HBox_Buttons.pack_start(m_Button_add, Gtk::PACK_EXPAND_WIDGET);
  	m_HBox_Buttons.pack_start(m_Button_close, Gtk::PACK_EXPAND_WIDGET);
  	
  	show_all_children();
}

Rem_Window::~Rem_Window()
{}