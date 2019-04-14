from Board import *
from Timer import *
import sys

class Level:
    def __init__(self,path):
        self.B = Board(path)
        self.path = path
        self.move_count = 0
        self.clock = Timer()

    #sterowanie, wyświetlenie informacji
    def play(self,screen):
        game_over = False
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    sys.exit(0)
                elif event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_LEFT:
                        self.move('L')
                    elif event.key == pygame.K_RIGHT:
                        self.move('R')
                    elif event.key == pygame.K_UP:
                        self.move('U')
                    elif event.key == pygame.K_DOWN:
                        self.move('D')
                    elif event.key == pygame.K_r:
                        self.reset()
                    elif event.key == pygame.K_ESCAPE:
                        return False
            self.show(screen)    
            if self.B.end():
                next_level = self.show_results(screen)
                if next_level:
                    return True
                else:
                    self.reset()

    #wyświetlenie wyników na koniec poziomu
    def show_results(self,screen):
        pygame.draw.rect(screen,(200,200,200),(300,150,450,400))
        font = pygame.font.SysFont("comicsansms", 72)
        screen.blit(font.render("Congratulations!", True, (0, 128, 0)), (310,200))
        moves = font.render("Moves:" + str(self.move_count), True, (0, 128, 0))
        screen.blit(moves, (360,300))
        time = font.render("Time:" + self.clock.to_string(), True, (0, 128, 0))
        screen.blit(time, (360,400))
        pygame.display.update()
        while True:
            for event in pygame.event.get():
                if event.type == pygame.QUIT:
                    sys.exit(0)
                elif event.type == pygame.KEYDOWN:
                    if event.key == pygame.K_RETURN:
                        return True
                    elif event.key == pygame.K_r:
                        return False

    #wyświetlenie czasu i ruchów w rogach planszy
    def show(self,screen):
        screen.fill((240,230,140), rect=None, special_flags=0)
        self.B.show(screen)
        font = pygame.font.SysFont("comicsansms", 72)
        moves = font.render("Moves:" + str(self.move_count), True, (0, 128, 0))
        screen.blit(moves, (10,10))
        time = font.render("Time:" + self.clock.to_string(), True, (0, 128, 0))
        screen.blit(time, (600,10))
        pygame.display.update()

    #restart poziomu
    def reset(self):
        self.B = Board(self.path)
        self.move_count = 0
        self.clock = Timer()

    #wykonanie ruchu
    def move(self,move):
        self.B.player.sprite_x = (self.B.player.sprite_x+1)%4
        if self.clock.is_started == False:
            self.clock.start()
        if move=='U':
            self.B.player.sprite_y=1
            if self.B.null(self.B.player.y-1,self.B.player.x):
                self.move_count+=1
                self.B.to_null(self.B.player.y,self.B.player.x)
                self.B.player.y-=1
                self.B.to_player(self.B.player.y,self.B.player.x)
            elif self.B.box(self.B.player.y-1,self.B.player.x) and self.B.null(self.B.player.y-2,self.B.player.x):
                self.move_count+=1
                self.B.to_null(self.B.player.y,self.B.player.x)
                self.B.player.y-=1
                self.B.board[self.B.player.y-1][self.B.player.x] = self.B.board[self.B.player.y][self.B.player.x]
                self.B.to_player(self.B.player.y,self.B.player.x)
        if move=='D':
            self.B.player.sprite_y=0
            if self.B.null(self.B.player.y+1,self.B.player.x):
                self.move_count+=1
                self.B.to_null(self.B.player.y,self.B.player.x)
                self.B.player.y+=1
                self.B.to_player(self.B.player.y,self.B.player.x)
            elif self.B.box(self.B.player.y+1,self.B.player.x) and self.B.null(self.B.player.y+2,self.B.player.x):
                self.move_count+=1
                self.B.to_null(self.B.player.y,self.B.player.x)
                self.B.player.y+=1
                self.B.board[self.B.player.y+1][self.B.player.x] = self.B.board[self.B.player.y][self.B.player.x]
                self.B.to_player(self.B.player.y,self.B.player.x)
        if move=='L':
            self.B.player.sprite_y=2
            if self.B.null(self.B.player.y,self.B.player.x-1):
                self.move_count+=1
                self.B.to_null(self.B.player.y,self.B.player.x)
                self.B.player.x-=1
                self.B.to_player(self.B.player.y,self.B.player.x)
            elif self.B.box(self.B.player.y,self.B.player.x-1) and self.B.null(self.B.player.y,self.B.player.x-2):
                self.move_count+=1
                self.B.to_null(self.B.player.y,self.B.player.x)
                self.B.player.x-=1
                self.B.board[self.B.player.y][self.B.player.x-1] = self.B.board[self.B.player.y][self.B.player.x]
                self.B.to_player(self.B.player.y,self.B.player.x)
        if move=='R':
            self.B.player.sprite_y=3
            if self.B.null(self.B.player.y,self.B.player.x+1):
                self.move_count+=1
                self.B.to_null(self.B.player.y,self.B.player.x)
                self.B.player.x+=1
                self.B.to_player(self.B.player.y,self.B.player.x)
            elif self.B.box(self.B.player.y,self.B.player.x+1) and self.B.null(self.B.player.y,self.B.player.x+2):
                self.move_count+=1
                self.B.to_null(self.B.player.y,self.B.player.x)
                self.B.player.x+=1
                self.B.board[self.B.player.y][self.B.player.x+1] = self.B.board[self.B.player.y][self.B.player.x]
                self.B.to_player(self.B.player.y,self.B.player.x)