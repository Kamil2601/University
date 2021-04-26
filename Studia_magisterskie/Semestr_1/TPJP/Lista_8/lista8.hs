{-# LANGUAGE RankNTypes #-}

-- Zadanie 1

newtype BTCh beta = BTCh  {btIt ::  forall alfa. (beta -> alfa -> alfa -> alfa) -> alfa -> alfa}

instance Show beta => Show (BTCh beta)  where
    show tCh = btIt tCh (\x l r -> "Node " ++ show x ++ " (" ++ l ++ ") ("++ r ++ ")") "TipCh"

nilCh :: BTCh b
nilCh = BTCh $ \y1 y2 -> y2

nodeCh :: b -> BTCh b -> BTCh b -> BTCh b
nodeCh x l r = BTCh $ \y1 y2 -> y1 x (btIt l y1 y2) (btIt r y1 y2)

t1 = nodeCh 1 nilCh nilCh
t2 = nodeCh 2 t1 t1
t3 = nodeCh 3 t1 t2

-- Zadanie 3