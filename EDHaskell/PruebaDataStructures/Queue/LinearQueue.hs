module DataStructures.Queue.LinearQueue
   (  Queue
    , empty
    , isEmpty
    , first
    , enqueue
    , dequeue
    , mapQ) where

import Test.QuickCheck

data Queue a = Empty | Node a (Queue a) deriving (Eq, Show)

empty :: Queue a
empty = Empty

isEmpty :: Queue a -> Bool
isEmpty Empty = True
isEmpty _     = False

first :: Queue a -> a
first Empty = error "Empty Queue"
first (Node x q) = x

dequeue :: Queue a -> Queue a
dequeue Empty = error "Empty Queue"
dequeue (Node x q) = q

enqueue :: a -> Queue a -> Queue a
enqueue x Empty      = Node x Empty
enqueue x (Node y q) = Node y (enqueue x q)

mapQ :: (a -> b) -> Queue a -> Queue b
mapQ f Empty = Empty
mapQ f (Node x q) = Node (f x) (mapQ f q)

instance (Ord a, Arbitrary a) => Arbitrary (Queue a) where
  arbitrary = do
    xs <- listOf arbitrary
    return (foldr enqueue empty xs)
