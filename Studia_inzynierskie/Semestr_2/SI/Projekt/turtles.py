import random
import copy


cards = [('B',1),('B',1),('B',1),('B',1),('B',2),('B',-1),('B',-1),('B',2),('G',1),('G',1),('G',1),('G',1),('G',1),('G',-1),('G',-1),('G',2),('R',1),('R',1),('R',1),('R',1),('R',1),('R',-1),('R',-1),('R',2),('V',1),('V',1),('V',1),('V',1),('V',1),('V',-1),('V',-1),('V',2),('Y',1),('Y',1),('Y',1),('Y',1),('Y',1),('Y',-1),('Y',-1),('Y',2),('#',1),('#',1),('#',1),('#',1),('#',1),('#',-1),('#',-1),('S',2),('S',2),('S',1),('S',1),('S',1)]

class Game:

    def __init__(self,players):
        self.turtles = { 'B':(0,0), 'R':(0,0), 'G':(0,0), 'V':(0,0), 'Y':(0,0)}
        self.player_turtles = []
        self.players = players
        turt = ['B','R','G','V','Y']
        for i in range(players):
            x = random.randint(0,4-i)
            self.player_turtles.append(turt.pop(x))
        self.history = []
        self.unused_cards = copy.deepcopy(cards)
        random.shuffle(self.unused_cards)
        self.used_cards = []
        #self.used_cars = []
        self.hands = self.deal_cards()

    def deal_cards(self):
        res = [[] for i in range(self.players)]

        for j in range(5):
            for i in range(self.players):
                res[i].append(self.unused_cards.pop(0))
        return res

    def move_turtle(self,move):
        turtle,move = move
        field,floor = self.turtles[turtle]
        target_field = field+move
        if target_field==10:
            target_field=9
        target_floor = 0
        for t in self.turtles.values():
            if t[0] == target_field:
                target_floor+=1 

        if field>0:
            for t in self.turtles:
                fi,fl = self.turtles[t]
                if fi==field and fl>=floor:
                    if target_field>0:
                        self.turtles[t] = (target_field,fl-floor+target_floor)
                    else:
                        self.turtles[t] = (target_field,0)
        else:
            self.turtles[turtle]=(target_field,target_floor if target_field>0 else 0)

    def do_move(self,pair,player,show):
        move,card = pair
        if show:
            print (player,move,card)
        turtles = self.find(self.turtles[move[0]])
        self.history.append((player,move,card,turtles))
        self.move_turtle(move)
        self.change_hand(player,card)

    def find(self,place):
        field,floor = place
        res = []

        for t in self.turtles:
            if self.turtles[t][0]==field and self.turtles[t][1]>=floor:
                res.append(t)

        return tuple(res)

    def find_slowest(self):

        min_val = 10

        for v in self.turtles.values():
            if v[0]<min_val:
                min_val = v[0]

        res = []

        for t in self.turtles:
            if self.turtles[t][0]==min_val:
                res.append(t)
        return res

    def change_hand(self,player,card):
        self.hands[player].remove(card)
        self.used_cards.append(card)
        if self.unused_cards:
            c = self.unused_cards.pop()
            self.hands[player].append(c)
        else:
            self.unused_cards = copy.deepcopy(self.used_cards)
            self.used_cards = []
            random.shuffle(self.unused_cards)
            c = self.unused_cards.pop()
            self.hands[player].append(c)

    def game_over(self):
        for v in self.turtles.values():
            if v[0]==9:
                return True
        return False

    def check_result(self):
        result = sorted(G.turtles, key = G.turtles.__getitem__, reverse = True)

        for t in result:
            for i in range(len(self.player_turtles)):
                if self.player_turtles[i]==t:
                    return i

    def random_move(self,player,show):
        #print(self.hands[player])
        #print(self.turtles)
        move_list = self.moves(player)
        if move_list!=[]:
            move = random.choice(move_list)
            self.do_move(move,player,show)
        else:
            card = random.choice(self.hands[player])
            if card[0]=='S':
                turt = random.choice(self.find_slowest())
                move = ((turt,0),card)
            elif card[0]=='#':
                turt = random.choice(self.turtles)
                move = ((turt,0),card)
            else:
                move = ((card[0],0),card)
            self.do_move(move,player,show)

    def moves(self,player):
        moves = []
        for card in self.hands[player]:
            if card[0] in self.turtles:
                if self.turtles[card[0]][0]>0 or card[1]>0:
                    moves.append((card,card))
            elif card[0]=='#':
                for t in self.turtles:
                    move = (t,card[1])
                    if self.turtles[t][0]>0 or card[1]>0:
                        moves.append((move,card))
            else:
                slowest = self.find_slowest()
                for t in slowest:
                    move = (t,card[1])
                    if self.turtles[t][0]>0 or card[1]>0:
                        moves.append((move,card))

        return moves

    def random_game(self,player):
        p = player
        #print("Player",player)
        #print(self.hands)
        self.new_cards((player+self.players-1)%self.players)
        #print(self.hands)
        while self.game_over()==False:
            #print(self.hands)
            self.random_move(p,False)
            p=(p+1)%self.players

        return self.check_result()

    def new_cards(self,player):
        for i in range(self.players):
            if i!=player:
                self.unused_cards+=self.hands[player]
                self.hands[i]=[]
                #print(self.unused_cards,self.hands[player])
        random.shuffle(self.unused_cards)
        for i in range(5):
            for j in range(self.players):
                if j!=player:
                    self.hands[j].append(self.unused_cards.pop(0))
        #print(self.hands)


    def draw(self):
        for i in range(10):
            turt = []
            for j in range(5):
                for t in self.turtles:
                    if self.turtles[t] == (i,j):
                        turt.append(t)
            print (i,turt)


