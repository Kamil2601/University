import copy
import pygame

class Player:
    def __init__(self,x,y):
        self.size = 64
        self.x = x
        self.y = y
        self.sprites = self.load_sprites()
        self.sprite_y = 0
        self.sprite_x = 1

    #wyświetlenie gracza na ekranie
    def show_player(self,screen,x_offset,y_offset):
        screen.blit(self.sprites[self.sprite_y][self.sprite_x],
            (self.x*self.size+x_offset,self.y*self.size+y_offset))

    #załadowanie sprite'ów gracza
    def load_sprites(self):
        res = [[] for i in range(4)]

        for i in range(4):
            folders = "sprites/Player/"
            name = "down_0" + str(i) + ".png"
            path = folders+name
            res[0].append(pygame.image.load(path))
            name = "up_0" + str(i) + ".png"
            path = folders+name
            res[1].append(pygame.image.load(path))
            name = "left_0" + str(i) + ".png"
            path = folders+name
            res[2].append(pygame.image.load(path))
            name = "right_0" + str(i) + ".png"
            path = folders+name
            res[3].append(pygame.image.load(path))

        return res

class Board:
    def __init__(self,path):
        self.size = 64
        self.board = self.load_board(path)
        self.boxes = self.make_image_dict("sprites/boxes_dict")
        self.holes = self.find_holes()
        self.targets = self.make_image_dict("sprites/targets_dict")
        self.colors = self.make_dict("sprites/colors_dict")
        self.holes_dict = self.make_image_dict("sprites/holes_dict")
        self.objects = list(self.boxes.keys())+['P']
        self.can_go = ['.']+list(self.targets.keys())
        self.map = self.make_map()
        x,y = self.find_player()
        self.player = Player(x,y)
        self.x_offset = (1024-len(self.board[0])*self.size)/2
        self.y_offset = (640-len(self.board)*self.size)/2

    def find_holes(self):
        res = {}
        for i in range(len(self.board)):
            for j in range(len(self.board[0])):
                if self.board[i][j]=='H':
                    res[(j,i)]==Hole(j,i)

    #załadowanie planszy
    def load_board(self,path):
        f = open(path)
        res = []
        for line in f:
            l = list(line)
            while l[-1]=='\n':
                l.pop(-1)
            res.append(copy.deepcopy(l))
        while res[-1]==[]:
            res.pop(-1)
        return res
    
    #utworzenie mapy na podstawie wczytanej planszy
    def make_map(self):
        res = copy.deepcopy(self.board)

        for i in range(len(res)):
            for j in range(len(res[0])):
                if res[i][j] in self.objects:
                    res[i][j]='.'
        return res

    #znalezienie gracza (P) na planszy
    def find_player(self):
        for i in range(len(self.board)):
            for j in range(len(self.board[0])):
                if self.board[i][j]=='P':
                    return (j,i)

    #wypisanie planszy w konsoli
    def draw(self):
        for row in self.board:
            for x in row:
                print(x,end="")
            print()

    #czy na polu jest skrzynka
    def box(self,i,j):
        return self.board[i][j] in self.colors.values()

    #czy na polu jest ściana
    def wall(self,i,j):
        return self.board[i][j]=='#'

    #czy pole jest celem
    def target(self,i,j):
        return self.board[i][j] in self.colors

    #czy przez pole można przejść
    def null(self,i,j):
        return self.board[i][j] in self.can_go

    #zmień wartość pola na taką jak w mapie
    def to_null(self,i,j):
        self.board[i][j]=self.map[i][j]

    #zmień wartoś pola na P
    def to_player(self,i,j):
        self.board[i][j]='P'

    #utworzenie słownika
    def make_dict(self,path):
        f = open(path)
        res = {}
        for line in f:
            el,path = line.split()
            res[el] = path
        return res

    #utworzenie słownika (znak,obrazek)
    def make_image_dict(self,path):
        f = open(path)
        res = {}
        for line in f:
            el,path = line.split()
            res[el] = pygame.image.load(path)
        return res
        
    #sprawdzenie czy nastąpił koniec gry
    def end(self):
        for i in range(len(self.board)):
            for j in range(len(self.board[0])):
                if self.map[i][j] in self.colors and self.colors[self.map[i][j]]!=self.board[i][j]:
                    return False

        return True

    #wyświetlenie pola
    def show_pic(self,pic,x,y,screen):
        screen.blit(pic,(x+self.x_offset,y+self.y_offset))

    #wyświetlenie planszy
    def show(self,screen):
        size = 64
        for i in range(len(self.board)):
            for j in range(len(self.board[0])):
                self.show_pic(pygame.image.load("sprites/Ground/Ground_Grass.png"),j*size,i*size,screen)
                if self.board[i][j] in self.boxes:
                    self.show_pic(self.boxes[self.board[i][j]],j*size,i*size,screen)
                if self.board[i][j] in self.targets:
                    self.show_pic(self.targets[self.board[i][j]],j*size,i*size,screen)
                elif self.board[i][j]=='P':
                    self.player.show_player(screen,self.x_offset,self.y_offset)
                elif self.board[i][j]=='#':
                    self.show_pic(pygame.image.load("sprites/Blocks/Wall_Gray.png"),j*size,i*size,screen)

class Hole:
    def __init__(self,x,y):
        self.x = x
        self.y = y
        self.box_inside = '.'

    def empty(self):
        return self.box_inside == '.'

    def show_hole(self,x_offset,y_offset):
        image = ''
        if self.box_inside == None:
            image = pygame.image.load("sprites/Environment/envorinoment_15.png")
        elif self.box_inside == 'X':
            image = pygame.image.load("sprites/Crates/crate_37.png")
        elif self.box_inside == 'B':
            image = pygame.image.load("sprites/Crates/crate_39.png")
        elif self.box_inside == 'B':
            image = pygame.image.load("sprites/Crates/crate_39.png")

