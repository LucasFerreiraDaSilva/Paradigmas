--
-- Este programa lÃª um arquivo CSV, com 2 dados por linha. Cada linha Ã© transformada numa tupla. 
-- A lista de tuplas será passada para uma função que vai gerar uma longa string representando um
-- documento HTML.
--

main :: IO ()
main = do
    strcontent <- readFile infile
    let listofstrlist = map (splitOnChar ',') (lines strcontent)
        strtuplelist = map (\lis -> (head lis, last lis)) listofstrlist
    writeFile outfile (mkHtmlURLItemsDoc "Usuarios Cadastrados no NCC" strtuplelist)
    where 
    infile = "logins.csv"
    outfile = "output.html"


-- Esta função deve ser alterada para chamar outras funções que vão
-- construir o documento HTML
mkHtmlURLItemsDoc :: String -> [(String,String)] -> String
mkHtmlURLItemsDoc title lis = "<html><head>\n<title>"++title++"</title>\n</head>\n</body>\n<ul>" ++ (foldr1 (++) (map (++"</a></li>\n") ((geraLink (map fst lis) (map snd lis))))) ++ "<html><body><ul>"

geraLink :: [String] -> [String] -> [String]
geraLink x y
    | (x == []) = []
	| (y == []) = []
    | otherwise = ("<li><a href=http://www.inf.ufsm.br/~"++ (head y)++ ">" ++ (head x)) : geraLink (tail x) (tail y)


-- Decompoe string usando um caracter delimitador
splitOnChar :: Char -> String -> [String]
splitOnChar x y = auxSplitOnChar x y [[]]

auxSplitOnChar :: Char -> String -> [String] -> [String]
auxSplitOnChar x [] z = reverse (map reverse z)
auxSplitOnChar x (y:ys) (z:zs) = 
	if y == x then 
            auxSplitOnChar x ys ([]:(z:zs)) 
        else 
            auxSplitOnChar x ys ((y:z):zs)