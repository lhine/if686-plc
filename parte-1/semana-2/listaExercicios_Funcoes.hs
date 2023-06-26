-- 1 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
dobro :: Int -> Int
dobro n = 2*n
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 2 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
quadruplo :: Int -> Int
quadruplo n = dobro (dobro n)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 3 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
poli2 :: Double -> Double -> Double -> Double -> Double
poli2 a b c x = a*(x^2) + b*x + c
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 4 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
parImpar :: Int -> String
parImpar n
  | n `mod` 2 == 0 = "par" --poderia usar "even n" aqui
  | otherwise = "impar"
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 5 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
maxThree :: Int -> Int -> Int -> Int
maxThree x y z = max x (max y z)
-----

maxFour :: Int -> Int -> Int -> Int -> Int
maxFour x y z w
  | x >= maxThree y z w = x
  | y >= maxThree x z w = y
  | z >= maxThree x y w = z
  | otherwise = w

maxFour' :: Int -> Int -> Int -> Int -> Int
maxFour' x y z w = max x (max (max y z) w)

maxFour'' :: Int -> Int -> Int -> Int -> Int
maxFour'' x y z w = max x (maxThree y z w)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 6 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
quantosIguais :: Int -> Int -> Int -> Int
quantosIguais x y z
  | x+y+z == 3*x = 3
  | (x+y) == (x+z) || (y+x) == (y+z) || (z+x) == (z+y) = 2
  | otherwise = 0
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 7 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
ehZero :: Int -> Bool
ehZero 0 = True
ehZero x = False
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 8 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
sumTo :: Int -> Int
sumTo 1 = 1
sumTo n = n + sumTo (n-1)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 9 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
potencia :: Int -> Int -> Int
potencia n 0 = 1
potencia n k = n * potencia n (k-1)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 10 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
eqB n 0 = 1
eqB n k = if n==0 && k>0 then 0 else eqB (n-1) k + eqB (n-1) (k-1)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 11 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
tribonacci :: Int -> Int
tribonacci n
  | n<=0 = -1 -- ʕ•́ᴥ•̀ʔ coloquei isso aqui porque a def. do enunciado considera n maiores que 0 
  | n==1 || n==2 = 1
  | n==3 = 2
  | otherwise = tribonacci (n-1) + tribonacci (n-2) + tribonacci (n-3)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 12 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
{- NOTA: número negativos devem ser escritos entre parênteses para evitar confuão com o operador "-" -}
addEspacos :: Int -> String
addEspacos n
  | n<=0 = ""
  | otherwise = " " ++ addEspacos (n-1)
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 13 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
paraDireita :: Int -> String -> String
paraDireita n string = addEspacos n ++ string
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 14 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
{- NOTA: entender como fazer definições dentro do escopo do where -}
{- NOTA: para que "\n" seja renderizado como uma quebra de linha, precisa rodar com putStr-}
vendas :: Int -> Int
vendas n = mod n 5 -- a random function here ٩(˘◡˘)۶

totalVendas :: Int -> Int
totalVendas n
  | n == 0 = vendas 0
  | n > 0 = totalVendas (n-1) + vendas n
  | otherwise = 0

imprimeTabela :: Int -> String
imprimeTabela n = cabecalho
                  ++ imprimeSemanas n
                  ++ imprimeTotal n
                  ++ imprimeMedia n
                  where
                    cabecalho = "Semana  Venda\n"
                    total = show (totalVendas n)
                    imprimeSemanas n
                      | n<0 = ""
                      | otherwise = show n ++ "   " ++ show (vendas n) ++ "\n" ++ imprimeSemanas (n-1)
                    imprimeTotal n = "Total " ++ total ++ "\n"
                    imprimeMedia n = "Média " ++ total            
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.