<pre><div class="text_to_html">-------------------------------------------------------------------------------
-- Estructuras de Datos. Grado en Inform&aacute;tica, IS e IC. UMA.
-- Ejercicios Pr&aacute;ctica 8. Algoritmo de Prim
--
-- Alumno:
-- Titulaci&oacute;n:
-------------------------------------------------------------------------------

module Prim where

import DataStructures.Graph.WeightedGraph
import Data.List(delete, minimumBy) -- consulta delete y minimumBy en Hoogle

-- prim g v : aplica el algoritmo  de Prim al grafo g para calcular el
-- &aacute;rbol de expansi&oacute;n m&iacute;nima con ra&iacute;z en el nodo v

prim :: (Eq a, Ord w) =&gt; WeightedGraph a w -&gt; a -&gt; [WeigthedEdge a w]
prim g v
   | v `elem` vs = primAux g [v] (delete v vs) []
   | otherwise = error &quot;el v&eacute;rtice v no est&aacute; en el grafo g&quot;
   where
     vs = vertices g

-- primAux g ts  rs st : ts  son los nodos visitados  que forman parte
-- del &aacute;rbol, rs el resto de nodos  por visitar y st almacena el &aacute;rbol
-- de expansi&oacute;n (lista de aristas con peso) computado hasta el momento

primAux :: (Eq a, Ord w) =&gt; WeightedGraph a w -&gt; [a] -&gt;  [a] -&gt; [WeigthedEdge a w] -&gt; [WeigthedEdge a w]
primAux g _  [] st = st
primAux g ts rs st = undefined
   where
      -- encontrar las aristas de un v&eacute;rtice de ts a otro de rs
      aristas = undefined
      -- de todas las aristas calculadas en el paso anterior encuentra la de menor peso
      (WE x p y) = undefined
      

-- ejemplos de grafos

g1 :: WeightedGraph Char Int
g1 = mkWeigthedGraphEdges [&#039;a&#039;,&#039;b&#039;,&#039;c&#039;,&#039;d&#039;,&#039;e&#039;]
                          [ WE &#039;a&#039; 3 &#039;b&#039;, WE &#039;a&#039; 7 &#039;d&#039;
                          , WE &#039;b&#039; 4 &#039;c&#039;, WE &#039;b&#039; 2 &#039;d&#039;
                          , WE &#039;c&#039; 5 &#039;d&#039;, WE &#039;c&#039; 6 &#039;e&#039;
                          , WE &#039;d&#039; 5 &#039;e&#039;
                          ]
{-
*Prim&gt; prim g1 &#039;a&#039;
[WE &#039;d&#039; 5 &#039;e&#039;,WE &#039;b&#039; 4 &#039;c&#039;,WE &#039;b&#039; 2 &#039;d&#039;,WE &#039;a&#039; 3 &#039;b&#039;]
-}

gEjer3 :: WeightedGraph Char Int
gEjer3 = mkWeigthedGraphEdges [&#039;a&#039;,&#039;b&#039;,&#039;c&#039;,&#039;d&#039;,&#039;e&#039;,&#039;f&#039;,&#039;g&#039;]
                              [ WE &#039;a&#039; 7 &#039;b&#039;, WE &#039;a&#039; 5 &#039;d&#039;
                              , WE &#039;b&#039; 9 &#039;d&#039;, WE &#039;b&#039; 8 &#039;c&#039;, WE &#039;b&#039; 7 &#039;e&#039;
                              , WE &#039;c&#039; 5 &#039;e&#039;
                              , WE &#039;d&#039; 15 &#039;e&#039;, WE &#039;d&#039; 6 &#039;f&#039;
                              , WE &#039;e&#039; 8 &#039;f&#039;, WE &#039;e&#039; 9 &#039;g&#039;
                              , WE &#039;f&#039; 11 &#039;g&#039;
                              ]
{-
*Prim&gt; prim gEjer3 &#039;a&#039;
[WE &#039;e&#039; 9 &#039;g&#039;,WE &#039;e&#039; 5 &#039;c&#039;,WE &#039;b&#039; 7 &#039;e&#039;,WE &#039;a&#039; 7 &#039;b&#039;,WE &#039;d&#039; 6 &#039;f&#039;,WE &#039;a&#039; 5 &#039;d&#039;]
-}
</div></pre>