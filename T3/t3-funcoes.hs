import Data.Char

-- 1
-- Escreva uma função recursiva firstName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu primeiro nome. 
-- Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.
firstName :: String -> String
firstName nome
	|nome == [] = []
	|head nome == ' ' = []
	|otherwise = head nome: firstName (tail nome)

-- 2
-- Escreva uma função firstName' :: String -> String com o mesmo resultado do exercício anterior, mas sem usar recursão. 
-- Dica: estude funções pré-definidas em Haskell (List operations -> Sublists)
firstName' :: String -> String
firstName' nome = takeWhile (>' ') nome

-- 3
-- Escreva uma função lastName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu último sobrenome.
-- Suponha que cada parte do nome seja separada por um espaço e que não existam espaços no início ou fim do nome.
lastName :: String -> String
lastName nome = reverse (takeWhile (>' ') (reverse nome))

-- 4
-- Escreva uma função não-recursiva userName :: String -> String que, dado o nome completo de uma pessoa,
-- crie um nome de usuário (login) da pessoa, formado por: primeira letra do nome seguida do sobrenome, tudo em minúsculas.
-- Dica: estude as funções pré-definidas no módulo Data.Char, para manipulação de maiúsculas e minúsculas.
userName :: String -> String
userName nome = map (toLower) (head(nome) : (reverse (takeWhile (>' ') (reverse nome))))

-- 5
-- Escreva uma função não-recursiva encodeName :: String -> String que substitua vogais em uma string, 
-- conforme o esquema a seguir: a = 4, e = 3, i = 1, o = 0, u = 00.
encodeName :: String -> String
encodeName palavra = 
	let substitui v
		|v == 'a' = "4"
		|v == 'e' = "3"
		|v == 'i' = "1"
		|v == 'o' = "0"
		|v == 'u' = "00"
		|otherwise = [v]
	in concat(map (substitui) palavra)

-- 6
-- Escreva uma função isElem :: Int -> [Int] -> Bool que verifique se um dado elemento pertence a uma lista.
isElem :: Int -> [Int] -> Bool
isElem x lista 
	|lista == [] = False
	|otherwise = ((filter(==x) lista) /= [])
	
-- 7
-- Escreva uma função recursiva que retorne o número de vogais em uma string.
nVogais :: String -> Int
nVogais [] = 0
nVogais x = (cont (head x)) + (nVogais (tail x))
	where cont x
		| x == 'a' = 1
		| x == 'e' = 1
		| x == 'i' = 1
		| x == 'o' = 1
		| x == 'u' = 1
		| otherwise = 0

-- 8
-- Escreva uma função não-recursiva que retorne o número de consoantes em uma string.
nCons :: String -> Int
nCons n = length (filter (\ n -> (n /= 'a') && (n /= 'e') && (n /= 'i') && (n /= 'o') && (n /= 'u') && (n /= 'A') && (n /= 'E') && (n /= 'I') && (n /= 'O') && (n /= 'U') && (n /= ' ')) n)	

-- 9
-- Escreva uma função não-recursiva isInt :: String -> Bool que verifique se uma dada string só contém dígitos (0 a 9).
isInt :: String -> Bool
isInt palavra 
	| palavra == [] = False
	| (length(filter (`elem` ['0','1'..'9']) palavra) == length (palavra)) = True
	| otherwise = False

-- 10
-- Escreva uma função não-recursiva strToInt :: String -> Int que converta uma string em um número inteiro, 
-- fazendo operações aritméticas com seus dígitos (p.ex.: "356" = 3*100 + 5*10 + 6*1 = 356). 
-- Considere que a string seja um número válido, isto é, só contenha dígitos de 0 a 9. 
strToInt :: String -> Int
strToInt num 
	| num == [] = 0
	| length(num) /= length(filter (\num->(num=='0')||(num=='1')||(num=='2')||(num=='3')||(num=='4')||(num=='5')||(num=='6')||(num=='7')||(num=='8')||(num=='9')&&(num/=' ')) num) = 0
	| otherwise = 
		let
			tam = length (map (\num -> read [num] :: Int) num) - 1
		in foldl1 (+) (zipWith (*) (map (\num -> read [num] :: Int) num) ([(10^(tam)) | tam <- [tam,tam-1..0]]))
	