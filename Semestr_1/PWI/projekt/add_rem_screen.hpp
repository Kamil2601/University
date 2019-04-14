#ifndef ADD_REM_SCREEN
#define ADD_REM_SCREEN

#include <gtkmm.h>

class Rem_Window : public Gtk::Window
{
public:
    Rem_Window();
    virtual ~Rem_Window();
    
	Gtk::Frame m_Frame_dat, m_Frame_desc;
	Gtk::Label m_Label_Minute, m_Label_Hour, m_Label_Day, m_Label_Month, m_Label_Year;
	Gtk::Adjustment m_adjustment_minute, m_adjustment_hour,
		m_adjustment_day, 	m_adjustment_month, m_adjustment_year;
	Gtk::SpinButton m_SpinButton_Minute, m_SpinButton_Hour,
		m_SpinButton_Day, m_SpinButton_Month, m_SpinButton_Year;
	Gtk::Button m_Button_add, m_Button_close;
	Gtk::Entry m_Entry;
	Gtk::VBox m_VBox_Main, m_VBox, m_VBox_d, m_VBox_Minute, m_VBox_Hour, m_VBox_Day,
		m_VBox_Month, m_VBox_Year;
	Gtk::HBox m_HBox_dat, m_HBox_Buttons;
};

#endif
