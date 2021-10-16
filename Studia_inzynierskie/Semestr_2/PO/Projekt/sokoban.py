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
    pygame.init()
    screen = pygame.display.set_mode((1024,640))
    pygame.display.set_caption('Sokoban')
    levels = 5
    M = Main_menu()

    while not quit_game:
        play_game = M.play(screen)
        if play_game:
            for i in range(1,levels+1):
                L = Level("Boards/level_"+str(i))
                continue_game = L.play(screen)
                if not continue_game:
                    break
        else:
            quit_game = True
    pygame.quit()
