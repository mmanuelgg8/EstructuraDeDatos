


data Barca = I|D deriving (Eq,Ord,Show)

data Estado = MC Int Int Barca deriving (Eq, Ord, Show)

mov = [(m,c) |m <- [0..3], c <- [0..3], m+c > 0,m+c <= 2]

legal (MC m c b)
  | m >= c = True
  | m == 0 = True
  | otherwise = False

suc (MC m c I) = [MC (m' c' D)] | (x,y) <- mov, ... , legal (MC m' c' D)]
