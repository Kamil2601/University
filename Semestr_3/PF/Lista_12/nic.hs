newtype Funkcja a b = F {g:: a -> b}

instance Functor (Funkcja a b) where
    fmap f a