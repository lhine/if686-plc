data Tree t = Node t (Tree t) (Tree t) | Empty
  deriving  (Show, Read)

addToTree :: Int -> Tree Int -> Tree Int
addToTree i Empty = Node i Empty Empty
addToTree i (Node n leftTree rightTree)
  | i <= n = Node n (addToTree i leftTree) rightTree
  | otherwise = Node n leftTree (addToTree i rightTree)

buildSearchTree :: [Int] -> Tree Int
buildSearchTree [] = Empty
buildSearchTree [x] = Node x Empty Empty
buildSearchTree list = foldl (\t i -> addToTree i t) Empty list

searchTreeSort :: [Int] -> [Int]
searchTreeSort list = getTreeInOrder (buildSearchTree list)
  where
    getTreeInOrder Empty = []
    getTreeInOrder (Node n Empty Empty) = [n]
    getTreeInOrder (Node n leftTree rightTree) = getTreeInOrder leftTree ++ [n] ++ getTreeInOrder rightTree



duplicates xs = [x | (x, y) <- zip xs (tail xs), x == y]
f (i:is) = [x | (c, x) <- zip (i:is) is, x == c]