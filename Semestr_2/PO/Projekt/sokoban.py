#Kamil Michalak 299089

import sys
import pygame
import copy
import os
from Board import *
from Level import *
from Menu import *
from Timer import *


if __name__ == '__main__':
    quit_game = False
    #inicjowanie biblioteki Pygame
    pygame.init()
    #Utworzenie okna gry
    screen = pygame.display.set_mode((1024,640))
    pygame.display.set_caption('Sokoban')
    #liczba poziomów
    levels = 5
    #Utworzenie menu
    M = Main_menu()

    while not quit_game:
        #wyświetlenie menu
        play_game = M.play(screen)
        #jeśli wybrano start
        if play_game:
            for i in range(1,levels+1):
                L = Level("Boards/level_"+str(i))
                continue_game = L.play(screen)
                #jeśli wybrano wyjście z poziomu
                if not continue_game:
                    break
        #jeśli wybrano quit
        else:
            quit_game = True
    #zamknięcie pygame
    pygame.quit()
    




