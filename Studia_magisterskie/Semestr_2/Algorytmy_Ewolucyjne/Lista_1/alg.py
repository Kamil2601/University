import random
import numpy as np


def binary_random(p):
    if random.random() < p:
        return 1
    else:
        return 0

def initial_probability_vector(length):
    return [0] + list(0.5 for i in range(length))

def random_individual(p):
    return [0] + [binary_random(x) for x in p]

def random_population(p, N):
    return [random_individual(p) for _ in range(N)]

def population_evaluation(P, F):
    for c in P:
        c[0] = F(c[1:])

def best_individual(P):
    index = np.argmax(list(map((lambda x: x[0]), P)))
    return P[index]

def population_based_incremental_learning(F, N, length, iterations, learning_ratio, mutation_prob, disturbance_factor):
    p = initial_probability_vector(length)
    P = random_population(p, N)
    populations = []
    population_evaluation(P, F)

    for i in range(iterations):
        best = best_individual(P)

        for k in range(1, length+1):
            p[k] = p[k] * (1-learning_ratio) + best[k] * learning_ratio

        for k in range(1, length+1):
            if (random.random() < mutation_prob):
                p[k] = p[k] * (1 - disturbance_factor) + binary_random(0.5) * disturbance_factor

        populations.append(P)

        
        P = random_population(p, N)
        population_evaluation(P, F)



    return populations


def one_max(p):
    return sum(p)

def deceptive_one_max(p):
    if sum(p) == 0: return len(p)+1
    else: return sum(p)

def k_deceptive_one_max(breaks, p):
    breaks = [0] + breaks + [len(p)]

    res = 0

    for i in range(1,len(breaks)):
        res += deceptive_one_max(p[breaks[i-1]: breaks[i]])

    return res

#                                             F, N, length, iterations, learning_ratio, mutation_prob, disturbance_factor
p = population_based_incremental_learning(one_max, 100, 100, 100, 0.01, 0.05, 0.01)