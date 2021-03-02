
from itertools import permutations

def rot_y(cube):
    (U, D, L, F, R, B) = cube
    return (U, D, B, L, F, R)

def rot_x(cube):
    (U, D, L, F, R, B) = cube
    return (F, B, L, D, R, U)

def rot_z(cube):
    (U, D, L, F, R, B) = cube
    return (L, R, D, F, U, B)

def rotations(cube):
    res = set()

    for _ in range(4):
        for _ in range(4):
            cube = rot_y(cube)
            res.add(cube)
        cube = rot_x(cube)

    cube = rot_z(cube)
    for _ in range(4):
            cube = rot_y(cube)
            res.add(cube)

    cube = rot_z(cube)
    cube = rot_z(cube)

    for _ in range(4):
            cube = rot_y(cube)
            res.add(cube)

    l = list(res)
    l.sort()
    l = list(map(lambda x : ''.join(x),l))
    return str(l)

if __name__=="__main__":
    gems = input()
    d = {}
    for g in gems:
        if g in d.keys():
            d[g]+=1
        else:
            d[g] = 1
    
    s = set(rotations(perm) for perm in permutations(gems))
    print(len(s))
