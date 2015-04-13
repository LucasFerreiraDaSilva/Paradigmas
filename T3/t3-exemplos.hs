-- 1
-- As fun��es de alta ordem any e all s�o pr�-definidas na biblioteca Prelude do Haskell.
-- Estude e teste essas fun��es e apresente 2 exemplos de uso de cada uma delas.

-- Fun��o: any
-- Tipo: (a -> Bool) -> [a] -> Bool
-- Descricao: essa fun��o testa se algum elemento presente na lista satisfaz a condi��o imposta como par�metro,
--            em caso afirmativo seu retorno � True, em caso negativo seu retorno � False
-- Referencias: http://zvon.org/other/haskell/Outputprelude/any_f.html
--				https://hackage.haskell.org/package/base-4.8.0.0/docs/Data-List.html
-- Exemplos:
-- Fun��o que testa se existem numeros negativos na lista
anyNeg :: [Int] -> Bool
anyNeg [] = False
anyNeg lista = any (<0) lista

-- Fun��o que testa se existem numeros pares na lista
anyPar :: [Int] -> Bool
anyPar [] = False
anyPar lista = any (\x -> (mod x 2) == 0) lista

-- Fun��o: all
-- Tipo: (a -> Bool) -> [a] -> Bool
-- Descricao: essa fun��o tem funcionamento semelhante a fun��o any, s� que esta testa se todos elementos da lista satisfazem a condi��o imposta,
--            em caso do resultado do teste ser afirmativo seu retorno � True, em caso negativo seu retorno � False  
-- Referencias: https://www.haskell.org/hoogle/?hoogle=all
--				http://stackoverflow.com/questions/11001430/haskell-all-function
-- Exemplos:
-- Fun��o que testa se todos os elementos da "lista" s�o multiplos de "y"
allMult :: Int -> [Int] -> Bool
allMult y lista
	|all (\x -> (mod x y) == 0 ) lista = True
	|otherwise = False

-- Fun��o que testa se todos os elementos da lista s�o impares e positivos
allImpos :: [Int] -> Bool
allImpos [] = False
allImpos lista = all (\x -> ((mod x 2) /= 0) && (x>0)) lista

-- 2
-- Em Haskell, o s�mbolo '$' pode ser usado para escrever c�digos ainda mais curtos.
-- Descubra seu significado e apresente 2 exemplos de uso.
-- Referencia: http://lambda.jstolarek.com/2012/03/function-composition-and-dollar-operator-in-haskell/
-- Descri��o: o operador $ � utilizado para resolver a preced�ncia de execu��o de uma instru��o, assim como os par�nteses, 
--            podendo at� mesmo substitu�los em v�rios casos.
-- Exemplos:
-- Multiplica por 2 todos elementos maiores que 5
cifraoM5 :: [Int] -> [Int]
cifraoM5 [] = []
cifraoM5 lista = map (*2) $ filter (>5) lista

-- Testa se todos elementos da lista elevados ao quadrado s�o pares
cifraoPar :: [Int] -> Bool
cifraoPar [] = False
cifraoPar lista = all (\x -> ((mod x 2) == 0)) $ map (^2) lista

-- 3
-- Haskell permite composi��o de fun��es, exatamente como em matem�tica. 
-- Descubra como fazer isso e apresente 2 exemplos de aplica��o de fun��es compostas.
-- Composi��o de fun��es: � uma opera��o comum em Matem�tica, que a define como (f ? g)(x) = f(g(x))
-- 						  Em Haskell podemos definir uma fun��o para compor duas outras fun��es dadas como argumentos.
--  					  O resultado � uma fun��o: a fun��o composta.
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
