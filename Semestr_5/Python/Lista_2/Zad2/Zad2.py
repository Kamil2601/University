def increment(vars):
        for k in vars.keys():
            if vars[k] == True:
                vars[k] = False
            else:
                vars[k] = True
                return

class Formula:
    def __init__(self):
        ...

    def calculate(self, variables):
        ...

    def variables(self):
        ...

    def  is_tautology(self):
        vars = {var : False for var in self.variables()}
        n = 2**len(vars)
        for i in range(n):
            if self.calculate(vars) == False:
                return False

            increment(vars)

        return True


    def __str__(self):
        ...

class True_ (Formula):
    def __init__(self):
        ...

    def calculate(self, variables):
        return True

    def variables(self):
        return set()

    def __str__(self):
        return "True"

class False_ (Formula):
    def __init__(self):
        ...

    def calculate(self, variables):
        return False

    def variables(self):
        return set()

    def __str__(self):
        return "False"

class Variable (Formula):
    def __init__(self, symbol):
        self.symbol = symbol

    def calculate(self, variables):
        return variables[self.symbol] if self.symbol in variables.keys() else  None

    def variables(self):
        return {self.symbol}

    def __str__(self):
        return self.symbol

class Not (Formula):
    def __init__(self, formula):
        self.formula = formula

    def calculate(self, variables):
        subform_value = self.formula.calculate(variables)
        return None if subform_value == None else not subform_value

    def variables(self):
        return self.formula.variables()

    def __str__(self):
        if type(self.formula) in [True_, False_, Variable]:
            return "~" + self.formula.__str__()
        else:
            return "~(" + self.formula.__str__() + ")"

class Binary_Operator (Formula):
    def __init__(self, left, right):
        self.left = left
        self.right = right

    def calculate(self, variables):
        ...  

    def variables(self):
        return self.left.variables().union(self.right.variables())  

    def __str__(self, operator):
        left_str = self.left.__str__()
        right_str = self.right.__str__()

        if type(self.left) not in [True_, False_, Variable]:
            left_str = "(" + left_str + ")"

        if type(self.right) not in [True_, False_, Variable]:
            right_str = "(" + right_str + ")"

        return left_str + " " + operator + " " + right_str


class And(Binary_Operator): 
    def calculate(self, variables):
        left_val = self.left.calculate(variables)
        right_val = self.right.calculate(variables)

        if right_val == None:
            left_val, right_val = right_val, left_val

        if left_val == None and right_val == False:
            return False
        else:
            return left_val and right_val

    def __str__(self):
        return super(And,self).__str__("^")

class Or(Binary_Operator):
    def calculate(self, variables):
        left_val = self.left.calculate(variables)
        right_val = self.right.calculate(variables)

        if right_val == None:
            left_val, right_val = right_val, left_val

        if left_val == None and right_val == True:
            return True
        else:
            return left_val or right_val

    def __str__(self):
        return super(Or,self).__str__("v")

class Implication (Binary_Operator):
    def calculate(self, variables):
        left_val = self.left.calculate(variables)
        right_val = self.right.calculate(variables)

        if right_val == True:
            return True
        elif left_val == False:
            return True
        elif left_val == None and right_val in [False, None]:
            return None
        elif left_val == True and right_val == None:
            return None
        else:
            return False
    
    def __str__(self):
        return super(Implication,self).__str__("=>")

class Equivalence (Binary_Operator):
    def calculate(self, variables):
        left_val = self.left.calculate(variables)
        right_val = self.right.calculate(variables)

        if left_val == None or right_val == None:
            return None
        else:
            return left_val == right_val

    def __str__(self):
        return super(Equivalence,self).__str__("<=>")


x = And(True_(), Variable("b"))
print(x)
print(x.calculate({'b' : True}))
print(x.is_tautology())

print()

y = And(Implication(Variable("x"), Variable("x")), Or(False_(),Variable("x")))
print(y)
print(y.calculate({'x' : True}))
print(y.is_tautology())

print()

x = Equivalence(And(Variable("x"), Variable("y")), Or(Variable("x"), Variable("y")))
print(x)
print(x.calculate({'x' : True, 'y' : True}))
print(x.is_tautology())

print()

x = Implication(Variable('x'), And(Variable('x'), Variable('x')))
print(x)
print(x.calculate({'x' : True}), " ", x.calculate({'x' : False}))
print(x.is_tautology())

print()

x = Variable('x')
print(x.calculate({}))
