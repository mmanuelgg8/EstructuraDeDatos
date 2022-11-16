<pre><div class="text_to_html">-------------------------------------------------------------------------------
-- Estructuras de Datos. 2&ordm; Curso. ETSI Inform&aacute;tica. UMA
--
-- PRACTICA 2&ordf; (Caracter&iacute;sticas de la Programaci&oacute;n Funcional)
--
-- (completa y sustituye los siguientes datos)
-- Titulaci&oacute;n: Grado en Ingenier&iacute;a &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip; [Inform&aacute;tica | del Software | de Computadores].
-- Alumno: APELLIDOS, NOMBRE
-- Fecha de entrega:  DIA | MES | A&Ntilde;O
--
-- Ejercicios resueltos de la Relaci&oacute;n : ..........
--
-------------------------------------------------------------------------------
module Practica2 where

import Test.QuickCheck


-------------------------------------------------------------------------------
-- Ejercicio 3
-------------------------------------------------------------------------------

reparte :: [a] -&gt; ([a],[a])
-- Reparte los elementos de la lista original en dos listas de alternativamente
-- cada elemento va cayendo en una de las dos listas soluci&oacute;n.
reparte [] = undefined
reparte [x] = undefined
reparte (x:y:xs) = undefined

-------------------------------------------------------------------------------
-- Ejercicio 6
-------------------------------------------------------------------------------

divisores :: Integer -&gt; [Integer]
-- divisores naturales (&gt;=0) de un entero
divisores x = undefined

divisores&#039; :: Integer -&gt; [Integer]
-- divisores enteros (positivos y negativos) de un entero
divisores&#039; x = undefined

-------------------------------------------------------------------------------
-- Ejercicio 10 . N&uacute;mero perfecto
-------------------------------------------------------------------------------
-- Un n&uacute;mero n es perfecto si la suma de sus divisores (sin incluir al propio n) es n

-- Indica si un n&uacute;mero dado es perfecto
esPerfecto :: Integer -&gt; Bool
esPerfecto n = undefined

-- Calcula todos los n&uacute;meros perfectos hasta un tope dado
-- perfectosHasta ::
perfectoHasta n = undefined


-------------------------------------------------------------------------------
-- Ejercicio 14
-------------------------------------------------------------------------------
-- apartados a, b, e y f
-- a)
inserta :: (Ord a) =&gt; a -&gt; [a] -&gt; [a]
inserta x s = undefined


-- b)
inserta&#039; :: (Ord a ) =&gt; a -&gt; [a] -&gt; [a]
inserta&#039; x [] = undefined
inserta&#039; x (y:ys) = undefined

-- e)

ordena :: (Ord a) =&gt; [a] -&gt; [a]
ordena xs = undefined

-- f)  Utiliza para ello la funci&oacute;n sorted definida en las transarencias

-------------------------------------------------------------------------------
-- Ejercicio 37
-------------------------------------------------------------------------------

type Izdo = Double
type Dcho = Double
type Epsilon = Double
type Funci&oacute;n = Double -&gt; Double
bipartici&oacute;n :: Funci&oacute;n -&gt; Izdo -&gt; Dcho -&gt; Epsilon -&gt; Double

bipartici&oacute;n f a b epsilon
  | long &lt; epsilon    = undefined
-- sigue aqui
  where
      long = b - a
-- sigue aqui
</div></pre>