class Greedy_Agent:
    def agent_move(self,board,player):
        move_list = board.moves(player)
        
        move = self.find_best(move_list,board)

        board.do_move(move,player,True)

    def find_best(self,moves,board):
        
        best_move = 0
        turt = board.player_turtles[player]
        temp_dict = {'#':1,turt:2,'S':3}
        for m in moves:
            if m[0][0]==turt and best_move == 0 and m[0][1]>0:
                best_move = m
            elif m[0][0]==turt and best_move != 0 and m[0][1]>best_move[0][1]:
                best_move = m
            elif m[0][0]==turt and best_move != 0 and m[0][1]==best_move[0][1] and temp_dict[best_move[1][0]] < temp_dict[m[1][0]]:
                best_move = m

        if best_move == 0:
            best_move = random.choice(moves)

        return best_move

class Random_Agent:
    def agent_move(self,board,player):
        move_list = board.moves(player)
        best_move = 0
        max_wins = -1
        for m in move_list:
            wins = 0
            for i in range(100):
                new_board = copy.deepcopy(board)
                new_board.do_move(m,player,False)
                res = new_board.random_game((player+1)%new_board.players)
                if res==player:
                    wins+=1
            if wins>max_wins:
                max_wins = wins
                best_move = m
        board.do_move(best_move,player,True)

class Clever_Agent:
    def agent_move(self,board,player):
        move_list = board.moves(player)
        move = self.find_best(move_list,board,player)
        board.do_move(move,player,True)

    def check_history(self,board):
        forward = [{'B':0,'G':0,'R':0,'V':0,'Y':0} for i in range(board.players)]
        backward = [{'B':0,'G':0,'R':0,'V':0,'Y':0} for i in range(board.players)]

        for p in board.history:
            player,move,card,turtles = p
            for t in turtles:
                if move[1]>0:
                    forward[player][t]+=1
                else:
                    backward[player][t]+=1
        return (forward,backward)

    def moves_sum(self,moves,my_turtle):
        res = 0
        for t in moves:
            if t!=my_turtle:
                res+=moves[t]
        return res 


    def find_best(self,moves,board, player):
        forward,backward = self.check_history(board)
        my_turtle = board.player_turtles[player]
        self.turtles_pred = [{'B':0,'G':0,'R':0,'V':0,'Y':0} for i in range(board.players)]
        self.turtles_pred[player][my_turtle]=1
        for i in range(board.players):
            if i != player:
                s = self.moves_sum(forward[0],my_turtle)
                for t in self.turtles_pred[i]:
                    if t!=my_turtle:
                        if s!=0:
                            self.turtles_pred[i][t]=float(forward[i][t])/float(s)
                        else:
                            self.turtles_pred[i][t]=0.25

        best_move = 0
        

        for m in moves:
            if self.win(board,m,my_turtle,player):
                return m
            elif best_move == 0:
                best_move = m
            elif self.is_better(m,best_move,board,player):
                best_move = m

        return best_move

    def win(self,b,move,my_turtle,player):
        board = copy.deepcopy(b)
        board.do_move(move,player,False)
        if board.turtles[my_turtle]!=9:
            return False
        
        for t in board.turtles:
            if board.turtles[t][0]==9 and board.turtles[t][1]>board.turtles[my_turtle][1]:
                return False

        return True

    def find_faster(self,board,my_turtle):
        res = 0
        for t in board.turtles:
            if board.turtles[t][0]>board.turtles[my_turtle][0]:
                res+=1
            elif board.turtles[t][0]==board.turtles[my_turtle][0] and board.turtles[t][1]>board.turtles[my_turtle][1]:
                res+=1

        return res

    def is_better(self,m1,m2,board,player):
        b1 = copy.deepcopy(board)
        b1.do_move(m1,player,False)

        b2 = copy.deepcopy(board)
        b2.do_move(m2,player,False)
        next_player = (player+1)%b1.players
        my_turtle = b1.player_turtles[player]

        for t in b1.turtles:
            if b1.turtles[t][0]==9:
                return False


        chance_1 = 0
        chance_2 = 0
        for t in b1.turtles:
            if b1.turtles[t][0]==8:
                chance_1+=self.turtles_pred[next_player][t]
            elif b1.turtles[t][0]==7:
                chance_1+=(self.turtles_pred[next_player][t]/5.0)

        for t in b2.turtles:
            if b2.turtles[t][0]==8:
                chance_1+=self.turtles_pred[next_player][t]
            elif b2.turtles[t][0]==7:
                chance_1+=(self.turtles_pred[next_player][t]/5.0)

        if chance_1<chance_2:
            return True
        elif chance_1>chance_2:
            return False

        f1 = self.find_faster(b1,my_turtle)
        f2 = self.find_faster(b2,my_turtle)

        if f2<f1:
            return False
        elif f1<f2:
            return True
        elif f1==f2 and b1.turtles[my_turtle][1]>b2.turtles[my_turtle][1]:
            return True

        if b1.turtles[my_turtle][0]>b2.turtles[my_turtle][0]:
            return True
        else:
            return False




A1 = Greedy_Agent()
A2 = Clever_Agent()
A3 = Random_Agent()

wins = [0,0,0]

for i in range(10):
    G = Game(3)
    print(G.player_turtles)
    #input()
    #G.draw()
    player = 0
    while G.game_over() == False:
        if player==1:
            A1.agent_move(G,player)
        elif player==0:
            A2.agent_move(G,player)
        else:
            A3.agent_move(G,player)
        G.draw()
        input()
        player = (player+1)%G.players

    wins[G.check_result()]+=1


print (wins)




