-------------------------------------------------------------------------------
-- Estructuras de Datos. 2º Curso. ETSI Informática. UMA
--
-- PRACTICA 2ª (Características de la Programación Funcional)
--
-- (completa y sustituye los siguientes datos)
-- Titulación: Grado en Ingeniería Informática.
-- Alumno: González González, Manuel
-- Fecha de entrega:  25 | 10 | 2018
--
-- Ejercicios resueltos de la Relación : 2.
--
-------------------------------------------------------------------------------
module Practica2 where

import Test.QuickCheck


-------------------------------------------------------------------------------
-- Ejercicio 3
-------------------------------------------------------------------------------

reparte :: [a] -> ([a],[a])
-- Reparte los elementos de la lista original en dos listas de alternativamente
-- cada elemento va cayendo en una de las dos listas solución.
reparte [] = ([],[])
reparte [x] = ([x],[])
reparte (x:y:xs) = (x:u,y:v)
    where
      (u,v) = reparte xs

-------------------------------------------------------------------------------
-- Ejercicio 6
-------------------------------------------------------------------------------

divisores :: Integer -> [Integer]
-- divisores naturales (>=0) de un entero
divisores x = filter divideA [1..x]
    where
      divideA y | mod x y == 0 = True
                | otherwise = False

divisores' :: Integer -> [Integer]
-- divisores enteros (positivos y negativos) de un entero
divisores' x = filter divideA [-abs (x)..abs (x)]
    where
      divideA y | (y /= 0)&&(mod x y == 0) = True
                | otherwise = False

-------------------------------------------------------------------------------
-- Ejercicio 10 . Número perfecto
-------------------------------------------------------------------------------
-- Un número n es perfecto si la suma de sus divisores (sin incluir al propio n) es n

-- Indica si un número dado es perfecto
esPerfecto :: Integer -> Bool
esPerfecto n = foldr (+) 0 (divisores'' n) == n

divisores'' :: Integer -> [Integer]
divisores'' x = filter divideA [1..(x-1)]
     where
        divideA y | (y /= 0)&&(mod x y == 0) = True
                  | otherwise = False

-- Calcula todos los números perfectos hasta un tope dado
-- perfectosHasta ::
perfectoHasta n = filter esPerfecto [1..n]


-------------------------------------------------------------------------------
-- Ejercicio 14
-------------------------------------------------------------------------------
-- apartados a, b, e y f
-- a)
inserta :: (Ord a) => a -> [a] -> [a]
inserta x s = (takeWhile (<x) s) ++ [x] ++ (dropWhile (<x) s)


-- b)
inserta' :: (Ord a ) => a -> [a] -> [a]
inserta' x [] = [x]
inserta' x (y:ys) | x <= y = x:y:ys
                  | otherwise = y : (inserta' x ys)

-- e)

ordena :: (Ord a) => [a] -> [a]
ordena xs = foldr inserta [] xs

-- f)  Utiliza para ello la función sorted definida en las transarencias


-------------------------------------------------------------------------------
-- Ejercicio 37
-------------------------------------------------------------------------------

type Izdo = Double
type Dcho = Double
type Epsilon = Double
type Función = Double -> Double
bipartición :: Función -> Izdo -> Dcho -> Epsilon -> Double

bipartición f a b epsilon
  | long < epsilon    = undefined
-- sigue aqui
  where
      long = b - a
-- sigue aqui
