#!/usr/bin/env python
# -*- coding: UTF-8 -*-


from __future__ import absolute_import
from __future__ import print_function
from __future__ import unicode_literals


import random
from math import *
import sys
import copy


class Reversi:
    M = 8
    DIRS = [(0, 1), (1, 0), (-1, 0), (0, -1),
            (1, 1), (-1, -1), (1, -1), (-1, 1)]

    def __init__(self):
        self.board = self.initial_board()
        self.fields = set()
        self.move_list = []
        self.history = []
        self.last_player = 1
        for i in range(self.M):
            for j in range(self.M):
                if self.board[i][j] is None:
                    self.fields.add((j, i))

    def initial_board(self):
        B = [[None] * self.M for _ in range(self.M)]
        B[3][3] = 1
        B[4][4] = 1
        B[3][4] = 0
        B[4][3] = 0
        return B

    def draw(self):
        for i in range(self.M):
            res = []
            for j in range(self.M):
                b = self.board[i][j]
                if b is None:
                    res.append('.')
                elif b == 1:
                    res.append('#')
                else:
                    res.append('o')
            print(''.join(res))
        print('')

    def clone(self):
        cl = copy.deepcopy(self)
        return cl

    def moves(self):
        res = []
        player = 1-self.last_player
        for (x, y) in self.fields:
            if any(self.can_beat(x, y, direction, player)
                   for direction in self.DIRS):
                res.append((x, y))
        return res

    def can_beat(self, x, y, d, player):
        dx, dy = d
        x += dx
        y += dy
        cnt = 0
        while self.get(x, y) == 1 - player:
            x += dx
            y += dy
            cnt += 1
        return cnt > 0 and self.get(x, y) == player

    def get(self, x, y):
        if 0 <= x < self.M and 0 <= y < self.M:
            return self.board[y][x]
        return None

    def do_move(self, move):
        player = 1 - self.last_player
        #print(player,len(self.move_list))
        assert player == len(self.move_list) % 2
        self.history.append([x[:] for x in self.board])
        self.move_list.append(move)

        if move is None:
            return
        x, y = move
        x0, y0 = move
        self.board[y][x] = player
        self.fields -= set([move])
        for dx, dy in self.DIRS:
            x, y = x0, y0
            to_beat = []
            x += dx
            y += dy
            while self.get(x, y) == 1 - player:
                to_beat.append((x, y))
                x += dx
                y += dy
            if self.get(x, y) == player:
                for (nx, ny) in to_beat:
                    self.board[ny][nx] = player

        self.last_player = 1-self.last_player

    def result(self):
        res = 0
        for y in range(self.M):
            for x in range(self.M):
                b = self.board[y][x]
                if b == 0:
                    res -= 1
                elif b == 1:
                    res += 1
        return res

    def get_result(self, playerjm):
        jmcount = len([(x,y) for x in range(8) for y in range(8) if self.board[x][y] == playerjm])
        notjmcount = len([(x,y) for x in range(8) for y in range(8) if self.board[x][y] == 3 - playerjm])
        if jmcount > notjmcount: return 1.0
        elif notjmcount > jmcount: return 0.0
        else: return 0.5

    def terminal(self):
        if not self.fields:
            return True
        if len(self.move_list) < 2:
            return False
        return self.move_list[-1] is None and self.move_list[-2] is None



