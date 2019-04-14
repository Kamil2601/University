import random
import copy
import operator
import sys

class Jungle:
    def __init__(self):
        self.board = [[['.','x'] for i in range(7)] for j in range(9)]
        self.board[0][2][0] = self.board[0][4][0]=self.board[1][3][0]=self.board[8][2][0]=self.board[8][4][0]=self.board[7][3][0]='#'
        self.board[0][3] = ['*','x']
        self.board[8][3] = ['*','x']
        self.board[3] =[['.','x'],['-','x'],['-','x'],['.','x'],['-','x'],['-','x'],['.','x']]
        self.board[4] = copy.deepcopy(self.board[3])
        self.board[5] = copy.deepcopy(self.board[3])
        
        self.board[0][0][1]='L'
        self.board[0][6][1]='T'
        self.board[1][1][1]='D'
        self.board[1][5][1]='C'
        self.board[2][0][1]='R'
        self.board[2][2][1]='J'
        self.board[2][4][1]='W'
        self.board[2][6][1]='E'

        self.board[8][0][1]='t'
        self.board[8][6][1]='l'
        self.board[7][1][1]='c'
        self.board[7][5][1]='d'
        self.board[6][0][1]='e'
        self.board[6][2][1]='w'
        self.board[6][4][1]='j'
        self.board[6][6][1]='r'

        white_pieces = {'R':1, 'C':2, 'D':3, 'W':4, 'J':5, 'T':6, 'L':7, 'E':8}
        black_pieces = {'r':1, 'c':2, 'd':3, 'w':4, 'j':5, 't':6, 'l':7, 'e':8}
        white_pos = {'R':[2,0], 'C':[1,5], 'D':[1,1], 'W':[2,4], 'J':[2,2], 'T':[0,6], 'L':[0,0], 'E':[2,6]}
        black_pos = {'r':[6,6], 'c':[7,1], 'd':[7,5], 'w':[6,2], 'j':[6,4], 't':[8,0], 'l':[8,6], 'e':[6,0]}

        self.pieces = [white_pieces,black_pieces]
        self.piece_val = {'R':1, 'C':2, 'D':3, 'W':4, 'J':5, 'T':6, 'L':7, 'E':8, 'r':1, 'c':2, 'd':3, 'w':4, 'j':5, 't':6, 'l':7, 'e':8}
        self.pos = [white_pos,black_pos]
        self.cave = [(0,3),(8,3)]
        self.no_capture = 0
        self.move_list = []

        self.history = []

    def draw(self):
        for i in range(9):
            for j in range(7):
                if self.board[i][j][1]=='x':
                    print(self.board[i][j][0],end='')
                else:
                    print(self.board[i][j][1],end='')
            print()


    
    def check_result(self, player):
        if self.board[0][3][1]!='x':
            return 1
        if self.board[8][3][1]!='x':
            return 0
        
        white_vals = sorted(self.pieces[0].values(),reverse=True)
        black_vals = sorted(self.pieces[1].values(),reverse=True)

        for i in range(min(len(white_vals),len(black_vals))):
            if white_vals[i]>black_vals[i]:
                return 0
            elif white_vals[i]<black_vals[i]:
                return 1

        if len(white_vals)>len(black_vals):
            return 0
        elif len(white_vals)<len(black_vals):
            return 1

        white_p = ['E','L','T','J','W','D','C','R']
        black_p = ['e','l','t','j','w','d','c','r']


        for i in range(8):
            if white_p[i] in self.pos[0]:
                white_dist = abs(self.pos[0][white_p[i]][0]-8)+abs(self.pos[0][white_p[i]][1]-3)
                black_dist = abs(self.pos[1][black_p[i]][0]-0)+abs(self.pos[1][black_p[i]][1]-3)

                if white_dist<black_dist:
                    return 0
                elif white_dist>black_dist:
                    return 1
        return 1
    
    def moves(self,player):
        ms = []
        op = 1-player
        for p in self.pos[player].keys():
            y = self.pos[player][p][0]
            x = self.pos[player][p][1]
            neigh_fields = [(y-1,x),(y+1,x),(y,x-1),(y,x+1)]
            fields = []

            for f in neigh_fields:
                if f[0]>=0 and f[0]<9 and f[1]>=0 and f[1]<7 and f!=self.cave[player] and (not self.board[f[0]][f[1]][1] in self.pieces[player]):
                    fields.append(f)

            if p == 'R' or p == 'r':
                e = ''
                r = ''
                if p=='R':
                    e = 'e'
                    r = 'r'
                else:
                    e = 'E'
                    r = 'R'
                for f in fields:
                    if self.board[y][x][0]!='-':
                        if self.board[f[0]][f[1]][1]=='x' or self.board[f[0]][f[1]][1]==e or self.board[f[0]][f[1]][1]==r or self.board[f[0]][f[1]][0]=='#':
                            ms.append((p,f[0],f[1]))
                    elif self.board[f[0]][f[1]][0]=='-':
                        ms.append((p,f[0],f[1]))

            elif p == 'E' or p == 'e':
                r = ''
                if p=='E':
                    r = 'r'
                else:
                    r = 'R'
                for f in fields:
                    if self.board[f[0]][f[1]][1]!=r and self.board[f[0]][f[1]][0]!='-' or self.board[f[0]][f[1]][0]=='#':
                        ms.append((p,f[0],f[1]))

            elif p == 'L' or p == 'T' or p == 'l' or p == 't':
                if p == 'L' or p == 'T':
                    r = 'r'
                else:
                    r = 'R'

                for f in fields:
                    if self.board[f[0]][f[1]][0]=='-':
                        if f[0]==y-1:
                            y_t = y-4
                            x_t = x
                            if self.board[y-1][x][1]!=r and self.board[y-2][x][1]!=r and self.board[y-3][x][1]!=r:
                                t = self.board[y_t][x_t][1]
                                if t=='x':
                                    ms.append((p,y_t,x_t))
                                elif not t in self.pieces[player] and self.pieces[op][t]<=self.pieces[player][p]:
                                    ms.append((p,y_t,x_t))
                        elif f[0]==y+1:
                                y_t = y+4
                                x_t = x
                                if self.board[y+1][x][1]!=r and self.board[y+2][x][1]!=r and self.board[y+3][x][1]!=r:
                                    t = self.board[y_t][x_t][1]
                                    if t=='x':
                                        ms.append((p,y_t,x_t))
                                    elif not t in self.pieces[player] and self.pieces[op][t]<=self.pieces[player][p]:
                                        ms.append((p,y_t,x_t))
                        elif f[1]==x-1:
                                y_t = y
                                x_t = x-3
                                if self.board[y][x-1][1]!=r and self.board[y][x-1][1]!=r:
                                    t = self.board[y_t][x_t][1]
                                    if t=='x':
                                        ms.append((p,y_t,x_t))
                                    elif not t in self.pieces[player] and self.pieces[op][t]<=self.pieces[player][p]:
                                        ms.append((p,y_t,x_t))
                        elif f[1]==x+1:
                                y_t = y
                                x_t = x+3
                                if self.board[y][x+1][1]!=r and self.board[y][x+1][1]!=r:
                                    t = self.board[y_t][x_t][1]
                                    if t=='x':
                                        ms.append((p,y_t,x_t))
                                    elif not t in self.pieces[player] and self.pieces[op][t]<=self.pieces[player][p]:
                                        ms.append((p,y_t,x_t))
                    else:
                        if self.board[f[0]][f[1]][1]=='x' or self.board[f[0]][f[1]][0]=='#':
                            ms.append((p,f[0],f[1]))
                        elif self.pieces[op][self.board[f[0]][f[1]][1]]<=self.pieces[player][p]:
                            ms.append((p,f[0],f[1]))
            else:
                for f in fields:
                    if self.board[f[0]][f[1]][0]!='-':
                        if self.board[f[0]][f[1]][1]=='x' or self.board[f[0]][f[1]][0]=='#':
                            ms.append((p,f[0],f[1]))
                        elif self.pieces[op][self.board[f[0]][f[1]][1]]<=self.pieces[player][p]:
                            ms.append((p,f[0],f[1]))
        return ms

    def do_move(self,move,player):
        #print(move)
        op = 1-player
        p = move[0]
        y_t = move[1]
        x_t = move[2]
        y = self.pos[player][p][0]
        x = self.pos[player][p][1]
        self.board[y][x][1]='x'
        #print(y_t,x_t)
        t = self.board[y_t][x_t][1]

        self.history.append((player,p,y,x,y_t,x_t,t,self.no_capture))

        if t!='x':
            #self.draw()
            #print(player,op)
            self.no_capture = 0
            self.pos[op].pop(t)
            self.pieces[op].pop(t)
        else:
            self.no_capture +=1

        

        self.pos[player][p] = [y_t,x_t]

        self.board[y_t][x_t][1]=p

    def undo(self):
        last_move = self.history.pop()
        self.board[last_move[2]][last_move[3]][1]=last_move[1]
        self.board[last_move[4]][last_move[5]][1]=last_move[6]
        self.pos[last_move[0]][last_move[1]]=[last_move[2],last_move[3]]
        self.no_capture = last_move[7]
        if last_move[6]!='x':
            self.pos[1-last_move[0]][last_move[6]]=[last_move[4],last_move[5]]
            self.pieces[1-last_move[0]][last_move[6]] = self.piece_val[last_move[6]]


    def random_move(self,player):
        move_list = self.moves(player)
        if len(move_list)==0:
            print("PUSTA", player)
            self.draw()
            input()

        move = random.choice(move_list)
        #print(move)
        self.do_move(move,player)

    def game_over(self, player):
        if self.board[0][3][1]!='x' or self.board[8][3][1]!='x' or self.no_capture>=50 or len(self.pos[0])==0 or len(self.pos[1])==0:
            return True
        else:
            ms = self.moves(player)
            if len(ms)==0:
                return True
            else:
                return False

    def random_game(self,player):
        moves = 0
        p = player
        while self.game_over(player)==False:
            self.random_move(p)
            p=1-p
            moves+=1
        return moves


    def random_agent(self, player):
        ms = self.moves(player)
        l = len(ms)
        moves_per_choice = 20000/l
        best_move = ms.pop()
        b = copy.deepcopy(self)
        
        games = 0
        moves_sum = 0
        max_wins = 0
        while moves_sum<moves_per_choice:
            new_board = copy.deepcopy(b)
            moves_sum += new_board.random_game(1-player)
            if new_board.check_result(player)==player:
                max_wins+=1
            games+=1

        
        for m in ms:
            wins = 0
            b = copy.deepcopy(self)
            b.do_move(m,player)
            for i in range(games):
                new_board = copy.deepcopy(b)
                new_board.random_game(1-player)
                if new_board.check_result(player)==player:
                    wins+=1
            #print("wins: ",wins, "games: ", games)        
            if wins>max_wins:
                max_wins = wins
                best_move = m

        
        #print("Best:",best_move)
        self.do_move(best_move,player)


