import Data.Char

-- 1
-- Escreva uma fun��o recursiva firstName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu primeiro nome. 
-- Suponha que cada parte do nome seja separada por um espa�o e que n�o existam espa�os no in�cio ou fim do nome.
firstName :: String -> String
firstName nome
	|nome == [] = []
	|head nome == ' ' = []
	|otherwise = head nome: firstName (tail nome)

-- 2
-- Escreva uma fun��o firstName' :: String -> String com o mesmo resultado do exerc�cio anterior, mas sem usar recurs�o. 
-- Dica: estude fun��es pr�-definidas em Haskell (List operations -> Sublists)
firstName' :: String -> String
firstName' nome = takeWhile (>' ') nome

-- 3
-- Escreva uma fun��o lastName :: String -> String que, dado o nome completo de uma pessoa, obtenha seu �ltimo sobrenome.
-- Suponha que cada parte do nome seja separada por um espa�o e que n�o existam espa�os no in�cio ou fim do nome.
lastName :: String -> String
lastName nome = reverse (takeWhile (>' ') (reverse nome))

-- 4
-- Escreva uma fun��o n�o-recursiva userName :: String -> String que, dado o nome completo de uma pessoa,
-- crie um nome de usu�rio (login) da pessoa, formado por: primeira letra do nome seguida do sobrenome, tudo em min�sculas.
-- Dica: estude as fun��es pr�-definidas no m�dulo Data.Char, para manipula��o de mai�sculas e min�sculas.
userName :: String -> String
userName nome = map (toLower) (head(nome) : (reverse (takeWhile (>' ') (reverse nome))))

-- 5
-- Escreva uma fun��o n�o-recursiva encodeName :: String -> String que substitua vogais em uma string, 
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
-- Escreva uma fun��o isElem :: Int -> [Int] -> Bool que verifique se um dado elemento pertence a uma lista.
isElem :: Int -> [Int] -> Bool
isElem x lista 
	|lista == [] = False
	|otherwise = ((filter(==x) lista) /= [])
	
-- 7
-- Escreva uma fun��o recursiva que retorne o n�mero de vogais em uma string.
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
-- Escreva uma fun��o n�o-recursiva que retorne o n�mero de consoantes em uma string.
nCons :: String -> Int
nCons n = length (filter (\ n -> (n /= 'a') && (n /= 'e') && (n /= 'i') && (n /= 'o') && (n /= 'u') && (n /= 'A') && (n /= 'E') && (n /= 'I') && (n /= 'O') && (n /= 'U') && (n /= ' ')) n)	

-- 9
-- Escreva uma fun��o n�o-recursiva isInt :: String -> Bool que verifique se uma dada string s� cont�m d�gitos (0 a 9).
isInt :: String -> Bool
isInt palavra 
	| palavra == [] = False
	| (length(filter (`elem` ['0','1'..'9']) palavra) == length (palavra)) = True
	| otherwise = False

-- 10
-- Escreva uma fun��o n�o-recursiva strToInt :: String -> Int que converta uma string em um n�mero inteiro, 
-- fazendo opera��es aritm�ticas com seus d�gitos (p.ex.: "356" = 3*100 + 5*10 + 6*1 = 356). 
-- Considere que a string seja um n�mero v�lido, isto �, s� contenha d�gitos de 0 a 9. 
strToInt :: String -> Int
strToInt num 
	| num == [] = 0
	| length(num) /= length(filter (\num->(num=='0')||(num=='1')||(num=='2')||(num=='3')||(num=='4')||(num=='5')||(num=='6')||(num=='7')||(num=='8')||(num=='9')&&(num/=' ')) num) = 0
	| otherwise = 
		let
			tam = length (map (\num -> read [num] :: Int) num) - 1
		in foldl1 (+) (zipWith (*) (map (\num -> read [num] :: Int) num) ([(10^(tam)) | tam <- [tam,tam-1..0]]))
	