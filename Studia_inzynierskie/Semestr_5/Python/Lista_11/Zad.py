#!/usr/bin/python3

import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

from Database import *

class Add_Friend_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Add friend")
        self.set_size_request(300, 100)

        self.content = Gtk.Box(spacing=10, orientation=1)
        self.add(self.content)

        self.first_name_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.first_name_box,0,0,0)
        self.last_name_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.last_name_box,0,0,0)
        self.email_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.email_box,0,0,0)
        self.button = Gtk.Button("Add")
        self.button.connect("clicked", self.proceed)
        self.content.pack_start(self.button,0,0,0)
        self.result = Gtk.Label("")
        self.content.pack_start(self.result,0,0,0)

        self.first_name = Gtk.Entry()
        self.last_name = Gtk.Entry()
        self.email = Gtk.Entry()
        self.first_name_label = Gtk.Label("First name: ")
        self.last_name_label = Gtk.Label("Last name: ")
        self.email_label = Gtk.Label("   e-mail:" + 6*" ")        
        
        self.first_name_box.pack_start(self.first_name_label,0,0,0)
        self.first_name_box.pack_start(self.first_name,0,0,0)

        self.last_name_box.pack_start(self.last_name_label,0,0,0)
        self.last_name_box.pack_start(self.last_name,0,0,0)

        self.email_box.pack_start(self.email_label,0,0,0)
        self.email_box.pack_start(self.email,0,0,0)

        self.show_all()

    def proceed(self, button):
        first_name = self.first_name.get_text()
        last_name = self.last_name.get_text()
        email = self.email.get_text()
        res = add_friend(first_name, last_name, email)

        self.result.set_text(res)

class Add_Book_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Add book")
        self.set_size_request(300, 100)

        self.content = Gtk.Box(spacing=10, orientation=1)
        self.add(self.content)

        self.title_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.title_box,0,0,0)
        self.author_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.author_box,0,0,0)
        self.year_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.year_box,0,0,0)
        self.button = Gtk.Button("Add")
        self.button.connect("clicked", self.proceed)
        self.content.pack_start(self.button,0,0,0)
        self.result = Gtk.Label("")
        self.content.pack_start(self.result,0,0,0)

        self.title = Gtk.Entry()
        self.author = Gtk.Entry()
        self.year = Gtk.Entry()
        self.title_label = Gtk.Label("   Title: ")
        self.author_label = Gtk.Label("   Author: ")
        self.year_label = Gtk.Label("   Year: ")        
        
        self.title_box.pack_start(self.title_label,0,0,0)
        self.title_box.pack_start(self.title,0,0,0)

        self.author_box.pack_start(self.author_label,0,0,0)
        self.author_box.pack_start(self.author,0,0,0)

        self.year_box.pack_start(self.year_label,0,0,0)
        self.year_box.pack_start(self.year,0,0,0)

        self.show_all()

    def proceed(self, button):
        title = self.title.get_text()
        author = self.author.get_text()
        year = self.year.get_text()
        res = add_book(title, author, year)

        self.result.set_text(res)

class Delete_Friend_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Delete friend")
        self.show_all()

class Delete_Book_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Delete book")
        self.show_all()

class Find_Friend_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Find friend")
        self.show_all()

class Find_Book_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Find book")
        self.content = Gtk.Box(spacing=10, orientation=1)
        self.add(self.content)

        self.book_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.book_box,0,0,0)
        self.show_all()

class Rent_Book_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Rent book")
        self.content = Gtk.Box(spacing=10, orientation=1)
        self.add(self.content)

        self.book_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.book_box,0,0,0)
        self.friend_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.friend_box,0,0,0)
        self.button = Gtk.Button("Rent")
        self.button.connect("clicked", self.proceed)
        self.content.pack_start(self.button,0,0,0)
        self.result = Gtk.Label("")
        self.content.pack_start(self.result,0,0,0)

        self.book_entry = Gtk.Entry()
        self.book_label = Gtk.Label("   Book id   ")
        self.book_box.pack_start(self.book_label,0,0,0)
        self.book_box.pack_start(self.book_entry,0,0,0)

        self.friend_entry = Gtk.Entry()
        self.friend_label = Gtk.Label("   Friend id  ")
        self.friend_box.pack_start(self.friend_label,0,0,0)
        self.friend_box.pack_start(self.friend_entry,0,0,0)

        self.show_all()

    def proceed(self,button):
        book_id = self.book_entry.get_text()
        friend_id = self.friend_entry.get_text()
        
        res = rent_book(book_id, friend_id)
        self.result.set_text(res)

