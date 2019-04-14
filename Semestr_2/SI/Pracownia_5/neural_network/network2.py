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
    B = Board()
    with open(filename) as f:
        for line in f:
            y, x = line[:-1].split()
            Y.append(int(y))
            B.load_board(x)
            X.append(B.make_stats())
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
        self.safe_fields = [[3 for i in range(8)] for j in range(8)]
        self.safe_history = []
        self.safe_history.append(copy.deepcopy(self.safe_fields))
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
        self.safe_history.append(copy.deepcopy(self.safe_fields))
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
        self.safe_fields = self.safe_history.pop()
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

    def load_board(self,line):
        for i in range(64):
            if line[i]=='0' or line[i]=='1':
                self.board[i/8][i%8]=int(line[i])
            else:
                self.board[i/8][i%8]=None

    def make_stats(self):
        return [self.move_number(),self.balance(),self.corners_balance(),self.unsafe_balance(),self.safe_balance()]

    def balance(self):
        white = 0
        black = 0
        for i in range(8):
            for j in range(8):
                if self.board[i][j]==1:
                    white+=1
                elif self.board[i][j]==0:
                    black+=1
        return white-black

    def corners_balance(self):
        white = 0
        black = 0
        
        for i in [(0,0),(0,7),(7,0),(7,7)]:
            if self.board[i[0]][i[1]]==0:
                white+=1
            elif self.board[i[0]][i[1]]==1:
                black+=1

        return white-black

    def unsafe_balance(self):
        white = 0
        black = 0

        if self.board[0][0]==None:
            for i in [(0,1),(1,0),(1,1)]:
                if self.board[i[0]][i[1]]==0:
                    white+=1
                elif self.board[i[0]][i[1]]==1:
                    black+=1
        
        if self.board[0][7]==None:
            for i in [(0,6),(1,7),(1,6)]:
                if self.board[i[0]][i[1]]==0:
                    white+=1
                elif self.board[i[0]][i[1]]==1:
                    black+=1

        if self.board[7][0]==None:
            for i in [(6,0),(7,1),(6,1)]:
                if self.board[i[0]][i[1]]==0:
                    white+=1
                elif self.board[i[0]][i[1]]==1:
                    black+=1

        if self.board[7][7]==None:
            for i in [(6,7),(7,6),(6,6)]:
                if self.board[i[0]][i[1]]==0:
                    white+=1
                elif self.board[i[0]][i[1]]==1:
                    black+=1

        return white-black

    def move_number(self):
        res = -4
        for i in range(8):
            for j in range(8):
                if self.board[i][j]!=None:
                    res+=1
        return res

    def safe_balance(self):
        white = 0
        black = 0
        for i in range(8):
            for j in range(8):
                if self.board[i][j]==0 and self.is_safe(i,j,0):
                    white+=1
                elif self.board[i][j]==1 and self.is_safe(i,j,1):
                    black+=1

        return white-black

    def is_safe(self,i,j,color):
        if self.safe_fields[i][j]==color:
            return True

        if (self.up(i,j,color) or self.down(i,j,color)) and (self.left(i,j,color) or self.right(i,j,color)) and (self.up_left(i,j,color) or self.down_right(i,j,color)) and (self.down_left(i,j,color) or self.up_right(i,j,color)):
            self.safe_fields[i][j]=color
            return True
        return False

    def up(self,i,j,color):
        for k in range(i,-1,-1):
            if self.board[k][j]!=color:
                return False
            if self.safe_fields[k][j]==color:
                return True
        return True

    def down(self,i,j,color):
        for k in range(i,8):
            if self.board[k][j]!=color:
                return False
            if self.safe_fields[k][j]==color:
                return True
        return True

    def left(self,i,j,color):
        for k in range(j,-1,-1):
            if self.board[i][k]!=color:
                return False
            if self.safe_fields[i][k]==color:
                return True
        return True

    def right(self,i,j,color):
        for k in range(j,8):
            if self.board[i][k]!=color:
                return False
        if self.safe_fields[i][k]==color:
                return True
        return True

    def up_left(self,i,j,color):
        k = i-1
        l = j-1
        while(k>=0 and l>=0):
            if self.board[k][l]!=color:
                return False
            if self.safe_fields[k][l]==color:
                return True
            k-=1
            l-=1
        return True

    def up_right(self,i,j,color):
        k = i-1
        l = j+1
        while(k>=0 and l<8):
            if self.board[k][l]!=color:
                return False
            if self.safe_fields[k][l]==color:
                return True
            k-=1
            l+=1
        return True

    def down_left(self,i,j,color):
        k = i+1
        l = j-1
        while(k<8 and l>=0):
            if self.board[k][l]!=color:
                return False
            if self.safe_fields[k][l]==color:
                return True
            k+=1
            l-=1
        return True

    def down_right(self,i,j,color):
        k = i+1
        l = j+1
        while(k<8 and l<8):
            if self.board[k][l]!=color:
                return False
            if self.safe_fields[k][l]==color:
                return True
            k+=1
            l+=1
        return True

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
        X = [board.make_stats()]
        res = nn.predict_proba(X)

        return 100000 * res[0][0]*nn.classes_[1] + 100000*res[0][1]*nn.classes_[0]
       

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
        #print player
        #B.draw()
        player = 1-player
        if B.terminal():
            break

    return B.result()


loses = 0
wins = 0
ties = 0
X, y = process_data("bigger.dat")
nn.fit(X, y)

ag = 0

for i in range(1000):
    print i
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