class Agent:

    def agent_move(self,board, player):
        #print(F.vals[29])
        move_list = board.moves(player)
        #print(move_list)

        depth = 3
    
        if player==0:
            max_eval = -float("inf")
            best_move = 0
            for x in move_list:
                board.do_move(x,player)
                if board.game_over(player):
                    best_move = x
                    board.undo()
                    break
                eval_move = self.alpha_beta(board, depth, float("inf"), -float("inf"), 1-player)
                if eval_move > max_eval:
                    best_move = x
                    max_eval = eval_move
                board.undo()
        else:
            min_eval = float("inf")
            best_move = 0
            for x in move_list:
                #print(x)
                board.do_move(x,player)
                if board.game_over(player):
                    best_move = x
                    board.undo()
                    break
                #board.draw()
                eval_move = self.alpha_beta(board, depth, float("inf"), -float("inf"), 1-player)
                if eval_move < min_eval:
                    best_move = x
                    min_eval = eval_move
                board.undo()
                #print("Undo")
                #board.draw()
        
        return best_move

    

    def dist(self,board):
        white_sum = sum(board.pieces[0].values())
        black_sum = sum(board.pieces[1].values())

        white_res = 0

        for piece in board.pos[0]:
            if piece!='E':
                white_res+=(2*abs(board.pos[0][piece][0]-8)+abs(board.pos[0][piece][1]-3))*board.pieces[0][piece]
            else:
                white_res+=(2*abs(board.pos[0][piece][0]-3)+abs(board.pos[0][piece][1]-3))*board.pieces[0][piece]

        white_res/=white_sum

        black_res = 0

        for piece in board.pos[1]:
            if piece!='e':
                black_res+=(2*abs(board.pos[1][piece][0]-0)+abs(board.pos[1][piece][1]-3))*board.pieces[1][piece]
            else:
                white_res+=(2*abs(board.pos[1][piece][0]-3)+abs(board.pos[1][piece][1]-3))*board.pieces[1][piece]

        black_res/=black_sum

        return black_res-white_res
    


    def pieces_balance(self,board):
        return sum(board.pieces[0].values())-sum(board.pieces[1].values())

    
    def cave(self,board):
        if board.board[0][3][1]!='x':
            return -float("inf")
        elif board.board[8][3][1]!='x':
            return float("inf")
        else:
            return 0
    
        

    def heuristic(self,board,player):
        return 100*self.pieces_balance(board)+self.cave(board)+5*self.dist(board)

    def alpha_beta(self,board, depth, alpha, beta, player):
        #print("aB")
        #board.draw()
        if depth == 0 or board.game_over(player):
            return self.heuristic(board, player)
        #print(depth)
        if player == 0:
            max_eval = -float("inf")
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
        self.game = Jungle()
        self.my_player = 0
        self.agent = Agent()
        self.say('RDY')

    def say(self, what):
        sys.stdout.write(what)
        sys.stdout.write('\n')
        sys.stdout.flush()

    def hear(self):
        line = sys.stdin.readline().split()
        return line[0], line[1:]

    def convert(self,move):

        if move!=None:
            piece = move[0]
            yd = move[1]
            xd = move[2]
            if piece in self.game.pos[0]:
                ys = self.game.pos[0][piece][0]
                xs = self.game.pos[0][piece][1]
            else:
                ys = self.game.pos[1][piece][0]
                xs = self.game.pos[1][piece][1]
            return (xs,ys,xd,yd)

        return None

    def convert2(self,move):
        if move!=None:
            return (self.game.board[move[1]][move[0]][1],move[3],move[2])
        else:
            return None

    def loop(self):
        while True:
            cmd, args = self.hear()
            if cmd == 'HEDID':
                unused_move_timeout, unused_game_timeout = args[:2]
                move = tuple((int(m) for m in args[2:]))
                print(move)
                if move == (-1, -1, -1, -1):
                    move = None
                move2 = self.convert2(move)
                print(move2)
                if move2!=None:
                    self.game.do_move(move2, 1 - self.my_player)
                self.game.draw()
                print()
                print(self.my_player)
            elif cmd == 'ONEMORE':
                self.reset()
                continue
            elif cmd == 'BYE':
                break
            else:
                assert cmd == 'UGO'
                assert not self.game.history
                self.my_player = 1

            move = self.agent.agent_move(self.game,self.my_player)

            print_move = self.convert(move)
            self.game.do_move(move,self.my_player)
            print(move,print_move)
            if move == None:
                self.say('IDO -1 -1 -1 -1')
            else:
                self.say('IDO %d %d %d %d' % print_move)


if __name__ == '__main__':
    player = Player()
    player.loop()