class Return_Book_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Return book")
        self.content = Gtk.Box(spacing=10, orientation=1)
        self.add(self.content)

        self.book_box = Gtk.Box(spacing=3)
        self.content.pack_start(self.book_box,0,0,0)
        self.button = Gtk.Button("Return")
        self.button.connect("clicked", self.proceed)
        self.content.pack_start(self.button,0,0,0)
        self.result = Gtk.Label("")
        self.content.pack_start(self.result,0,0,0)

        self.book_entry = Gtk.Entry()
        self.book_label = Gtk.Label("   Book id   ")
        self.book_box.pack_start(self.book_label,0,0,0)
        self.book_box.pack_start(self.book_entry,0,0,0)

        self.show_all()

    def proceed(self,button):
        book_id = self.book_entry.get_text()
        
        res = return_book(book_id)
        self.result.set_text(res)

class List_Friends_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="List friends")
        friends = list_friends()
        self.label = Gtk.Label(friends)
        self.add(self.label)
        self.show_all()

class List_Books_Window(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="List books")
        books = list_books()
        self.label = Gtk.Label(books)
        self.add(self.label)
        self.show_all()

class Menu(Gtk.Window):
    def __init__(self):
        Gtk.Window.__init__(self, title="Book database")
        self.connect("destroy", Gtk.main_quit)

        self.grid = Gtk.Grid()
        self.add(self.grid)
        self.grid.set_hexpand(True)

        self.add_friend_button = Gtk.Button(label = "Add friend")
        self.add_book_button = Gtk.Button(label = "Add book")
        self.delete_friend_button = Gtk.Button(label = "Delete friend")
        self.delete_book_button = Gtk.Button(label = "Delete book")
        self.find_friend_button = Gtk.Button(label = "Find friend")
        self.find_book_button = Gtk.Button(label = "Find book")
        self.rent_book_button = Gtk.Button(label = "Rent book")
        self.return_book_button = Gtk.Button(label = "Return book")
        self.list_friends_button = Gtk.Button(label = "List friends")
        self.list_books_button = Gtk.Button(label = "List books")

        self.add_friend_button.connect("clicked", self.add_friend_window)
        self.add_book_button.connect("clicked", self.add_book_window)
        self.delete_friend_button.connect("clicked", self.delete_friend_window)
        self.delete_book_button.connect("clicked", self.delete_book_window)
        self.find_friend_button.connect("clicked", self.find_friend_window)
        self.find_book_button.connect("clicked", self.find_book_window)
        self.rent_book_button.connect("clicked", self.rent_book_window)
        self.return_book_button.connect("clicked", self.return_book_window)
        self.list_friends_button.connect("clicked", self.list_friends_window)
        self.list_books_button.connect("clicked", self.list_books_window)
        self.title = Gtk.Label("\nDATABASE\n")
        self.space = Gtk.Label(10*" ")

        self.grid.attach(self.title,0,0,3,2)
        self.grid.attach(self.add_friend_button, 0, 2, 1, 1)
        self.grid.attach(self.add_book_button, 0, 3, 1, 1)
        self.grid.attach(self.space, 1, 2, 1, 4)
        self.grid.attach(self.delete_friend_button, 2, 2, 1, 1)
        self.grid.attach(self.delete_book_button, 2, 3, 1, 1)
        self.grid.attach(self.find_friend_button, 0, 5, 1, 1)
        self.grid.attach(self.find_book_button, 0, 6, 1, 1)
        self.grid.attach(self.rent_book_button, 2, 5, 1, 1)
        self.grid.attach(self.return_book_button, 2, 6, 1, 1)
        self.grid.attach(self.list_friends_button, 0, 7, 1, 1)
        self.grid.attach(self.list_books_button, 2, 7, 1, 1)

    def add_friend_window(self, button):
        Add_Friend_Window()

    def add_book_window(self, button):
        Add_Book_Window()

    def delete_friend_window(self, button):
        Delete_Friend_Window()

    def delete_book_window(self, button):
        Delete_Book_Window()

    def find_friend_window(self, button):
        Find_Friend_Window()

    def find_book_window(self, button):
        Find_Book_Window()

    def rent_book_window(self, button):
        Rent_Book_Window()

    def return_book_window(self, button):
        Return_Book_Window()

    def list_friends_window(self, button):
        List_Friends_Window()

    def list_books_window(self, button):
        List_Books_Window()


def main():
    Base.metadata.create_all(engine)
    menu = Menu()
    menu.show_all()
    Gtk.main()

if __name__=="__main__":
    main()