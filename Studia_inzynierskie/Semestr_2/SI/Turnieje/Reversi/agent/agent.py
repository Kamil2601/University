import random
import sys
import copy



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

    
class Reversi:
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
        
                                   
    def moves(self, player):
        res = []
        for (x,y) in self.fields:
            if any( self.can_beat(x,y, direction, player) for direction in Reversi.dirs):
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

        depth = 3
        
        if player==0:
            max_eval = -float("inf")
            best_move = (-1,-1)
            for x in move_list:
                board.do_move(x,player)
                eval_move = self.alpha_beta(board, depth, float("inf"), -float("inf"), 1-player)
                if eval_move > max_eval:
                    best_move = x
                    max_eval = eval_move
                board.undo()
        else:
            min_eval = float("inf")
            best_move = (-1,-1)
            for x in move_list:
                board.do_move(x,player)
                eval_move = self.alpha_beta(board, depth, float("inf"), -float("inf"), 1-player)
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



class Player(object):

    def __init__(self):
        self.reset()

    def reset(self):
        self.game = Reversi()
        self.my_player = 1
        self.agent = Agent()
        self.say('RDY')

    def say(self, what):
        sys.stdout.write(what)
        sys.stdout.write('\n')
        sys.stdout.flush()

    def hear(self):
        line = sys.stdin.readline().split()
        return line[0], line[1:]

    def loop(self):
        while True:
            cmd, args = self.hear()
            if cmd == 'HEDID':
                unused_move_timeout, unused_game_timeout = args[:2]
                move = tuple((int(m) for m in args[2:]))
                if move == (-1, -1):
                    move = None
                self.game.do_move(move, 1 - self.my_player)
            elif cmd == 'ONEMORE':
                self.reset()
                continue
            elif cmd == 'BYE':
                break
            else:
                assert cmd == 'UGO'
                assert not self.game.move_list
                self.my_player = 0

            move = self.agent.agent_move(self.game,self.my_player)
            self.game.do_move(move,self.my_player)
            #print(move)
            if move == None:
                self.say('IDO -1 -1')
            else:
                self.say('IDO %d %d' % move)


def funkcja():
    return (-1,-1)



if __name__ == '__main__':
    player = Player()
    player.loop()
