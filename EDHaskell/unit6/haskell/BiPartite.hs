import DataStructures.Graph.Graph
import DataStructures.Stack.LinearStack as S
import DataStructures.Dictionary.BSTDictionary as D

data Color = Rojo | Azul deriving (Eq,Show)
sig Azul = Rojo
sig Rojo = Azul

pushAll :: S.Stack a -> [a] -> S.Stack a
pushAll stack vs = foldr S.push stack vs

bipartite :: (Ord a) => Graph a -> Maybe (Dictionary a Color)
bipartite g
  | null vs   = Just D.empty
  | otherwise = aux g D.empty (S.push (v0,Rojo) S.empty)
  where
    vs = vertices g
    v0 = head vs
--aux :: (Ord a) => Graph a -> D.Dictionary a Color -> S.Stack (a,Color) -> Maybe (D.Dictionary a Color)
aux g dict stack
  | S.isEmpty stack = Just dict
  | not (colored v) = aux g (D.insert v color dict) (pushAll stack' us)
  | color == cAso = aux g dict stack'
  | otherwise = Nothing

  where
    (v,color) = S.top stack
    stack' = S.pop stack
    colored vv = D.isDefinedAt vv dict
    Just cAso = D.valueOf v dict
    us = [(u,sig color) | u <- successors g v, not (colored u)]
