import DataStuctures.Stack.LinearStack(
               Stack
            ,  empty
            ,  isEmpty
            ,  push
            ,  pop
            ,  top
            ) where
import Data.List(intercalate)

import Test.QuickCheck

s1 :: Stack Int
s1 = push 3 (push 2 (push 1 empty))

size :: Stack a -> Int
size s
    | isEmpty s = 0
    | otherwise = 1 + size (pop s)

data Stack a = Empty | Node a (Stack a) deriving Show

--s1 :: Stack Int
--s1 = Node 2 (Node 1 empty)

top :: Stack a -> a
top Empty = error "top for empty stack"
top (Node x s) = x

--size :: Stack a -> Int
--size Empty = 0
--size (Node x s)= 1 + size s
