#include "main_screen.hpp"
#include <ctime>
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <limits.h>
using namespace std;

Main_Window::Main_Window()
: s_dodaj_u("Add user"),
  s_usun_u("Remove user"),
  s_wybierz("Choose"),
  about("About"),
  quit("Quit"),
  m_dodaj("Add reminder"),
  m_usun("Remove reminder"),
  m_edytuj("Edit reminder"),
  m_przelacz("Change user"),
  Hm_Label("Show reminders:"),
  ok(false)
{
	string usr = getenv("USER");
	pathh = "/home/" + usr + "/Dane/";
	string command = "mkdir " + pathh;
	const int dirr_error = system(command.c_str());
	if(dirr_error == -1)
	{
    	cout << "Wystapil problem przy tworzeniu katalogu\n";
    	exit(1);
	}
	
	fstream t(pathh + "Users", ios::app);
    t.close();
    
    m_Combh.append("all"); Map["all"] = INT_MAX; Map[""] = INT_MAX;
    m_Combh.append("within 1 day"); Map["within 1 day"] = 1;
    m_Combh.append("within 7 days"); Map["within 7 days"] = 7;
    m_Combh.append("within 30 days"); Map["within 30 days"] = 30;
    m_Combh.append("within 365 days"); Map["within 365 days"] = 365;
    
    
    add(s_HBox);
    
    s_wybierz.signal_clicked().connect( sigc::mem_fun(*this,
                &Main_Window::wybierz_signal) );
    s_dodaj_u.signal_clicked().connect( sigc::mem_fun(*this,
                &Main_Window::dodaj_uzytkownika_signal));
    s_usun_u.signal_clicked().connect( sigc::mem_fun(*this,
                &Main_Window::usun_uzytkownika_signal) );
    quit.signal_clicked().connect( sigc::mem_fun(*this,
                &Main_Window::quit_signal) );
	m_usun.signal_clicked().connect( sigc::mem_fun(*this,
                &Main_Window::usun_rem_signal) );
    m_Combh.signal_changed().connect(sigc::mem_fun(*this,
              &Main_Window::on_combo_changed) );
    m_dodaj.signal_clicked().connect( sigc::mem_fun(*this,
                &Main_Window::add_rem_signal) );
    m_przelacz.signal_clicked().connect( sigc::mem_fun(*this,
                &Main_Window::przelacz_signal) );
    Glib::signal_timeout().connect( sigc::mem_fun(*this, &Main_Window::change_label), 1000 );
    
    Begin();
}

Main_Window::~Main_Window()
{
	
}

void Main_Window::Begin()
{
    set_title("Users Management");
    set_position(Gtk::WIN_POS_CENTER);
    set_border_width(5);
    resize(450, 200);

    //Dodaje do skrolowanego okna liste
    if(!ok){
    	s_ScrolledWindow.add(s_TreeView);
		ok = 1;
	}
    //Pokazuje scroll tylko wtedy kiedy jest potrzebny:
    s_ScrolledWindow.set_policy(Gtk::POLICY_AUTOMATIC, Gtk::POLICY_AUTOMATIC);

    s_HBox.pack_start(s_ScrolledWindow);
    s_HBox.pack_start(s_VBox, Gtk::PACK_SHRINK);

    // Pakowanie przyciskow startowych
    s_VBox.pack_start(s_wybierz, Gtk::PACK_SHRINK);
    s_VBox.pack_start(s_dodaj_u, Gtk::PACK_SHRINK);
    s_VBox.pack_start(s_usun_u, Gtk::PACK_SHRINK);
    s_VBox.pack_end(quit, Gtk::PACK_SHRINK);
    s_VBox.pack_end(about, Gtk::PACK_SHRINK);
    s_VBox.set_border_width(5);


    //Tworzy model listy
    s_refTreeModel = Gtk::ListStore::create(s_Columns);
    s_TreeView.set_model(s_refTreeModel);

    wczytaj();

    //Wypelnia model listy
    Gtk::TreeModel::Row row;
    int i = 1;
    for(auto &user : us){
        row = *(s_refTreeModel->append());
        row[s_Columns.id] = i++;
        row[s_Columns.nick] = user.second;
        row[s_Columns.name] = user.first.second;
        row[s_Columns.surname] = user.first.first;
    }
    
	s_TreeView.append_column("ID", s_Columns.id);
    s_TreeView.append_column("Nick", s_Columns.nick);
    s_TreeView.append_column("Name", s_Columns.name);
    s_TreeView.append_column("Surname", s_Columns.surname);
    show_all_children();
}