class Node:

    def __init__(self, move = None, parent = None, state = None):
        self.move = move
        self.parent_node = parent
        self.child_nodes = []
        self.wins = 0
        self.visits = 0
        self.untried_moves = state.moves()
        self.last_player = state.last_player
        
    def select_child(self):
        s = sorted(self.child_nodes, key = lambda c: c.wins/c.visits + sqrt(2*log(self.visits)/c.visits))[-1]
        return s
    
    def add_child(self, m, s):
        n = Node(move = m, parent = self, state = s)
        self.untried_moves.remove(m)
        self.child_nodes.append(n)
        return n
    
    def update(self, result):
        self.visits += 1
        self.wins += result

    def __repr__(self):
        return "[M:" + str(self.move) + " W/V:" + str(self.wins) + "/" + str(self.visits) + " U:" + str(self.untried_moves) + "]"

    def TreeToString(self, indent):
        s = self.IndentString(indent) + str(self)
        for c in self.child_nodes:
             s += c.TreeToString(indent+1)
        return s

    def IndentString(self,indent):
        s = "\n"
        for i in range (1,indent+1):
            s += "| "
        return s

    def ChildrenToString(self):
        s = ""
        for c in self.child_nodes:
             s += str(c) + "\n"
        return s


def UCT(rootstate, itermax, verbose = False):
    rootnode = Node(state = rootstate)

    for i in range(itermax):
        node = rootnode
        state = rootstate.clone()

        # Select
        while node.untried_moves == [] and node.child_nodes != []: 
            node = node.select_child()
            state.do_move(node.move)

        # Expand
        if node.untried_moves != []: 
            m = random.choice(node.untried_moves) 
            state.do_move(m)
            node = node.add_child(m,state) 

        # Rollout 
        while state.moves() != []:
            state.do_move(random.choice(state.moves()))

        # Backpropagate
        while node != None:
            node.update(state.get_result(node.last_player))
            node = node.parent_node
    '''
    if (verbose): print(rootnode.TreeToString(0))
    else: print(rootnode.ChildrenToString())'''


    return sorted(rootnode.child_nodes, key = lambda c: c.visits)[-1].move

M = 8


def initial_board():
    B = [ [None] * 8 for i in range(8)]
    B[3][3] = 1
    B[4][4] = 1
    B[3][4] = 0
    B[4][3] = 0
    return B

def field_values():
    B = [[[0 for i in range(8)] for j in range(8)] for i in range(2)]
    for i in range(2):
        B[i][0][0]=B[i][0][7]=B[i][7][0]=B[i][7][7]=30
        B[i][0][1]=B[i][1][0]=B[i][1][1]=-5
        B[i][0][6]=B[i][1][6]=B[i][1][7]=-5
        B[i][6][0]=B[i][6][1]=B[i][7][1]=-5
        B[i][6][6]=B[i][6][7]=B[i][7][6]=-5
    
    return B

def in_range(x,y):
    return x>=0 and x<8 and y>=0 and y<8

