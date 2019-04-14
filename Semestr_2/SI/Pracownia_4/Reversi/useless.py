class Field_value:

    def __init__(self):
        self.vals = [[[0 for i in range(8)] for j in range(8)] for k in range(64)]

        for i in range(10000):
            board = Board()
            player = 0
            while True:
                m = board.random_move(player)
                board.do_move(m, player)
                player = 1-player
                if board.terminal():
                    break
            #print(board.move_list)
            res = board.result()
            if res<0:
                for j in range(len(board.move_list)):
                    if board.move_list[j]==None:
                        break
                    x,y = board.move_list[j]
                    if j%2==0:
                        self.vals[j][y][x]+=0.1
                    else:
                        self.vals[j][y][x]-=0.1
            elif res>0:
                for j in range(len(board.move_list)):
                    if board.move_list[j]==None:
                        break
                    x,y = board.move_list[j]
                    if j%2==0:
                        self.vals[j][y][x]-=0.1
                    else:
                        self.vals[j][y][x]+=0.1


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