--
-- Este programa ilustra:
-- 1) Uso de registros (record syntax) em Haskell
-- 2) Leitura de arquivo CSV
--

--
-- Declara novo tipo de dado 'GalleryItem' usando record syntax
-- Cada GalleryItem é um registro formado por 3 campos / atributos
-- Com esta sintaxe, Haskell automaticamente cria funções de acesso aos campos
-- Por exemplo, dado um GalleryItem x, 'title x' vai retornar o atributo 'title' de x,
-- 'description x' vai retornar o atributo 'description' de x, e assim por diante
-- Mais sobre isso em: http://learnyouahaskell.com/making-our-own-types-and-typeclasses
--
data GalleryItem =
   GalleryItem {title :: String,
                description :: String,
                author :: String}
               
-- Converte uma lista de String em um GalleryItem
toGalleryItem :: [String] -> GalleryItem
toGalleryItem [s1, s2, s3] = GalleryItem {title = s1, description = s2, author = s3}


-- Funcao principal que faz leitura de arquivo e mostra atributos de um item da galeria
main :: IO ()
main = do
    strcontent <- readFile infile				-- lê conteúdo do arquivo em string
    let strlist = map (splitOnChar ';') (lines strcontent)	-- extrai linhas e quebra cada uma delas
        itemlist = map (toGalleryItem) strlist			-- transforma cada linha num GalleryItem
        item = head itemlist 					-- escolhe um item da lista
    putStrLn (title item)					-- mostra titulo do item
    putStrLn (author item)					-- mostra autor do item
    where 
    infile = "data.csv"


-- Funcao que decompoe string usando um caracter delimitador
splitOnChar :: Char -> String -> [String]
splitOnChar x y = auxSplitOnChar x y [[]]

auxSplitOnChar :: Char -> String -> [String] -> [String]
auxSplitOnChar x [] z = reverse (map reverse z)
auxSplitOnChar x (y:ys) (z:zs) = 
	if y == x then 
            auxSplitOnChar x ys ([]:(z:zs)) 
        else 
            auxSplitOnChar x ys ((y:z):zs)
            
