--Lucas Ferreira da Silva

-- Soma os quadrados de 2 numeros
doubleUs :: Int -> Int -> Int   
doubleUs x y = x^2 + y^2
  
-- Verifica se um numero eh par (mod retorna resto da divisao inteira)
isEven :: Int -> Bool
isEven n = if mod n 2 == 0 then True else False
  
-- Gera um numero a partir de um caracter
encodeMe :: Char -> Int
encodeMe c 
  | c == 'S'  = 0
  | c == 'N'  = 1
  | otherwise = 2
  
-- Calcula o quadrado do primeiro elemento da lista
doubleFirst :: [Int] -> Int
doubleFirst lis = (head lis)^2

-- Verifica se as 2 listas possuem o mesmo primeiro elemento
hasEqHeads :: [Int] -> [Int] -> Bool
hasEqHeads lst_1 lst_2
	|head(lst_1) == head(lst_2) = True
	|otherwise = False
	
-- Eleva ao cubo cada elemento da lista, produzindo outra lista
pot3 :: [Int] -> [Int]
pot3 [] = []
pot3 ns = (head ns)^3 : pot3 (tail ns)

-- Adiciona a constante 10 a cada elemento de uma lista, produzindo outra lista
add10 :: [Int] -> [Int]
add10 [] = []
add10 lst = (head lst)+10 : add10 (tail lst)

-- Adiciona uma vírgula no final de cada string contida numa lista
addComma :: [String] -> [String]
addComma [] = []
addComma lst_string = ((head (lst_string))++",") : addComma (tail lst_string)

-- Adiciona a constante 10 a cada elemento de uma lista, produzindo outra lista (usando map)
mapAdd10 :: [Int] -> [Int]
mapAdd10 [] = []
mapAdd10 lst = map(^3) lst

-- Adiciona uma vírgula no final de cada string contida numa lista (usando map)
mapAddComma :: [String] -> [String]
mapAddComma [] = []
mapAddComma lst =  map (++",") lst

-- Recebe uma lista de strings e retorne outra lista contendo as strings formatadas como itens de lista em HTML
htmlListItems :: [String] -> [String]
htmlListItems [] = []
htmlListItems lst_string = ("<LI>"++(head (lst_string))++"</LI>") : htmlListItems (tail lst_string)

-- Verifica se o caracter (primeiro argumento) está contido na string (segundo argumento)
charFound :: Char -> String -> Bool
charFound letra palavra
    |palavra == [] = False
	|letra == head(palavra) = True
	|otherwise = charFound letra (tail(palavra))

-- Verifica se o caracter (primeiro argumento) está contido na string (segundo argumento) -> Sem recusrividade
charFound2 :: Char -> String -> Bool
charFound2 letra palavra
    |palavra == [] = False
	|(filter(==letra) palavra /= []) = True
	|otherwise = False
	
-- Use a função de alta ordem 'zipWith' para produzir uma função que obtenha as diferenças, par a par, dos elementos de duas listas
subZip :: [Int] -> [Int] -> [Int]
subZip ls1 ls2 = zipWith (-) ls1 ls2 

--Dada uma lista de números, calcular 2*n+1 para cada número n contido na lista. 
calc1 :: [Int] -> [Int]
calc1 [] = []
calc1 lst = map(+1) (map(*2) lst)

--Dadas duas listas X e Y de números inteiros, calcular 4*x+2*y+1 para cada par de números x e y pertencentes às listas
func1 :: [Int] -> [Int] -> [Int]
func1  lx ly
	|lx == [] = []
	|ly == [] = [] 
	|otherwise = map (1+) (zipWith (+) (map(*4)lx) (map(*2)ly))

--Dada uma lista de strings, produzir outra lista com strings de 10 caracteres, usando o seguinte esquema: strings de entrada com mais de
-- 10 caracteres são truncadas, strings com até 10 caracteres são completadas com '.' até ficarem com 10 caracteres

format :: [String] -> [String]
format [] = []
format l_string = map(funAux) l_string

funAux :: String -> String
funAux [] = []
funAux p 
	|((length p) > 10) = take 10 (p)
	|((length p) < 10) = funAux(p++".")
	|otherwise = p

--Dada uma lista de idades, selecionar as que são maiores que 20 e, para cada uma, calcular o ano de nascimento correspondente
anoNasc :: [Int] -> [Int]
anoNasc [] = []
anoNasc idade = map(2015-)(filter(>20)idade)	











