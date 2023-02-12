import Test.QuickCheck

esTerna :: Integer -> Integer -> Integer -> Bool
esTerna x y z = x*x + y*y == z*z

terna :: Integer -> Integer -> (Integer,Integer,Integer)
terna x y | x > 0 && y > 0 && x > y = (x*x - y*y, 2*x*y, x*x + y*y)

p_ternas :: Integer -> Integer -> Property
p_ternas x y = x > 0 && y > 0 && x > y ==> esTerna a1 a2 a3
    where
      (a1,a2,a3) = terna x y

intercambia :: (a,b) -> (b,a)
intercambia (x,y) = (y,x)

ordena2 :: Ord a => (a, a) -> (a, a)
ordena2 (x, y)
    | x < y = (x,y)
    | otherwise = (y,x)

p1_ordena2 :: Ord a => a -> a -> Property
p1_ordena2 x y = True ==> enOrden (ordena2 (x,y))
-- p1_ordena2 x y = enOrden (ordena2 (x,y))
    where
      enOrden (x,y) = x <= y

p2_ordena2 :: Ord a => a -> a -> Bool
p2_ordena2 x y = mismosElementos(x,y) (ordena2(x,y))
    where
      mismosElementos (x,y) (z,t) = x == z && y == t || x == t && y == z

ordena3 :: Ord a => (a, a, a) -> (a,a,a)
ordena3 (x,y,z)
    | x > y = ordena3 (y,x,z)
--    | x > z = ordena3 (z,y,x)
    | y > z = ordena3 (x,z,y)
    | otherwise = (x,y,z)

p1_ordena3 :: Ord a => a -> a -> a -> Bool
p1_ordena3 x y z = enOrden (ordena3 (x,y,z))
    where enOrden (x,y,z) = x <= y && y <= z

infix 4 ~=
(~=) :: Double -> Double -> Bool
x ~= y = abs (x - y) < epsilon -- (~=) x y = abs (x - y) < epsilon
    where epsilon = 1/1000

--infixl 5 `max2`
max2 :: Ord a => a -> a -> a
max2 x y
    | x < y = y
    | otherwise = x

p1_max2 :: Ord a => a -> a -> Bool
p1_max2 x y = m == x || m == y
    where m = max2 x y

unEuro :: Double
unEuro = 166.386

pesetasAEuros :: Double -> Double
pesetasAEuros x = x / unEuro

eurosAPesetas :: Double -> Double
eurosAPesetas x = unEuro * x

p_inversas :: Double -> Bool
p_inversas x = pesetasAEuros (eurosAPesetas x) ~= x

esMultiplo :: Integral a =>  a -> a -> Bool
esMultiplo x y = x `mod` y == 0

infixl 1 ==>>
(==>>) :: Bool -> Bool -> Bool
--False ==>> _ = True
--True ==>> x = x

True ==>> False = False
_ ==>> _ = True

esBisiesto :: Integer -> Bool
esBisiesto x = esMultiplo x 4 && (esMultiplo x 100 ==>> esMultiplo x 400)

factorial :: Integer -> Integer
factorial 0 = 1
factorial n | n > 0 = n * factorial (n-1)

gdc' :: Integral a => a -> a -> a
gdc' x 0 = x
gdc' x y
    | otherwise = gdc' y (x `mod` y)