void Main_Window::clear_S()
{
    s_VBox.remove(s_wybierz);
    s_VBox.remove(s_dodaj_u);
    s_VBox.remove(s_usun_u);
    s_VBox.remove(about);
    s_VBox.remove(quit);
    s_HBox.remove(s_ScrolledWindow);
    s_HBox.remove(s_VBox);
    s_TreeView.remove_all_columns();
}

void Main_Window::clear_M()
{
	s_VBox.remove(m_dodaj);
    s_VBox.remove(m_usun);
    s_VBox.remove(m_edytuj);
    s_VBox.remove(m_przelacz);
    s_VBox.remove(quit);
    s_VBox.remove(Hm_Label);
    s_VBox.remove(Date_Label);
    s_VBox.remove(m_Combh);
    s_HBox.remove(s_ScrolledWindow);
    s_HBox.remove(s_VBox);
    s_TreeView.remove_all_columns();	
}

void Main_Window::load_reminders(string user)
{
	reminders.clear();
	act_user = user;
	ifstream fin(pathh + act_user);
	while(!fin.eof())
	{
		string d, descp;
		fin >> d;
		getline(fin, descp); descp.erase(0, 1);
		reminders.insert({d, descp});
	}
	reminders.erase({"", ""});
}

void Main_Window::wybierz_signal()
{
    Glib::RefPtr<Gtk::TreeSelection> refTreeSelection = s_TreeView.get_selection();
    Gtk::TreeModel::iterator iter = refTreeSelection->get_selected();
    if(!iter){
        cout << "Nie zaznaczyłeś żadnego obszaru\n";
        return;
    }
    clear_S();
    
    Gtk::TreeModel::Row row = *iter;
	load_reminders( (string)row[s_Columns.nick] );
	
    set_title("Przypominator v1.0");
    set_position(Gtk::WIN_POS_CENTER);
    set_border_width(5);
    resize(600, 210);

    s_HBox.pack_start(s_ScrolledWindow);
    s_HBox.pack_start(s_VBox, Gtk::PACK_SHRINK);

    // Pakowanie przyciskow startowych
    s_VBox.pack_start(m_dodaj, Gtk::PACK_SHRINK);
    s_VBox.pack_start(m_usun, Gtk::PACK_SHRINK);
    s_VBox.pack_start(m_edytuj, Gtk::PACK_SHRINK);
    s_VBox.pack_start(Hm_Label, Gtk::PACK_EXPAND_WIDGET);
    s_VBox.pack_start(m_Combh, Gtk::PACK_SHRINK);
    s_VBox.pack_end(quit, Gtk::PACK_SHRINK);
    s_VBox.pack_end(m_przelacz, Gtk::PACK_SHRINK);
    s_VBox.pack_end(Date_Label, Gtk::PACK_EXPAND_WIDGET);
    s_VBox.set_border_width(5);
    //Tworzy model listy
    s_refTreeModel = Gtk::ListStore::create(m_Columns);
    s_TreeView.set_model(s_refTreeModel);
	
	for(auto &x : reminders)
	{
		string dat = x.first.substr(0, 10);
		string tim = x.first.substr(11, 5);
		tim[2] = ':';
		
		row = *(s_refTreeModel->append());
		row[m_Columns.date] = dat;
		row[m_Columns.time] = tim;
		row[m_Columns.description] = x.second;
	}
	
	
	s_TreeView.append_column("Date", m_Columns.date);
    s_TreeView.append_column("Time", m_Columns.time);
    s_TreeView.append_column("Description", m_Columns.description);
	
    show_all_children();
}

void Main_Window::wczytaj()
{
	us.clear();
	ifstream File(pathh + "Users");
    while(!File.eof()){
        string nick, name, surname;
        File >> nick >> name >> surname;
    	us.insert({{surname, name}, nick});
    }
    us.erase({ {"",""}, ""});
}

void Main_Window::przelacz_signal()
{
	clear_M();
	Begin();
}