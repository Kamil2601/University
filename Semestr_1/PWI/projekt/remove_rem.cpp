#include "main_screen.hpp"
#include <iostream>
using namespace std;

void Main_Window::usun_rem_signal()
{
	Glib::RefPtr<Gtk::TreeSelection> refTreeSelection = s_TreeView.get_selection();
    Gtk::TreeModel::iterator iter = refTreeSelection->get_selected();
    if(!iter){
        cout << "Nie zaznaczyłeś żadnego obszaru\n";
        return;
    }
    
    Gtk::TreeModel::Row row = *iter;
    string del_tim = row[m_Columns.time]; del_tim[2] = '-';
    string del_date = (string)row[m_Columns.date] + "-" + del_tim;
    string del_desc = row[m_Columns.description];
    
    ifstream fin(pathh + act_user);
	ofstream fout(pathh + "temp s");
	while(!fin.eof()){
        string date, desc;
        fin >> date;
        getline(fin, desc); desc.erase(0, 1);
		if(date != del_date || desc != del_desc)
			fout << date << " " << desc << endl;
	}
	
	string temp = pathh + act_user;
    std::remove(temp.c_str());
    
    temp = pathh + act_user;
    string temp2 = pathh + "temp s";
    
    std::rename(temp2.c_str(), temp.c_str());
	s_refTreeModel->erase(row);
	reminders.erase({del_date, del_desc});
}
