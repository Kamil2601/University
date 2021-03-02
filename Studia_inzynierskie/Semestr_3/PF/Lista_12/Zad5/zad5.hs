data RegExpr a = Void | Symbol a | Closure (RegExpr a) | Concat (RegExpr a) (RegExpr a) | Plus (RegExpr a) (RegExpr a) | Group (RegExpr a)
    deriving(Show)

class Monad m => Nondet m where
    amb :: m a -> m a -> m a
    fail :: m a

expr = Concat (Symbol 'a') (Symbol 'b')


match :: Nondet m => RegExpr -> String -> m ()