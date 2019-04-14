#include "main_screen.hpp"
using namespace std;

bool Main_Window::change_label()
{
    time_t rtime;
    tm * timeinfo;
    time ( &rtime );
    timeinfo = localtime ( &rtime );
    Date_Label.set_label(asctime(timeinfo));
    return true;
}

bool Main_Window::is_close(string x, int diff)
{
	time_t rawtime;
	tm *now_time, act_time;
	time(&rawtime);
	now_time = localtime(&rawtime);
	
	act_time.tm_year = stoi(x.substr(0, 4)) - 1900;
	act_time.tm_mon = stoi(x.substr(5, 2)) - 1;
	act_time.tm_mday = stoi(x.substr(8, 2));
	act_time.tm_hour = act_time.tm_min = act_time.tm_sec = 0;
	mktime(&act_time);
	int act_day = (act_time.tm_year - now_time->tm_year) * 365 + act_time.tm_yday;
	
	return act_day - now_time->tm_yday <= diff;
}

void Main_Window::on_combo_changed()
{
	string text = m_Combh.get_active_text();
	s_refTreeModel->clear();
	int diff = Map[text];
	for(auto &x : reminders)
	{
		if(is_close(x.first, diff))
		{
			string dat = x.first.substr(0, 10);
			string tim = x.first.substr(11, 5);
			tim[2] = ':';
			
			Gtk::TreeModel::Row row;
			row = *(s_refTreeModel->append());
			row[m_Columns.date] = dat;
			row[m_Columns.time] = tim;
			row[m_Columns.description] = x.second;	
		}
	}
}