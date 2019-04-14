import random
import sys
import copy
from  sklearn.neural_network  import MLPClassifier
import  random , pickle
import numpy as np


M = 8

nn = MLPClassifier(hidden_layer_sizes = (64,32 ,16,8))

def process_data(filename):
    Y = []
    X = []
    with open(filename) as f:
        for line in f:
            y, x = line[:-1].split()
            Y.append(int(y))
            X.append([int(c) if c != '_' else 3 for c in x])
    return (X, Y)

def initial_board():
    B = [ [None] * 8 for i in range(8)]
    B[3][3] = 1
    B[4][4] = 1
    B[3][4] = 0
    B[4][3] = 0
    return B

class Board:
    dirs  = [ (0,1), (1,0), (-1,0), (0,-1), (1,1), (-1,-1), (1,-1), (-1,1) ]
    
    def __init__(self):
        self.board = initial_board()
        self.fields = set()
        self.move_list = []
        self.history = []
        for i in range(M):
            for j in range(M):
                if self.board[i][j] == None:   
                    self.fields.add( (j,i) )
                                                
    def draw(self):
        for i in range(M):
            res = []
            for j in range(M):
                b = self.board[i][j]
                if b == None:
                    res.append('.')
                elif b == 1:
                    res.append('#')
                else:
                    res.append('o')
            print ''.join(res) 
        print            
        
                                   
    def moves(self, player):
        res = []
        for (x,y) in self.fields:
            if any( self.can_beat(x,y, direction, player) for direction in Board.dirs):
                res.append( (x,y) )
        if not res:
            return [None]
        return res               
    
    def can_beat(self, x,y, d, player):
        dx,dy = d
        x += dx
        y += dy
        cnt = 0
        while self.get(x,y) == 1-player:
            x += dx
            y += dy
            cnt += 1
        return cnt > 0 and self.get(x,y) == player
    
    def get(self, x,y):
        if 0 <= x < M and 0 <=y < M:
            return self.board[y][x]
        return None
                        
    def do_move(self, move, player):
        self.history.append([x[:] for x in self.board])
        self.move_list.append(move)
        
        if move == None:
            return
        x,y = move
        x0,y0 = move
        self.board[y][x] = player
        self.fields -= set([move])
        for dx,dy in self.dirs:
            x,y = x0,y0
            to_beat = []
            x += dx
            y += dy
            while self.get(x,y) == 1-player:
              to_beat.append( (x,y) )
              x += dx
              y += dy
            if self.get(x,y) == player:              
                for (nx,ny) in to_beat:
                    self.board[ny][nx] = player
                                                     
    def result(self):
        res = 0
        for y in range(M):
            for x in range(M):
                b = self.board[y][x]                
                if b == 0:
                    res -= 1
                elif b == 1:
                    res += 1
        return res

    def undo(self):
        self.board = self.history.pop()
        #self.safe_fields = self.safe_history.pop()
        #self.vals = self.vals_history.pop()
        x = self.move_list.pop()
        if x!=None:
            self.fields.add(x)
                
    def terminal(self):
        if not self.fields:
            return True
        if len(self.move_list) < 2:
            return False
        return self.move_list[-1] == self.move_list[-2] == None 

    def random_move(self, player):
        ms = self.moves(player)
        if ms:
            return random.choice(ms)
        return [None]

class Agent:
    def agent_move(self,board, player):
        move_list = board.moves(player)
        depth = 0
        if player==0:
            max_eval = -float("inf")
            best_move = 0
            for x in move_list:
                board.do_move(x,player)
                eval_move = self.alpha_beta(board, depth, float("inf"), -float("inf"), 1-player)
                if eval_move > max_eval:
                    best_move = x
                    max_eval = eval_move
                board.undo()
        else:
            min_eval = float("inf")
            best_move = 0
            for x in move_list:
                board.do_move(x,player)
                eval_move = self.alpha_beta(board, depth, float("inf"), -float("inf"), 1-player)
                if eval_move < min_eval:
                    best_move = x
                    min_eval = eval_move
                board.undo()
        return best_move

    def heuristic(self, board):
        X = [[item if item != None else 3 for sublist in board.board for item in sublist]]
        res = nn.predict_proba(X)

        return 100000 * res[0][1]*nn.classes_[0] + 100000*res[0][0]*nn.classes_[1]
       

    def alpha_beta(self,board, depth, alpha, beta, player):

        if depth == 0 or board.terminal():
            return self.heuristic(board)

        if player == 0:
            max_eval = - float("inf")
            move_list = board.moves(player)
            for x in move_list:
                board.do_move(x, player)
                eval_move = self.alpha_beta(board, depth-1, alpha, beta, 1-player)
                max_eval = max(max_eval,eval_move)
                alpha = max(alpha, eval_move)
                board.undo()
                if beta<=alpha:
                    break
            return max_eval
        else:
            min_eval = float("inf")
            move_list = board.moves(player)
            for x in move_list:
                board.do_move(x,player)
                eval_move = self.alpha_beta(board, depth-1, alpha, beta, 1-player)
                min_eval = min(min_eval,eval_move)
                beta = min(beta, eval_move)
                board.undo()
            return min_eval


def play(ag):
    player = 0
    B = Board()
    A = Agent()
    m = None
    while True:
        # B.draw()
        # B.show()
        if player != ag:
            m = B.random_move(player)
        else:
            m = A.agent_move(B,player)
        B.do_move(m, player)
        player = 1-player
        # input()
        if B.terminal():
            break

        # B.draw()
        # B.show()
        # print('Result', B.result())
    return B.result()


loses = 0
wins = 0
ties = 0
X, y = process_data("smaller.dat")
nn.fit(X, y)
ag = 0

for i in range(100):
    x = play(ag)
    if x==0:
        ties+=1
    elif x<0:
        if ag == 0:
            wins+=1
        else:
            loses+=1
    else:
        if ag == 0:
            loses+=1
        else:
            wins+=1

    ag = 1-ag


print wins, ties, loses
