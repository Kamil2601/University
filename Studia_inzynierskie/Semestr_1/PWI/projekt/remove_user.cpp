#include "main_screen.hpp"
#include <iostream>
using namespace std;

void Main_Window::usun_uzytkownika_signal()
{
	Glib::RefPtr<Gtk::TreeSelection> refTreeSelection = s_TreeView.get_selection();
    Gtk::TreeModel::iterator iter = refTreeSelection->get_selected();
    if(!iter){
        cout << "Nie zaznaczyłeś żadnego obszaru\n";
        return;
    }
    Gtk::TreeModel::Row row = *iter;
    
    string temp = row[s_Columns.nick];
	
	ifstream fin(pathh + "Users");
	ofstream fout(pathh + "temp s");
	while(!fin.eof()){
        string nick, name, surname;
        fin >> nick >> name >> surname;
		if(nick != temp)
			fout << nick << " " << name <<  " " << surname << endl;
	}
	
	temp = pathh + temp;
    std::remove(temp.c_str());
    
    temp = pathh + "Users";
    string temp2 = pathh + "temp s";
    
    std::remove(temp.c_str());
    std::rename(temp2.c_str(), temp.c_str());
    
    int w = row[s_Columns.id] - 1;
    
    typedef Gtk::TreeModel::Children type_children;
    
    type_children children = s_refTreeModel->children();
    for(type_children::iterator iter = row;
    iter != children.end(); ++iter)
	{
  		Gtk::TreeModel::Row row_n = *iter;
  		row_n[s_Columns.id] = w++;
	}
	s_refTreeModel->erase(row);
}