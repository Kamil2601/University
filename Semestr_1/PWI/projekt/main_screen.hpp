#ifndef START_SCREEN
#define START_SCREEN

#include "add_user_screen.hpp"
#include "add_rem_screen.hpp"
#include <fstream>
#include <set>
#include <string>
#include <map>
#include <ctime>
using namespace std;

class Main_Window : public Gtk::Window
{

public:
    Main_Window();
    virtual ~Main_Window();

protected:
	
    //funkcje pomocnicze
    void Begin();
    void clear_S();
    void clear_M();
    void wczytaj();
    void load_reminders(string user);
    void add_reminder(string date, string desc);
    void add_rem_pom();
    bool spr(string pattern);
    bool change_label();
    bool is_close(string x, int diff);
    
    //sygnaly
    void wybierz_signal();
    void przelacz_signal();
    void dodaj_uzytkownika_signal();
    void usun_uzytkownika_signal();
    void quit_signal();
    void usr_close();
	void usr_hide();
	void usr_ads();
	void on_combo_changed();
	void usun_rem_signal();
	void add_rem_signal();
	void rem_hide();
	void rem_close();
	
    //Kolumnowy widok uzytkownikow
    class Start : public Gtk::TreeModel::ColumnRecord
    {
    public:
		Start()
		{add(id), add(nick); add(name); add(surname);}
		
		Gtk::TreeModelColumn<int> id;
		Gtk::TreeModelColumn<string> nick;
		Gtk::TreeModelColumn<string> name;
		Gtk::TreeModelColumn<string> surname;
    };
    
    class Main : public Gtk::TreeModel::ColumnRecord
    {
    public:
		Main()
		{add(date), add(time), add(description);}
		
		Gtk::TreeModelColumn<string> date;
		Gtk::TreeModelColumn<string> time;
		Gtk::TreeModelColumn<string> description;
    };
	
	User_Window *usr_win;
	Rem_Window *rem_win;
	
    // elementy okna
    Start s_Columns;
	Main m_Columns;
	
    Gtk::Button s_wybierz, s_dodaj_u, s_usun_u;
    Gtk::Button about, quit;
    Gtk::Button m_dodaj, m_usun, m_edytuj, m_przelacz;

    Gtk::HBox s_HBox;
    Gtk::VBox s_VBox;
    
    Gtk::Label Date_Label, Hm_Label;;
    
    Gtk::ScrolledWindow s_ScrolledWindow;
    Gtk::TreeView s_TreeView;
    Glib::RefPtr<Gtk::ListStore> s_refTreeModel;
    
    set < pair <pair <string, string>, string> > us;
    set < pair <string, string> > reminders;
	
	std::map <string, int> Map;
	Gtk::ComboBoxText m_Combh;
	
	string act_user;
    string pathh;
    
    bool ok;
};


#endif
