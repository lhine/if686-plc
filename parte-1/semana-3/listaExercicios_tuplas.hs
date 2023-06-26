-- 1 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
menorMaior :: Int -> Int -> Int -> (Int, Int)
menorMaior x y z
  | x<=y && x<=z = if y>=z then (x, y) else (x, z)
  | y<=x && y<=z = if x>=z then (y, x) else (y, z)
  | otherwise = if x>=y then (z, x) else (z, y)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 2 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
ordenaTripla :: (Int, Int, Int) -> (Int, Int, Int)
ordenaTripla (x, y, z)
  | x<=y && x<=z = if y>=z then (x, z, y) else (x, y, z)
  | y<=x && y<=z = if x>=z then (y, z, x) else (y, x, z)
  | otherwise = if x>=y then (z, y, x) else (z, x, y)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 3 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
type Ponto = (Float , Float)
type Reta = (Ponto , Ponto)
----

fstCoordenada :: Ponto -> Float
fstCoordenada = fst

sndCoordenada :: Ponto -> Float
sndCoordenada = snd

ehVertical :: Reta -> Bool
ehVertical (p1, p2)
  | fstCoordenada p1 == fstCoordenada p2 = True
  | otherwise = False
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 4 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶ TO-DO
pontoY :: Float -> Reta -> Float 
pontoY x ((x1, y1), (x2, y2)) = ((y2-y1)/(x2-x1)) * (x-x1) + y1
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.