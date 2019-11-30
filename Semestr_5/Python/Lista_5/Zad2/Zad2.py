from itertools import permutations


def convert(text,values):
    length = len(text)
    result = 0
    power = 1
    for i in range(length-1,-1,-1):
        result += power*values[text[i]]
        power*=10

    return result

def assign(letters,values):
    keys = list(letters.keys())
    length = len(values)
    for i in range(length):
        letters[keys[i]] = values[i]

def solve(n_string,m_string,sum_string):
    letters = {l : -1 for l in set(n_string+m_string+sum_string)}
    for i in permutations(range(10),len(letters)):
        assign(letters,i)
        if (letters[sum_string[0]]>0):
            n = convert(n_string,letters)
            m = convert(m_string,letters)
            sum_ = convert(sum_string,letters)
            if (n+m==sum_):
                return (letters,n,m,sum_)

    return None


def print_result(n_string,m_string,sum_string):
    print("------------------------------------")
    (d,n,m,sum_) = solve(n_string,m_string,sum_string)
    space_n = (len(sum_string)-len(n_string)+2)*" "
    space_m = (len(sum_string)-len(m_string))*" " + "+ "
    print(d)
    print(space_n,n_string,"      ",space_n,n)
    print(space_m,m_string,"   => ",space_m,m)
    print("  ",len(sum_string)*"-","         ",len(sum_string)*"-")
    print("  ",sum_string,"         ",sum_)
    


print_result("AA","BC","DCE")
print_result("a","a","b")
print_result("KIOTO","OSAKA","TOKIO")
print_result("AB","AB","CBB")