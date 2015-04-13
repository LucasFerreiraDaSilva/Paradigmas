-- 1
-- As funções de alta ordem any e all são pré-definidas na biblioteca Prelude do Haskell.
-- Estude e teste essas funções e apresente 2 exemplos de uso de cada uma delas.

-- Função: any
-- Tipo: (a -> Bool) -> [a] -> Bool
-- Descricao: essa função testa se algum elemento presente na lista satisfaz a condição imposta como parâmetro,
--            em caso afirmativo seu retorno é True, em caso negativo seu retorno é False
-- Referencias: http://zvon.org/other/haskell/Outputprelude/any_f.html
--				https://hackage.haskell.org/package/base-4.8.0.0/docs/Data-List.html
-- Exemplos:
-- Função que testa se existem numeros negativos na lista
anyNeg :: [Int] -> Bool
anyNeg [] = False
anyNeg lista = any (<0) lista

-- Função que testa se existem numeros pares na lista
anyPar :: [Int] -> Bool
anyPar [] = False
anyPar lista = any (\x -> (mod x 2) == 0) lista

-- Função: all
-- Tipo: (a -> Bool) -> [a] -> Bool
-- Descricao: essa função tem funcionamento semelhante a função any, só que esta testa se todos elementos da lista satisfazem a condição imposta,
--            em caso do resultado do teste ser afirmativo seu retorno é True, em caso negativo seu retorno é False  
-- Referencias: https://www.haskell.org/hoogle/?hoogle=all
--				http://stackoverflow.com/questions/11001430/haskell-all-function
-- Exemplos:
-- Função que testa se todos os elementos da "lista" são multiplos de "y"
allMult :: Int -> [Int] -> Bool
allMult y lista
	|all (\x -> (mod x y) == 0 ) lista = True
	|otherwise = False

-- Função que testa se todos os elementos da lista são impares e positivos
allImpos :: [Int] -> Bool
allImpos [] = False
allImpos lista = all (\x -> ((mod x 2) /= 0) && (x>0)) lista

-- 2
-- Em Haskell, o símbolo '$' pode ser usado para escrever códigos ainda mais curtos.
-- Descubra seu significado e apresente 2 exemplos de uso.
-- Referencia: http://lambda.jstolarek.com/2012/03/function-composition-and-dollar-operator-in-haskell/
-- Descrição: o operador $ é utilizado para resolver a precedência de execução de uma instrução, assim como os parênteses, 
--            podendo até mesmo substituílos em vários casos.
-- Exemplos:
-- Multiplica por 2 todos elementos maiores que 5
cifraoM5 :: [Int] -> [Int]
cifraoM5 [] = []
cifraoM5 lista = map (*2) $ filter (>5) lista

-- Testa se todos elementos da lista elevados ao quadrado são pares
cifraoPar :: [Int] -> Bool
cifraoPar [] = False
cifraoPar lista = all (\x -> ((mod x 2) == 0)) $ map (^2) lista

-- 3
-- Haskell permite composição de funções, exatamente como em matemática. 
-- Descubra como fazer isso e apresente 2 exemplos de aplicação de funções compostas.
-- Composição de funções: é uma operação comum em Matemática, que a define como (f ? g)(x) = f(g(x))
-- 						  Em Haskell podemos definir uma função para compor duas outras funções dadas como argumentos.
--  					  O resultado é uma função: a função composta.
-- Referencias: http://www.decom.ufop.br/romildo/2012-1/bcc222/slides/07-lambda.pdf
-- Exemplos: 
--ex 1
compos1 :: [String] -> [String]
compos1 [] = []
compos1 lista = map (x . y) lista
	where
		x = (++" >")
		y = ("< "++)

--ex 2
compos2 :: [Int] -> [Int]
compos2 [] = []
compos2 lista = map (x . y) lista
	where
		x = (+10)
		y = (^2)
