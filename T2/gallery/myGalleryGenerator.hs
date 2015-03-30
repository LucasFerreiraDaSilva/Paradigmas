-- Lucas Ferreira da Silva

import Text.Printf
import Data.List

-- Conteudo da galeria (constante neste exemplo)
galleryItems :: [(String, String)]
galleryItems =
	[("T1_1.png","Trabalho1"),
	 ("T2_1.png","Trabalho2"),
	 ("T3_1.png","Trabalho3")]
	 
-- Gera div HTML para exibir imagem com titulo
-- Funcionamento: gera uma string com printf, colocando argumentos nos lugares certos
imageDiv :: (String, String) -> String
imageDiv (imgfile, title) = 
	printf "<div class=\"left\"> <a href=\"image.html?src=./images/%s&height=450&alt=%s\"><img src=\"./images/%s\" width=\"100\" height=\"100\" border=\"0\" /></a><br /><p>%s</p></div>\n" imgfile title imgfile title
 
-- Preenche template HTML, substituindo o comentario por um novo conteudo
fillHtml :: String -> String -> String
fillHtml htmltemplate content = replace "<!--@content-->" content htmltemplate

-- Complete esta funcao de forma a aplicar imageDiv a cada um dos itens da galeria
-- O resultado final deve ser uma unica string (e nao uma lista de strings)

-- genContent usando funcao de alta ordem
genContent :: [(String,String)] -> String
genContent elem = concatMap (imageDiv) elem

-- genContent usando list comprehension
genContentLC :: [(String,String)] -> String
genContentLC elem = foldr1 (++) [imageDiv elem | elem <- elem]

-- main
main :: IO ()
main = do
    htmltemplate <- readFile infile
    putStrLn ("Gerando arquivo " ++ outfile)
    writeFile outfile (fillHtml htmltemplate (genContent galleryItems))
    putStrLn "Feito!"
    where 
    infile = "template.html"
    outfile = "gallery.html"

{--
	Funcoes auxiliares definidas aqui para evitar importacao de bibliotecas
--}

-- Divide string usando outra string como delimitadora
splitOn :: Eq a => [a] -> [a] -> [[a]]
splitOn []    _  = error "splitOn: empty delimiter"
splitOn delim xs = loop xs
    where loop [] = [[]]
          loop xs | delim `isPrefixOf` xs = [] : splitOn delim (drop len xs)
          loop (x:xs) = let (y:ys) = splitOn delim xs
                         in (x:y) : ys
          len = length delim
            
-- Substitui old por new em list
replace :: Eq a => [a] -> [a] -> [a] -> [a]
replace old new list = intercalate new . splitOn old $ list


