
type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade

showPerson :: Pessoas -> String
showPerson (Pessoa n a) = n ++ "−−" ++ show a


main :: IO()
main =
  putStr (showPerson (Pessoa "Jose" 22))