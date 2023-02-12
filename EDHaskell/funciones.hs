twice :: Integer -> Integer
twice x = x + x

fact :: Integer -> Integer
fact 0 = 1
fact x | x > 0 = x * fact (x - 1)

sqr :: (Num a) => a -> a
sqr x = x*x

c1 :: Int -> (Int -> Int) -> Int -> Int
c1 x f n = f x + n

c2 :: Integer -> Integer -> Integer
c2 x y = x * x + y

cross :: (a -> c, b -> d) -> (a, b) -> (c, d)
cross (f, g) (x, y) = (f x, g y)

f :: (Num b, Eq a) => a ->a -> b
f x y = if (x == y) then 1 else 0

sign :: (Eq a, Ord a, Num a) => a -> a
sign x
    | x > 0 = 1
    | x < 0 = -1
    | x == 0 = 0 -- 3 == 3 = 0; True = 0; otherwise = 0

cylinderArea :: Double -> Double -> Double
cylinderArea r h = 2*circ + rect
  where
    circArea r' = pi*r'^2
    circLong r' = 2*pi*r'
    rectArea b' h' = b'*h'
    rect = rectArea (circLong r) h
    circ = circArea r

infix 4 ~=
(~=) :: Double -> Double -> Bool
x ~= y = abs (x - y) < epsilon -- (~=) x y = abs (x - y) < epsilon
    where epsilon = 1/1000

divisores:: Int -> [Int]
divisores n = divisoresDesde n 1

divisoresDesde:: Int -> Int -> [Int]
divisoresDesde n m
    |n == m = [n]
    |n > m && (n `mod` m == 0) = m:(divisoresDesde n (m+1))
    |n > m && (n `mod` m /= 0) = divisoresDesde n (m+1)

reciprocal :: (Eq a, Num a, Fractional a ) => a -> a
reciprocal x
    | x /= 0 = 1/x
    | otherwise = error "No existe reciproco de 0"

esPrimo :: Integral a => a -> Bool
esPrimo 1 = True
esPrimo n | n > 1 = esPrimo' (n `div` 2)
    where
      esPrimo' 1 = True
      esPrimo' m = n `mod` m /= 0 && esPrimo' (m-1)

take' :: Int -> [a] -> [a]
take' 0 xs = []
take' n [] | n > 0 = []
take' n (x:xs) = x : take' (n-1) xs

splitAt' :: Int -> [a] -> ([a],[a])
splitAt' 0 xs = ([],xs)
splitAt' n [] | n > 0 = ([],[])
splitAt' n (x:xs) = (x:us , vs)
    where
      (us, vs) = splitAt' (n-1) xs

-- \x -> (\y -> x+y) <==> \x y -> x+y

concat' :: [[a]] -> [a]
concat' [] = []
concat' (xs:xss) = xs ++ concat' xss

and' :: [Bool] -> Bool
and' [] = True
and' (x:xs) = x && and' xs

-- reverse xs = foldl (\s e -> e:s) [] xs
-- reverse xs = foldr (\e s -> s++[e]) [] xs
-- reverse xs = foldl (flip (:)) [] xs

--map f xs = foldr (\e s -> fe:s) [] xs
--filter p xs = foldr (\e s -> if p e then e:s else s) [] xs

data Direction = North | South | East | West deriving (Show,Eq,Ord )
data Degrees = Celsius Double | Fahrenheit Double deriving Show

type Name = String
type Surname = String
type Age = Int

data Person = Pers Name Surname Age deriving Show

data TreeG a = Emty |Node a [TreeG a]

sumG :: Num a => TreeG a -> a
sumG Emty = 0
sumG (Nodo x ts) = 1 + sum (map sumG ts)

prof :: TreeG a -> Integer   --profundidad
prof Empty = 0
prof (Nodo x ts) = 1 + maximum (map prof ts)
