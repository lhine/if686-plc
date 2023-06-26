-- 1 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
paraMaiuscula :: String -> String
paraMaiuscula p = [
                    if fromEnum c >= fromEnum 'a' && fromEnum c <= fromEnum 'z' then toEnum (fromEnum c + offset)
                    else c
                    | c <- p
                  ]
  where
    offset = fromEnum 'A' - fromEnum 'a'

paraMaiuscula' :: String -> String
paraMaiuscula' p = [
                    if lettercase c == 0 then toEnum (fromEnum c + offset)
                    else c
                    | c <- p, lettercase c > -1
                  ]
  where
    offset = fromEnum 'A' - fromEnum 'a'
    lettercase :: Char -> Int
    lettercase c
      | fromEnum c >= fromEnum 'a' && fromEnum c <= fromEnum 'z' = 0
      | fromEnum c >= fromEnum 'A' && fromEnum c <= fromEnum 'Z' = 1
      | otherwise = -1
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 2 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
divisores :: Integer -> [Integer]
divisores i
  | i <= 0 = []
  | otherwise = [d | d <- [1..i], i `mod` d == 0]

isPrime :: Integer -> Bool
isPrime i = length (divisores i) == 2
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 3 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
menorLista :: [Int] -> Int
menorLista []  = minBound
menorLista [x] = x
menorLista (x:xs)
  | x < menorLista xs = x
  | otherwise = menorLista xs
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 5 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
measure :: [t] -> Int
measure [] = -1
measure [x] = 1
measure (x:xs) = 1 + measure xs
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 6 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
takeFinal :: [t] -> Int -> [t]
takeFinal [] n = []
takeFinal l n
  | n<=0 = []
  | otherwise = takeFinal (init l) (n-1) ++ [last l]
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 7 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
remove :: Int -> [t] -> [t]
remove i [] = []
remove 0 (x:xs) = xs
remove i (x:xs) = x : remove (i-1) xs
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 8 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
pAux :: [Int] -> Int -> Int
pAux [] m = 0
pAux [x] m = min m x
pAux (x:y:xs) m = if y == x+1 then pAux (y:xs) (min m x) else 0

p :: [Int] -> Int
p l = pAux l maxBound :: Int
-----

p' :: [Int] -> Int
p' [] = 0
p' [x] = x
p' (x:xs) = if not (snd (foldl (\x y -> (y, fst x + 1 == y)) (x, False) xs)) then 0 else x
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 9 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
a :: Num a => [a] -> a
a [] = 0
a [x] = x
a (x:y:ys) = x + y
-----

a' :: Num a => [a] -> a
a' [] = 0
a' [x] = x
a' l = head l + head (tail l)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 10 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
produto :: [Integer] -> Integer
produto l = foldl (*) 1 l --funciona exatamente como product :: (Foldable t, Num a) => t a -> a
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 11 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
u :: [(Integer, Int)] -> [Integer] -> [Integer]
u [] [] = []
u [] (x:xs) = u [(x, 0)] xs
u (o:os) [] = if snd o == 0 then [fst o | o <- o:os] else [fst o | o <- os]
u (o:os) (x:xs)
  | fst o == x = u ((fst o, snd o + 1) : os) xs
  | otherwise = if snd o == 0 then u ((x, 0) : o : os) xs else u ((x, 0) : os) xs

unique :: [Integer] -> [Integer]
unique [] = []
unique l = reverse(u [(s, 0)] sl)
  where
    qs [] = []
    qs (x:xs) = qs [i | i <- xs, i < x] ++ [x] ++ qs [i | i <- xs, i >= x]
    (s:sl) = qs l
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 12 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
ordered :: Ord t => [t] -> Bool
ordered [] = True
ordered [x] = True
ordered (x:y:ys)
  | x <= y = ordered (y:ys)
  | otherwise = False
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.




-- ehPrimo :: Int -> Bool
-- ehPrimo 2 = True
-- ehPrimo n
--   | n < 2 = False
--   | otherwise = length (filter (\x -> n `mod` x == 0) [1..n]) <= 2

ehPrimo :: Int -> Bool
ehPrimo n = checkPrime n 2

checkPrime :: Int -> Int -> Bool
checkPrime 2 _ = True
checkPrime n d 
