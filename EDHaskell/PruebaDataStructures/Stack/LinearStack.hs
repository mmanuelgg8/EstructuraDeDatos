module DataStuctures.Stack.LinearStack
             (   Stack
               , empty
               , isEmpty
               , top
               , pop
               , push) where
data Stack a = Empty | Node a (Stack a) deriving (Eq, Show)

empty :: Stack a
empty = Empty

isEmpty :: Stack a -> Bool
isEmpty Empty = True
isEmpty _ = False

top :: Stack a -> a
top Empty = error "Stack vacio"
top (Node x s) = x

pop :: Stack a -> Stack a
pop Empty = error "Stack vacio"
pop (Node x s) = s

push :: a -> Stack a -> Stack a
push x Empty = Node x Empty
push x s = Node x s

instance Show a => Show (Stack a) where
  show s = "LinearStack("++ show' s ++ ")"
    where
      show' Empty = ""
      show' (Node x Empty) = show x
      show' (Node x s) = show x ++ ", " ++ show' s
