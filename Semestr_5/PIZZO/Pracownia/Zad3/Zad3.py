import json
from z3 import *
import string

nmeals = 5

def var(i,j):
    return Int("x_{}_{}".format(i,j))

def add_vars(solver, n):
    for i in range(n):
        for j in range(nmeals):
            new_var = var(i,j)
            solver.add(new_var >= 0.0)

def add_conflicts(solver, ingr_num, conflicts):
    for (x,y) in conflicts:
        for j in range(nmeals):
            solver.add(Or(var(ingr_num[x],j)==0, var(ingr_num[y],j)==0))

def add_nonempty(solver, n):
    for j in range(nmeals):
        solver.add(Sum([var(i,j) for i in range(n)]) > 0)

def add_target(solver, target, ingredients, ingr_num):
    for t in target.keys():
        min_ = float(target[t]['min'])
        max_ = float(target[t]['max'])
        sum_list = [ToReal(var(ingr_num[i["nazwa"]], j)) * i[t]
                    for i in ingredients for j in range(nmeals)]
        solver.add(Sum(sum_list) >= min_)
        solver.add(Sum(sum_list) <= max_)

def print_meal(meal, food):
    food_string = "".join(map(lambda x : (str(x)+", ")*food[x], food))[:-2]
    print("{}: {}".format(meal,food_string))

def main():
    path = input()
    f = open(path, "r")
    problem = json.loads(f.read())

    parameters = problem["parametry"]
    ingredients = problem["składniki"]
    conflicts = [(c["nazwa1"], c["nazwa2"]) for c in problem["konflikty"]]
    target = problem["cel"]

    meals = ["śniadanie", "lunch", "obiad", "podwieczorek", "kolacja"]
    meal_num = {"śniadanie" : 0, "lunch" : 1, "obiad" : 2, "podwieczorek" : 3, "kolacja" : 4}
    ingr = [i["nazwa"] for i in ingredients]
    ingr_num = {ingr[i] : i for i in range(len(ingr))}

    solver = Solver()

    add_vars(solver, len(ingr))

    add_conflicts(solver, ingr_num, conflicts)
    
    add_nonempty(solver, len(ingr))

    add_target(solver, target, ingredients, ingr_num)

    c = solver.check()

    if (c == unsat):
        print("Nie można wygenerować diety.")
    else:
        model = solver.model()
        for j in range(nmeals):
            to_eat = {}
            for i in ingredients:
                val = model.evaluate(var(ingr_num[i["nazwa"]],j))
                if val.as_long()>0:
                    to_eat[i["nazwa"]] = val.as_long()
            print_meal(meals[j], to_eat)                

if __name__=="__main__":
    main()