class Board:
    dirs  = [ (0,1), (1,0), (-1,0), (0,-1), (1,1), (-1,-1), (1,-1), (-1,1) ]
    
    def __init__(self):
        self.board = initial_board()
        self.vals = field_values()
        self.safe_fields = [[-1 for i in range(8)] for j in range(8)]
        self.fields = set()
        self.move_list = []
        self.history = []
        self.safe_history = []
        self.vals_history = []
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
            print (''.join(res)) 
        print ()           
        
    
    def show(self):
        for i in range(M):
            for j in range(M):
                kwadrat(j, i, 'green')
                
        for i in range(M):
            for j in range(M):                
                if self.board[i][j] == 1:
                    kolko(j, i, 'black')
                if self.board[i][j] == 0:
                    kolko(j, i, 'white')
                                   
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

    def safe(self,y,x,player):
        if in_range(x,y)==False:
            return False
        if self.board[y][x]!=player:
            return False
        hor = in_range(x,y) and (x==0 or x==7 or self.safe_fields[y][x-1]==player or self.safe_fields[y][x+1]==player)
        ver = in_range(x,y) and (y==0 or y==7 or self.safe_fields[y-1][x]==player or self.safe_fields[y+1][x]==player)
        diag_l = in_range(x,y) and (x==0 or x==7 or y==0 or y==7 or self.safe_fields[y-1][x+1]==player or self.safe_fields[y+1][x-1]==player)
        diag_r = in_range(x,y) and (x==0 or x==7 or y==0 or y==7 or self.safe_fields[y+1][x+1]==player or self.safe_fields[y-1][x-1]==player)

        return (hor and ver and diag_l and diag_r)      


    
    def get(self, x,y):
        if 0 <= x < M and 0 <=y < M:
            return self.board[y][x]
        return None

    def undo(self):
        self.board = self.history.pop()
        self.safe_fields = self.safe_history.pop()
        self.vals = self.vals_history.pop()
        x = self.move_list.pop()
        if x!=None:
            self.fields.add(x)

    def change_vals(self, move, player):
        if move == (0,0):
            self.vals[player][1][1]=0
            self.vals[player][1][0]=self.vals[player][0][1]=10
        elif move == (7,0):
            self.vals[player][1][6]=0
            self.vals[player][0][6]=self.vals[player][1][7]=10
        elif move == (0,7):
            self.vals[player][6][1]=0
            self.vals[player][6][0]=self.vals[player][7][1]=10
        elif move == (7,7):
            self.vals[player][6][6]=0
            self.vals[player][6][7]=self.vals[player][7][6]=10

        if self.board[0][0]==player and self.board[1][0]==player:
            self.vals[player][2][0]=10

        if self.board[0][0]==player and self.board[0][1]==player:
            self.vals[player][0][2]=10

        if self.board[0][7]==player and self.board[0][6]==player:
            self.vals[player][0][5]=10

        if self.board[0][7]==player and self.board[1][7]==player:
            self.vals[player][2][7]=10

        if self.board[7][0]==player and self.board[6][0]==player:
            self.vals[player][5][0]=10

        if self.board[7][0]==player and self.board[7][1]==player:
            self.vals[player][7][2]=10

        if self.board[7][7]==player and self.board[7][6]==player:
            self.vals[player][7][5]=10

        if self.board[7][7]==player and self.board[6][7]==player:
            self.vals[player][5][7]=10

        if self.board[0][0]==player and self.board[1][0]==player and self.board[0][1]==player and (self.board[0][2]==player or self.board[2][0]==player):
            self.vals[player][1][1]=10

        if self.board[0][7]==player and self.board[1][7]==player and self.board[0][6]==player and (self.board[0][5]==player or self.board[2][7]==player):
            self.vals[player][1][6]=10

        if self.board[7][0]==player and self.board[7][1]==player and self.board[6][0]==player and (self.board[5][0]==player or self.board[7][2]==player):
            self.vals[player][6][1]=10

        if self.board[7][7]==player and self.board[7][6]==player and self.board[6][7]==player and (self.board[5][7]==player or self.board[7][5]==player):
            self.vals[player][6][6]=10

        


    def do_move(self, move, player):
        self.history.append([x[:] for x in self.board])
        self.safe_history.append(copy.deepcopy(self.safe_fields))
        self.vals_history.append(copy.deepcopy(self.vals))
        self.move_list.append(move) 
        #print(self.move_list)
        if move == None:
            return
        x,y = move
        x0,y0 = move
        self.board[y][x] = player
        #self.safe_update(move,player)
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

        self.change_vals(move,player)
                                                     
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
  

    def balance(self):
        x = self.count()
        return x[0] - x[1]
    
    def count(self):
        white = 0
        black = 0
        for i in range(8):
            for j in range(8):
                if self.board[i][j]==1:
                    white+=1
                elif self.board[i][j]==0:
                    black+=1
        return (black,white)

    def count_safe(self):
        white = 0
        black = 0

        if self.board[0][0]!=None:
            self.safe_fields[0][0]=self.board[0][0]
        if self.board[7][0]!=None:
            self.safe_fields[7][0]=self.board[7][0]
        if self.board[0][7]!=None:
            self.safe_fields[0][7]=self.board[0][7]
        if self.board[7][7]!=None:
            self.safe_fields[7][7]=self.board[7][7]

        line_0 = 0
        line_7 = 0

        for i in range(1,7):
            if self.board[0][i]!=None:
                line_0+=1
            if self.board[0][i]!=None and self.safe_fields[0][i-1]>=0 and self.safe_fields[0][i-1] == self.board[0][i]:
                self.safe_fields[0][i] = self.board[0][i]
            if self.board[7][i]!=None:
                line_7+=1
            if self.board[7][i]!=None and self.safe_fields[7][i-1]>=0 and self.safe_fields[7][i-1] == self.board[7][i]:
                self.safe_fields[7][i] = self.board[7][i]

        if line_0==6 and self.board[0][0]!=None and self.board[0][7]!=None:
            for i in range(1,7):
                self.safe_fields[0][i]=self.board[0][i]

        if line_7==6 and self.board[7][0]!=None and self.board[7][7]!=None:
            for i in range(1,7):
                self.safe_fields[7][i]=self.board[7][i]
        
        for i in range(6,0,-1):
            if self.board[0][i]!=None and self.safe_fields[0][i-1]>=0 and self.safe_fields[0][i-1] == self.board[0][i]:
                self.safe_fields[0][i] = self.board[0][i]
            if self.board[7][i]!=None and self.safe_fields[7][i-1]>=0 and self.safe_fields[7][i-1] == self.board[7][i]:
                self.safe_fields[7][i] = self.board[7][i]

        line_0 = 0
        line_7 = 0

        
        
        for i in range(1,7):
            if self.board[i][0]!= None:
                line_0+=1
            if self.board[i][0]!=None and self.safe_fields[i-1][0]>=0 and self.safe_fields[i-1][0] == self.board[i][0]:
                self.safe_fields[i][0] = self.board[i][0]
            if self.board[i][7]!=None:
                line_7+=1
            if self.board[i][7]!=None and self.safe_fields[i-1][7]>=0 and self.safe_fields[i-1][7] == self.board[i][7]:
                self.safe_fields[i][7] = self.board[i][7]

        if line_0==6 and self.board[0][0]!=None and self.board[0][7]!=None:
            for i in range(1,7):
                self.safe_fields[0][i]=self.board[0][i]

        if line_7==6 and self.board[7][0]!=None and self.board[7][7]!=None:
            for i in range(1,7):
                self.safe_fields[7][i]=self.board[7][i]

        for i in range(6,0,-1):
            if self.board[i][0]!=None and self.safe_fields[i-1][0]>=0 and self.safe_fields[i-1][0] == self.board[i][0]:
                self.safe_fields[i][0] = self.board[i][0]
            if self.board[i][7]!=None and self.safe_fields[i-1][7]>=0 and self.safe_fields[i-1][7] == self.board[i][7]:
                self.safe_fields[i][7] = self.board[i][7]

        for i in range(1,7):
            for j in range(1,7):
                x = self.board[i][j]
                if x!=None and (self.safe_fields[i][j-1]==x or self.safe_fields[i][j+1]==x) and (self.safe_fields[i-1][j]==x or self.safe_fields[i+1][j]==x) and (self.safe_fields[i-1][j-1]==x or self.safe_fields[i+1][j+1]==x) and (self.safe_fields[i+1][j-1]==x or self.safe_fields[i-1][j+1]==x):
                    self.safe_fields[j][j]=x
            
            for j in range(6,0,-1):
                x = self.board[i][j]
                if x!=None and (self.safe_fields[i][j-1]==x or self.safe_fields[i][j+1]==x) and (self.safe_fields[i-1][j]==x or self.safe_fields[i+1][j]==x) and (self.safe_fields[i-1][j-1]==x or self.safe_fields[i+1][j+1]==x) and (self.safe_fields[i+1][j-1]==x or self.safe_fields[i-1][j+1]==x):
                    self.safe_fields[j][j]=x
        
        for i in range(6,0,-1):
            for j in range(1,7):
                x = self.board[i][j]
                if x!=None and (self.safe_fields[i][j-1]==x or self.safe_fields[i][j+1]==x) and (self.safe_fields[i-1][j]==x or self.safe_fields[i+1][j]==x) and (self.safe_fields[i-1][j-1]==x or self.safe_fields[i+1][j+1]==x) and (self.safe_fields[i+1][j-1]==x or self.safe_fields[i-1][j+1]==x):
                    self.safe_fields[j][j]=x
            
            for j in range(6,0,-1):
                x = self.board[i][j]
                if x!=None and (self.safe_fields[i][j-1]==x or self.safe_fields[i][j+1]==x) and (self.safe_fields[i-1][j]==x or self.safe_fields[i+1][j]==x) and (self.safe_fields[i-1][j-1]==x or self.safe_fields[i+1][j+1]==x) and (self.safe_fields[i+1][j-1]==x or self.safe_fields[i-1][j+1]==x):
                    self.safe_fields[j][j]=x
        
        for i in range(8):
            for j in range(8):
                if self.safe_fields[i][j]==0:
                    black+=1
                elif self.safe_fields[i][j]==1:
                    white+=1
        
        return (black,white)

    def count_vals(self):
        n = len(self.move_list)-1
        if n>63:
            return (0,0)
        #print(n)
        black_sum = 0
        white_sum = 0

        for i in range(8):
            for j in range(8):
                if self.board[i][j]==0:
                    black_sum+=F.vals[n][i][j]
                elif self.board[i][j]==1:
                    white_sum+=F.vals[n][i][j]

        return (black_sum,white_sum)
                
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
        if player==0:
            max_eval = -float("inf")
            best_move = 0
            for x in move_list:
                board.do_move(x,player)
                eval_move = self.alpha_beta(board, 0, float("inf"), -float("inf"), 1-player)
                if eval_move > max_eval:
                    best_move = x
                    max_eval = eval_move
                board.undo()
        else:
            min_eval = float("inf")
            best_move = 0
            for x in move_list:
                board.do_move(x,player)
                eval_move = self.alpha_beta(board, 0, float("inf"), -float("inf"), 1-player)
                if eval_move < min_eval:
                    best_move = x
                    min_eval = eval_move
                board.undo()
        return best_move

    def corners(self,board):
        black_sum = 0
        white_sum = 0
        for i in range(8):
            for j in range(8):
                if board.board[i][j]==0:
                    black_sum+=board.vals[0][i][j]
                elif board.board[i][j]==1:
                    white_sum+=board.vals[1][i][j]
        return black_sum-white_sum

    def heuristic(self,board, player):
        saves = board.count_safe()

        n = len(board.move_list)
        
        return n*(saves[0]-saves[1])+(n/20)*board.balance()+3*self.corners(board)

    def alpha_beta(self,board, depth, alpha, beta, player):

        if depth == 0 or board.terminal():
            return self.heuristic(board, player)


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




def play_game():
    agent_player = 0
    ties = 0
    agent_wins = 0
    mcts_wins = 0
    for i in range(10):
        state = Reversi()
        agent_board = Board()
        
        agent = Agent() 
        while (state.moves() != []):
            
            if state.last_player == 1-agent_player:
                m = agent.agent_move(agent_board,agent_player)
            else:
                m = UCT(rootstate = state, itermax = 100, verbose = False)
            state.do_move(m)
            agent_board.do_move(m,state.last_player)
            #print(state.last_player,m)
            #state.draw()
            #raw_input()
        res = state.result()
        if res == 0:
            ties+=1
            print("tie")
        elif res<0:
            if agent_player==0:
                agent_wins+=1
                print("agent")
            else:
                mcts_wins+=1
                print("mcts")
        else:
            if agent_player==0:
                mcts_wins+=1
                print("mcts")
            else: 
                agent_wins+=1
                print("agent")
        agent_player = 1-agent_player

    print(agent_wins,ties,mcts_wins)
        

if __name__ == "__main__":

    play_game()