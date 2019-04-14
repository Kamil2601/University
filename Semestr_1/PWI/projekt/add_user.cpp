#include "main_screen.hpp"
#include <iostream>
using namespace std;

bool Main_Window::spr(string pattern)
{
	ifstream fin(pathh + "Users");
	while(!fin.eof()){
        string nick, name, surname;
        fin >> nick >> name >> surname;
    	if(pattern == nick)
    		return false;
    }
    return true;
}

void Main_Window::dodaj_uzytkownika_signal()
{
	usr_win = new User_Window;
	usr_win->signal_hide().connect(sigc::mem_fun(*this, &Main_Window::usr_hide));
	usr_win->close.signal_clicked().connect( sigc::mem_fun(*this,
                &Main_Window::usr_close) );
    usr_win->ads.signal_clicked().connect( sigc::mem_fun(*this,
            	&Main_Window::usr_ads) );
	usr_win->show();
}

void Main_Window::usr_ads()
{
	string nick = usr_win->E_nick.get_text();
	string name = usr_win->E_name.get_text();
	string surname = usr_win->E_surname.get_text();
	size_t f1, f2, f3;
	f1 = nick.find(' ');
	f2 = name.find(' ');
	f3 = surname.find(' ');
	if(f1 != string::npos || f2 != string::npos || f3 != string::npos)
	{
		cout << "Usun zbedne spacje!" << endl;
		return;
	}
	if(!spr(nick))
	{
		cout << "Taki uzytkownik juz istnieje!" << endl;
		return;
	}
	
	pair <string, string> neew = {surname, name};
	
	typedef Gtk::TreeModel::Children type_children;
	
	int id = 0;
	
	type_children children = s_refTreeModel->children();
	type_children::iterator place = children.end();
    for(type_children::iterator iter = children.begin();
    iter != children.end() && place == children.end(); ++iter)
	{
  		Gtk::TreeModel::Row row = *iter;
		pair <string, string> temp = {row[s_Columns.surname], row[s_Columns.name]};
		if(temp > neew)
			place = iter;
		else
			id++;
	}
	if(place == children.end())
		place = s_refTreeModel->append();
	else
		place = s_refTreeModel->insert(place);
	Gtk::TreeModel::Row row = *place;
	row[s_Columns.nick] = nick;
	row[s_Columns.name] = name;
	row[s_Columns.surname] = surname;
	for(type_children::iterator iter = place;
    iter != children.end(); ++iter){
    	row = *iter;
    	row[s_Columns.id] = ++id;
	}
	fstream F(pathh + "Users", ios::app);
	F << nick << " " << name << " " << surname << endl;
	F.close();
	F.open(pathh + nick, ios::out); F.close();
	usr_close();
}