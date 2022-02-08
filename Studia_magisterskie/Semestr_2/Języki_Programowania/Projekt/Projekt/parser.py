import re
from language import *

def is_var(token):
    return re.match("^[a-z]+$", token)


def is_nat(token):
    return re.match("^\d+$", token)


def is_lambda(token):
    return re.match("^lambda [a-z]+[.]$", token)


def is_term(token):
    return isinstance(token, Term)


def lambda_var(token):
    return token[7:-1]

def tail(xs):
    if len(xs) == 0:
        return []
    return xs[1:]

def parse_brackets(tokens):
    stack = []
    for token in tokens:
        if token == ")":
            error = True
            for i in range(len(stack) - 1, -1, -1):
                if stack[i] == "(":
                    error = False
                    stack = stack[:i] + [stack[i + 1 :]]
                    break
            if error:
                raise Exception("Parse error")
        else:
            stack.append(token)

    if "(" in stack:
        raise Exception("Parse error")

    def remove_brackets(xs):
        while len(xs) == 1 and not isinstance(xs, str):
            xs = xs[0]

        if isinstance(xs, str):
            return xs
        return [remove_brackets(x) for x in xs]

    return remove_brackets(stack)


def parse_term(term_str: str):
    term_str = " ".join(term_str.split())

    regex = "lambda [a-z]+[.]|[a-z]+|\d+|[(]|[)]"

    tokens = re.findall(regex, term_str)

    tokens = parse_brackets(tokens)

    term, list_tail = parse([tokens])

    return term

def terms_strings(text):
    res = []
    for term_str in text.split(";"):
        t_str = " ".join(term_str.split())
        
        if len(t_str) > 0:
            res.append(t_str)

    return res


def parse(tokens):
    try:
        hd = tokens[0]
    except:
        raise Exception("Parse error")
    if isinstance(hd, list):
        term, l = parse(hd)

        while l != []:
            t, l = parse(l)
            term = App(term, t)

        return term, tail(tokens)

    if is_lambda(hd):
        var = lambda_var(hd)
        term, l = parse(tail(tokens))

        while l != []:
            t, l = parse(l)
            term = App(term, t)

        return Lambda(var, term), l

    elif hd in ['add', 'mul', 'sub', 'eq', 'cons', 'pair']:
        t1, l1 = parse(tail(tokens))
        t2, l2 = parse(l1)

        if hd == 'add':
            return Add(t1, t2), l2
        elif hd == 'mul':
            return Mul(t1,t2), l2
        elif hd == 'sub':
            return Sub(t1,t2), l2
        elif hd == 'eq':
            return Eq(t1,t2), l2
        elif hd == 'cons':
            return Cons(t1,t2), l2
        elif hd == 'pair':
            return Pair(t1,t2), l2
    
    elif hd == "if":
        t1, l1 = parse(tail(tokens))
        t2, l2 = parse(l1)
        t3, l3 = parse(l2)

        return If(t1,t2,t3), l3

    elif hd == "true":
        return Tru(), tail(tokens)
    elif hd == "false":
        return Fls(), tail(tokens)
    elif hd == "nil":
        return Nil(), tail(tokens)

    elif hd in ["fst", "snd", "head", "tail", "isnil", "fix"]:
        t, l = parse(tail(tokens))

        if hd == "fst":
            return Fst(t), l
        elif hd == "snd":
            return Snd(t), l
        elif hd == "head":
            return Head(t), l
        elif hd == "tail":
            return Tail(t), l
        elif hd == "isnil":
            return IsNil(t), l
        elif hd == "fix":
            return Fix(t), l

    elif is_var(hd):
        return Var(hd), tail(tokens)
    elif is_nat(hd):
        return Nat(hd), tail(tokens)
