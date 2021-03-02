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
    if "" in [title_, author_, year_]:
        return "Incomplete informations about new book!"

    session = sessionmaker(bind=engine)()
    book = Book(title=title_,author=author_,year=year_)
    session.add(book)
    session.commit()
    return "Book added to database"

def add_friend(first_name_, last_name_, email_):
    if "" in [first_name_, last_name_, email_]:
        return "Incomplete informations about new friend!"

    session = sessionmaker(bind=engine)()
    friend = Friend(first_name=first_name_,last_name=last_name_,email=email_)
    session.add(friend)
    session.commit()
    return "Friend added to database"
    

def find_books(title_):
    session = sessionmaker(bind=engine)()
    result = session.query(Book).filter(Book.title==title_).all()
    res = str(len(result)) + "books found:\n"
    for book in result:
        res += str(book)+"\n"

def list_books():
    session = sessionmaker(bind=engine)()
    result = session.query(Book).all()
    res = "Books in database:\n"
    for book in result:
        res += str(book) + "\n"

    return res

def list_friends():
    session = sessionmaker(bind=engine)()
    result = session.query(Friend).all()
    res = "Friends in database:\n"
    for friend in result:
        res += str(friend)+"\n"
    return res

def rent_book(book_id, friend_id):
    session = sessionmaker(bind=engine)()
    book = session.query(Book).filter(Book.id==book_id).first()
    if book==None:
        return "Book doesn't exist\n"
    elif book.friend_id!=None:
        return "Book already loan\n"
    
    friend = session.query(Friend).filter(Friend.id==friend_id).first()

    if friend==None:
        return "Friend doesn't exist\n"

    book.friend_id = friend.id
    friend.books.append(book)

    session.commit()

    return "Sucess!\n"

def return_book(book_id):
    session = sessionmaker(bind=engine)()
    book = session.query(Book).filter(Book.id==book_id).first()
    if book==None:
        return "Book doesn't exist\n"
    elif book.friend_id==None:
        return "Book is not on loan\n"

    friend = session.query(Friend).filter(Friend.id==book.friend_id).first()
    book.friend_id = None

    session.commit()

    return "Success!\n"

def list_friend_books(friend_id):
    session = sessionmaker(bind=engine)()
    friend = session.query(Friend).filter(Friend.id==friend_id).first()

    if friend==None:
        print("Friend doesn't exist")
        return

    print("Books borrowed by [%s] %s %s" % (friend.id, friend.first_name, friend.last_name))

    for book in friend.books:
        print(book)