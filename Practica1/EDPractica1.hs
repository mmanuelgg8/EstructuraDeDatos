<pre><div class="text_to_html">-------------------------------------------------------------------------------
-- Estructuras de Datos. 2&ordm; Curso. ETSI Inform&aacute;tica. UMA
--
-- (completa y sustituye los siguientes datos)
-- Titulaci&oacute;n: Grado en Ingenier&iacute;a &hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip;&hellip; [Inform&aacute;tica | del Software | de Computadores].
-- Alumno: APELLIDOS, NOMBRE
-- Fecha de entrega:  DIA | MES | A&Ntilde;O
--
-- Relaci&oacute;n de Ejercicios 1. Ejercicios resueltos: .......... 
-- 
-------------------------------------------------------------------------------
import Test.QuickCheck

-------------------------------------------------------------------------------
-- Ejercicio 5
-------------------------------------------------------------------------------

{-

entre :: Ord a =&gt; a -&gt; (a, a) -&gt; Bool
entre x (p,q) = ... 

-}

-------------------------------------------------------------------------------
-- Ejercicio 7
-------------------------------------------------------------------------------

-- Para este ejercicio nos interesa utilizar la funci&oacute;n predefinida en Prelude: 
--              divMod :: Integral a =&gt; a -&gt; a -&gt; (a, a)
-- que calcula simult&aacute;neamente el cociente y el resto:
--
--   *Main&gt; divMod 30 7
--   (4,2)

type TotalSegundos = Integer
type Horas         = Integer
type Minutos       = Integer
type Segundos      = Integer

{-

descomponer :: TotalSegundos -&gt; (Horas,Minutos,Segundos)
descomponer x = (horas, minutos, segundos)
   where
     (horas,resto)      = divMod x 3600
     ...
     
p_descomponer x = x&gt;=0 ==&gt; h*3600 + m*60 + s == x
                           &amp;&amp; m `entre` (0,59)
                           &amp;&amp; s `entre` (0,59)
	 where (h,m,s) = descomponer x
-- *Main&gt; quickCheck p_descomponer
-- +++ OK, passed 100 tests.

-}         
         
-------------------------------------------------------------------------------
-- Ejercicio 10
-------------------------------------------------------------------------------
         

-- Usaremos el operador ~= visto en clase (Tema 1, transparencia 31)
infix 0 ~=
(~=) :: (Ord a, Fractional a) =&gt; a -&gt; a -&gt; Bool
x ~= y = abs (x-y) &lt; epsilon
&nbsp; where epsilon = 1e-5

{-

-- Primera soluci&oacute;n
-- no consideramos el estudio de las raices para a=0, 
ra&iacute;ces :: (Ord a, Floating a) =&gt; a -&gt; a -&gt; a -&gt; (a, a)
ra&iacute;ces a b c 
  | dis &lt; 0     = error &quot;Ra&iacute;ces no reales&quot;
  | otherwise   = ...
 where  dis     = b^2 - 4*a*c
        ...
        
p1_ra&iacute;ces a b c  = True   ==&gt; esRa&iacute;z r1 &amp;&amp; esRa&iacute;z r2
-- atenci&oacute;n, en el caso de True, podemos eliminar:  True ==&gt; 
  where
   (r1,r2) = ra&iacute;ces a b c
   esRa&iacute;z r = a*r^2 + b*r + c ~= 0

p2_ra&iacute;ces a b c  = ???  &amp;&amp; ???   ==&gt; esRa&iacute;z r1 &amp;&amp; esRa&iacute;z r2
  where
   (r1,r2) = ra&iacute;ces a b c
   esRa&iacute;z r = a*r^2 + b*r + c ~= 0

-}


-------------------------------------------------------------------------------
-- Ejercicio 14
-------------------------------------------------------------------------------

{-

-- potencia con base un n&uacute;mero arbitrario
potencia :: (Num b, Integral n) =&gt; b -&gt; n -&gt; b
potencia b 0             = ...
potencia b n | ...       = ...
                ...

potencia&#039; :: (Num b, Integral n) =&gt; b -&gt; n -&gt; b
potencia&#039; b 0           = ...
potencia&#039; b n | ...     = ...
                 ...

-- con esta propiedad (BASE un entero) no hay problemas
p_pot :: Integer -&gt; Integer -&gt; Property
p_pot b n  = n&gt;=0 ==&gt; (potencia b n == sol)-- &amp;&amp; (potencia&#039; b n == sol)
   where sol = b^n
-- *Main&gt; quickCheck p_pot
-- +++ OK, passed 100 tests.

-}


{- 

-- SEGUNDA OPCION: si consideramos una base arbitraria hay muchos problemas
p_pot&#039; :: (Ord b, Fractional b, Integral n) =&gt; b -&gt; n -&gt; Property
p_pot&#039; b n  = n&gt;=0 ==&gt; (potencia b n ~= sol) &amp;&amp; (potencia&#039; b n ~= sol)
   where sol = b^n
-- *Main&gt; quickCheck p_pot&#039;
-- *** Failed! Falsifiable (after 7 tests and 1 shrink):  
-- 4.374147831506856
-- 4   

-- Main&gt; potencia 850.1 5 - 850.1^5
-- 6.25e-2

-- Debemos ~= por un concepto de error relativo

-}


-------------------------------------------------------------------------------
-- Ejercicio 17
-------------------------------------------------------------------------------

{-

mediana :: Ord a =&gt; (a, a, a, a, a) -&gt; a
mediana (x,y,z,t,u) 
 | x &gt; z 		= mediana (z,y,x,t,u)
 | y &gt; z   		= mediana (x,z,y,t,u)
  ...

-}  

</div></pre>