from language import *
from parser import *

def nat_to_lambda(n):
    app = Var("z")

    for _ in range(n):
        app = App(Var("s"), app)

    return Lambda("s", (Lambda("z", app)))

def desugar(term: Term):
    if isinstance(term, Var):
        return term
    elif isinstance(term, Lambda):
        return Lambda(term.var, desugar(term.t))
    elif isinstance(term, App):
        return App(desugar(term.t1), desugar(term.t2))
    elif isinstance(term, Nat):
        return nat_to_lambda(term.n)
    elif isinstance(term, Add):
        add = parse_term("lambda m. lambda n. lambda s. lambda z. m s (n s z)")
        return App(App(add, desugar(term.n)), desugar(term.m))
    elif isinstance(term, Mul):
        plus = "(lambda m. lambda n. lambda s. lambda z. m s (n s z))"
        times = parse_term(f"lambda m. lambda n. m ({plus} n) (lambda s. lambda n. n)")
        return App(App (times, desugar(term.n)), desugar(term.m))
    elif isinstance(term, Sub):
        zz = Pair(Nat(0), Nat(0))
        ss = Lambda("p", Pair(Snd(Var("p")), Add(Nat(1), Snd(Var("p")))))
        prd = Lambda("m", Fst(App(App(Var("m"), ss), zz)))
        return desugar(Lambda("m", Lambda("n", App(App(Var("n"), prd), Var("m")))))
    elif isinstance(term, Eq):
        isZero = parse_term("lambda n. n (lambda x. false) true")
        leq = Lambda("m", Lambda("n", App(isZero, Sub(Var("m"), Var("n")))))
        lambda_and = parse_term("lambda p. lambda q. p q p")
        m_leq_n = App(App(leq, Var("m")), Var("n"))
        n_leq_m = App(App(leq, Var("n")), Var("m"))
        return Lambda("m", Lambda("n", App(App(lambda_and, m_leq_n), n_leq_m)))
    elif isinstance(term, Tru):
        return Lambda("t", (Lambda("f", Var("t"))))
    elif isinstance(term, Fls):
        return Lambda("t", (Lambda("f", Var("f"))))
    elif isinstance(term, If):
        return App(App(desugar(term.cond), desugar(term.if_true)), desugar(term.if_false))
    elif isinstance(term, Fix):
        fix = parse_term("lambda f. (lambda x. f (lambda y. x x y)) (lambda x. f (lambda y. x x y))")
        return App(fix, desugar(term.f))
    elif isinstance(term, Pair):
        pair =  parse_term("lambda f. lambda s. lambda b. b f s")
        return App(App(pair, desugar(term.first)), desugar(term.second))
    elif isinstance(term, Fst):
        fst = Lambda("p", App(Var("p"), Lambda("t", (Lambda("f", Var("t"))))))
        return App(fst, desugar(term.pair))
    elif isinstance(term, Snd):
        snd = Lambda("p", App(Var("p"), Lambda("t", (Lambda("f", Var("f"))))))
        return App(snd, desugar(term.pair))
    elif isinstance(term, Nil):
        return parse_term("lambda c. lambda n. n")
    elif isinstance(term, Cons):
        cons = parse_term("lambda h. lambda t. lambda c. lambda n. c h (t c n)")
        return App(App(cons, desugar(term.head)), desugar(term.tail))
    elif isinstance(term, Head):
        head = parse_term("lambda l. l (lambda h. lambda t. h) (lambda t. lambda f. f)")
        return desugar(App(head, term.list))
    elif isinstance(term, Tail):
        tru = "(lambda t. lambda f. t)"
        fls = "(lambda t. lambda f. f)"

        pair = "(lambda f. lambda s. lambda b. b f s)"
        fst = f"(lambda p. p {tru})"
        snd = f"(lambda p. p {fls})"

        tail = parse_term(f"lambda l. {fst} (l (lambda x. lambda p. pair ({snd} p) (cons x ({snd} p))) ({pair} nil nil))")

        return desugar(App(tail, term.list))

    elif isinstance(term, IsNil):
        tru = "(lambda t. lambda f. t)"
        fls = "(lambda t. lambda f. f)"

        isnil = parse_term(f"lambda l. l (lambda h. lambda t. {fls}) {tru}")
        return App(isnil, desugar(term.list))


def normal_to_deBruijn(term: Term):
    free_vars = {}

    def convert(t: Term, bound_vars):
        if t.is_var():
            try:
                return Var(bound_vars.index(t.var))
            except:
                if t.var not in free_vars:
                    free_var_index = len(free_vars)
                    free_vars[t.var] = free_var_index
                return Var(free_vars[t.var] + len(bound_vars))
        elif t.is_app():
            return App(convert(t.t1, bound_vars), convert(t.t2, bound_vars))
        elif t.is_lambda():
            return Lambda(t.var, convert(t.t, [t.var] + bound_vars))

    return convert(term, []), list(free_vars.keys())


def deBruijn_to_normal(term, free_vars):
    def convert(t: Term, bound_vars):
        if t.is_var():
            if len(bound_vars) > t.var:
                return Var(bound_vars[t.var])
            else:
                return Var(free_vars[t.var - len(bound_vars)])
        elif t.is_app():
            return App(convert(t.t1, bound_vars), convert(t.t2, bound_vars))
        elif t.is_lambda():
            return Lambda(t.var, convert(t.t, [t.var] + bound_vars))

    return convert(term, [])

def restore_free_vars(term, free_vars):
    def convert(t: Term, bound_vars):
        if t.is_var():
            if len(bound_vars) > t.var:
                return t
            else:
                return Var(free_vars[t.var - len(bound_vars)])
        elif t.is_app():
            return App(convert(t.t1, bound_vars), convert(t.t2, bound_vars))
        elif t.is_lambda():
            return Lambda(t.var, convert(t.t, [t.var] + bound_vars))

    return convert(term, [])


def parse_term_to_deBruijn(term_str: str):
    term = parse_term(term_str)
    desugared_term = desugar(term)
    return normal_to_deBruijn(desugared_term)
