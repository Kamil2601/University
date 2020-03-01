#!/usr/bin/python3

from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import *
from sqlalchemy.orm import relationship, sessionmaker
import argparse

Base = declarative_base()
engine = create_engine('sqlite:///Books_and_friends.db', echo=False)

class Book(Base):
    __tablename__ = "books"
    id = Column(Integer, primary_key=True)
    title = Column(String)
    author = Column(String,)
    year = Column(Integer)
    friend_id = Column(Integer, ForeignKey('friends.id'), nullable=True)
    
    def __repr__(self):
        return "<Book(id: '%s', title: '%s', author: '%s', year: '%s', friend_id: %s)>" % \
            (self.id, self.title, self.author, self.year, self.friend_id)

class Friend(Base):
    __tablename__ = "friends"
    id = Column(Integer, primary_key=True)
    first_name = Column(String)
    last_name = Column(String)
    email = Column(String)
    books = relationship("Book")

    def __repr__(self):
        return "<Friend(first_name: '%s', last_name: '%s', email: '%s')>" % \
            (self.first_name, self.last_name, self.email)


def add_book(title_, author_, year_):
    if None in [title_, author_, year_]:
        print("Incomplete informations about new book!")
        return
    session = sessionmaker(bind=engine)()
    book = Book(title=title_,author=author_,year=year_)
    session.add(book)
    session.commit()
    print("Book added to database")

def add_friend(first_name_, last_name_, email_):
    if None in [first_name_, last_name_, email_]:
        print("Incomplete informations about new friend!")
        return
    session = sessionmaker(bind=engine)()
    friend = Friend(first_name=first_name_,last_name=last_name_,email=email_)
    session.add(friend)
    session.commit()
    print("Friend added to database")
    

def find_books(title_, author_, year_):
    session = sessionmaker(bind=engine)()
    result = session.query(Book).filter(Book.title==title_).all()
    print(result)

def list_books():
    session = sessionmaker(bind=engine)()
    result = session.query(Book).all()
    print("Books in database:")
    for book in result:
        print(book)

def list_friends():
    session = sessionmaker(bind=engine)()
    result = session.query(Friend).all()
    print("Friends in database:")
    for friend in result:
        print(friend)

def rent_book(book_id, friend_id):
    session = sessionmaker(bind=engine)()
    book = session.query(Book).filter(Book.id==book_id).first()
    if book==None:
        print("Book doesn't exist")
        return
    elif book.friend_id!=None:
        print("Book already loan")
        return
    
    friend = session.query(Friend).filter(Friend.id==friend_id).first()

    if friend==None:
        print("Friend doesn't exist")
        return

    book.friend_id = friend.id
    friend.books.append(book)

    session.commit()

def return_book(book_id):
    session = sessionmaker(bind=engine)()
    book = session.query(Book).filter(Book.id==book_id).first()
    if book==None:
        print("Book doesn't exist")
        return
    elif book.friend_id==None:
        print("Book is not on loan")
        return

    friend = session.query(Friend).filter(Friend.id==book.friend_id).first()
    book.friend_id = None

    session.commit()

def list_friend_books(friend_id):
    session = sessionmaker(bind=engine)()
    friend = session.query(Friend).filter(Friend.id==friend_id).first()

    if friend==None:
        print("Friend doesn't exist")
        return

    print("Books borrowed by [%s] %s %s" % (friend.id, friend.first_name, friend.last_name))

    for book in friend.books:
        print(book)

def main():
    
    Base.metadata.create_all(engine)

    parser = argparse.ArgumentParser(description='Type command')
    parser.add_argument('action', help="add/find_friend/book", type=str)
    parser.add_argument("--title", help="book title", type=str)
    parser.add_argument("--author", help="book author", type=str)
    parser.add_argument("--year", help="book year", type=str)
    parser.add_argument("--first_name", help="first_name", type=str)
    parser.add_argument("--last_name", help="last_name", type=str)
    parser.add_argument("--email", help="email", type=str)
    parser.add_argument("--book_id", help="book_id", type=int)
    parser.add_argument("--friend_id", help="friend_id", type=int)
    args = vars(parser.parse_args())


    if args['action'] == "add_book":
        add_book(args['title'], args['author'], args['year'])
    elif args['action'] == 'add_friend':
        add_friend(args['first_name'],args['last_name'],args['email'])
    elif args['action'] == "find_book":
        find_books(args['title'], args['author'], args['year'])
    elif args['action'] == 'friend':
        find_friends(args['first_name'],args['last_name'],args['email'])
    elif args['action'] == "list_books":
        list_books()
    elif args['action'] == 'list_friends':
        list_friends()
    elif args['action'] == 'rent_book':
        rent_book(args['book_id'], args['friend_id'])
    elif args['action'] == 'list_friend_books':
        list_friend_books(args['friend_id'])
    elif args['action'] == 'return_book':
        return_book(args['book_id'])
    else:
        print("Wrong action")

if __name__=="__main__":
    main()
