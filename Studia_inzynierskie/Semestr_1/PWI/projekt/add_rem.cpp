#include "main_screen.hpp"
using namespace std;

void Main_Window::add_reminder(string date, string desc)
{
	fstream fout(pathh + act_user, ios::app);
	fout << date << " " << desc << endl;
	reminders.insert({date, desc});
	
	string get = m_Combh.get_active_text();
	if(!is_close(date, Map[get])) return;
	
	typedef Gtk::TreeModel::Children type_children;
	type_children children = s_refTreeModel->children();
	type_children::iterator place = children.end();
    
    for(type_children::iterator iter = children.begin();
    iter != children.end() && place == children.end(); ++iter)
	{
  		Gtk::TreeModel::Row row = *iter;
  		string tim = row[m_Columns.time]; tim[2] = '-';
  		string cmp = (string)row[m_Columns.date] + "-" + tim;
  		
		if(cmp > date)
			place = iter;
	}
	if(place == children.end())
		place = s_refTreeModel->append();
	else
		place = s_refTreeModel->insert(place);
	
	string dat = date.substr(0, 10);
	string tim = date.substr(11, 5);
	tim[2] = ':';
	
	Gtk::TreeModel::Row row = *place;
	//cout << dat << endl << tim << endl << desc;
	row[m_Columns.date] = dat;
	row[m_Columns.time] = tim;
	row[m_Columns.description] = desc;
}

void Main_Window::add_rem_pom()
{
	auto func = [](string a)->string
	{
		if((int)a.size() < 2)
			return "0" + a;
		return a;
	};

	string minute = func((string)rem_win->m_SpinButton_Minute.get_text());
	string hour = func((string)rem_win->m_SpinButton_Hour.get_text());
	string day = func((string)rem_win->m_SpinButton_Day.get_text());
	string month = func((string)rem_win->m_SpinButton_Month.get_text());
	string year = (string)rem_win->m_SpinButton_Year.get_text();
	string date = year + "-" + month + "-" + day + "-" + hour + "-" + minute;
	string desc = rem_win->m_Entry.get_text();
	if(reminders.find({date, desc}) == reminders.end())
		add_reminder(date, desc);
	rem_close();
}

void Main_Window::add_rem_signal()
{
	rem_win = new Rem_Window;
	rem_win->signal_hide().connect(sigc::mem_fun(*this, &Main_Window::rem_hide));
	rem_win->m_Button_close.signal_clicked().connect( sigc::mem_fun(*this,
                &Main_Window::rem_close) );
    rem_win->m_Button_add.signal_clicked().connect( sigc::mem_fun(*this,
            	&Main_Window::add_rem_pom) );
	rem_win->show();
}