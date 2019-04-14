import pygame
import sys


class Main_menu:
    def __init__(self):
        font = pygame.font.SysFont("comicsansms", 150)
        self.title = pygame.image.load("sprites/Menu/title.png")
        self.start = font.render("START", True, (0, 128, 0))
        self.quit = font.render("QUIT", True, (0, 128, 0))
        self.left = font.render("->", True, (0, 128, 0))
        self.right = font.render("<-", True, (0, 128, 0))
        self.positions = [((150,240)),((170,380))]
        self.arrows = 0

    #sterowanie w menu
    def play(self,screen):
        while True:
            for event in pygame.event.get():
                    if event.type == pygame.QUIT:
                        sys.exit(0)
                    elif event.type == pygame.KEYDOWN:
                        if event.key == pygame.K_UP:
                            self.arrows = (self.arrows-1)%2
                        elif event.key == pygame.K_DOWN:
                            self.arrows = (self.arrows+1)%2
                        elif event.key == pygame.K_RETURN:
                            if self.arrows==1:
                                return False
                            else:
                                return True

            self.show(screen)
    
    #wyświetlenie menu
    def show(self,screen):
        screen.fill((150, 150, 150), rect=None, special_flags=0)
        screen.blit(self.title,(60,30))
        screen.blit(self.start,(300,250))
        screen.blit(self.quit,(320,400))
        screen.blit(self.left,self.positions[self.arrows])
        pygame.display.update()