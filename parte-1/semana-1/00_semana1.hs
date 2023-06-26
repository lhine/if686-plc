-- 1 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
-- it guarda o último valor computado/calculado
-- let é usado para definições locais
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.


-- 5 ┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈┈ •༶
mystery :: Int -> Int -> Int -> Bool
mystery m n p = not ((m==n) && (n==p))

threeEqual :: Int -> Int -> Int -> Bool 
threeEqual m n p = (m==n) && (n==p)

threeDifferent :: Int -> Int -> Int -> Bool 
threeDifferent m n p = (m/=n) && (m/=p) && (n/=p)

fourEqual :: Int -> Int -> Int -> Int -> Bool 
fourEqual m n p q = not (mystery m n p) && m == q 

--threeEqual (2+3) 5 (11 `div` 2)
--mystery (2+4) 5 (11 `div` 2)
--threeDifferent (2+4) 5 (11 `div` 2)
--fourEqual (2+3) 5 (11 `div` 2) (21 `mod` 11) 
-- .• ☆ . ° .• °:. *₊ ° . ☆ •.