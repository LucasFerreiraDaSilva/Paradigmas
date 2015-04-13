import Data.Char

geraLogin :: String -> String
geraLogin nome = map (toLower) $ (head nome) : reverse (takeWhile (>' ')(reverse nome))

main :: IO ()
main = do
    strcontent <- readFile "nomes.csv"
    let strlist = lines strcontent
    	strnew1 = strlist
    	strnew2 = map (","++) (map (geraLogin) strlist)
    	strnew3 = zipWith (++) (strnew1) (strnew2)
    writeFile "logins.csv" (unlines strnew3)

