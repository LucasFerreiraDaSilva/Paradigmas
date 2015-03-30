--Lucas Ferreira da Silva

-- Gera uma lista com as potencias de 2, com expoente de n ate 0, onde n eh o argumento para a função
geraPotencias :: Int -> [Int]
geraPotencias 0 = []
geraPotencias x = [(2^x) | x <- [x,x-1..0]]

-- adicionar um sufixo as strings contidas numa lista
addSuffix :: String -> [String] -> [String]
addSuffix x y =  [(y++x) | y <- y]

-- Recebe uma lista de idades, seleciona as que são maiores que 20 e, para cada uma das selecionadas, calcula o ano de nascimento correspondente
anosDeNascimento :: [Int] -> [Int]
anosDeNascimento x = [(2015-x) | x <-x , x > 20]