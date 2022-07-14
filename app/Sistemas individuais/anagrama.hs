--Imports
import System.Process
import System.IO
import System.Directory
import Data.Char (toUpper)

--anagrama
main :: IO()
main = do
  startanagrama
  dBase <- readFileLines "../palavras.txt" 
  anagrama 150 dBase

takeI:: Int -> Int
takeI 4 = 1;
takeI 3 = 2;
takeI 2 = 3;
takeI 1 = 4;
takeI 0 = 5;

acertos:: [String] -> String
-- acertos [] = ""
acertos (x:xs) = if length x >= 1 then do
  "Voce ja acertou " ++ x
  else acertos xs

colorWord :: String -> String -> String -> Int -> IO()
colorWord [] [] z position = do
  putStrLn $ ""
  return()
colorWord (head:body) (cabeca:corpo) (topo:pilha) position = do
  if head == cabeca then do
    putStr $ " \ESC[32m" ++ [head] ++ "\ESC[0m"
    colorWord body corpo (topo:pilha) position
  else if head `elem` (topo:pilha) then do
    putStr $ " \ESC[33m" ++ [head] ++ "\ESC[0m"
    colorWord body corpo (topo:pilha) position
  else do
    putStr $ " \ESC[90m" ++ [head] ++ "\ESC[0m"
    colorWord body corpo (topo:pilha) position

criaLista:: [String] -> String -> [String]
criaLista words tentativa = [word | word <- words, word /= tentativa]

checkWordIsCorrect :: String -> [String] -> IO ()
checkWordIsCorrect _ [] = do
  putStrLn $ ""
  return()
checkWordIsCorrect tentativa (word : words) = 
  if tentativa == word then do
    putStrLn $ " Voce acertou a palavra " ++ show (takeI (length words)) ++ "\n" ++ " " ++ word
    -- drop (takeI (length words - 1)) words
    -- colorWord tentativa word word (takeI (length words))
  else do 
    checkWordIsCorrect tentativa words
    -- colorWord tentativa word word (takeI (length words))


-- upper :: String -> String
-- upper [x] = toUpper [x]
-- upper (w:ws) = toUpper (ws) ++ upper ws

reverser :: String -> String
reverser [x] = [x]
reverser word = reverse word

joinWord :: [String] -> String
joinWord [] = ""
joinWord (w:ws) = reverser (w) ++ joinWord ws 

removeDup :: String -> String
removeDup [] = [] 
removeDup [a] = [a] 
removeDup (x:xs) = x:(removeDup $ filter (/=x) xs)

anagrama :: Int -> [String] -> IO()
-- anagrama pontos [] = do
  --  record pontos



anagrama pontos xs = do
  putStrLn $ ""
  putStrLn $ " Forme o maior número possível de palavras usando as letras disponíveis."
  putStrLn $ ""
  putStrLn $ " " ++ addSpace (removeDup (joinWord xs))
  texts pontos xs
  tentativa <- getLine :: IO String
  putStrLn $ " _____________________________________________"
  
  if length tentativa > 0 then do
    checkWordIsCorrect tentativa xs
    anagrama pontos xs
  else anagrama pontos xs
  
--Customização da palavra
addSpace:: [Char] -> [Char]
addSpace xs = if length xs == 1
              then xs
              else take (length xs - (length xs - 1)) xs ++ " " ++ addSpace (drop 1 xs)

hiddenWord :: [Char] -> [Char]
hiddenWord xs = ['_' | length xs /= 0, x <- xs];

--Pegar palavras
readFileLines :: FilePath -> IO [String]
readFileLines = fmap lines.readFile

gameOver :: IO()
gameOver = do
    system "cls"
    putStrLn " +__________________________________________+ "
    putStrLn " |                                          |" 
    putStrLn " |         █▀█ █▀▀ █▀█ █▀▄ █▀▀ █ █          |" 
    putStrLn " |         █▀▀ █▀  █▀▄ █ █ █▀  █ █          |"
    putStrLn " |         ▀   ▀▀▀ ▀ ▀ ▀▀  ▀▀▀  ▀▀          |"
    putStrLn " |__________________________________________|"

acerto :: IO()
acerto = do
  system "cls"
  putStrLn " +__________________________________________+ "
  putStrLn " |                                          |" 
  putStrLn " |       █▀▀█ █▀▀▀ █▀▀ █▀█ ▀▀█▀▀ █▀▀█       |"
  putStrLn " |       █▄▄█ █    █▀  █▀▄   █   █  █       |"
  putStrLn " |       █  █ █▄▄▄ █▄▄ █ █   █   █▄▄█       |"
  putStrLn " |__________________________________________|"

startanagrama :: IO()
startanagrama = do
  system "cls"
  putStrLn " +______________________________________________________+ "
  putStrLn " |                                                       |" 
  putStrLn " |      █▀▀█ █▀█ █ █▀▀█ █▀▀▀ █▀▀█ █▀▀█ █▀▄ ▄▀█ █▀▀█      |"
  putStrLn " |      █▄▄█ █ █ █ █▄▄█ █ ▄▄ █▀▀▄ █▄▄█ █  █  █ █▄▄█      |"
  putStrLn " |      █  █ █ █▄█ █  █ █▄▄█ █  █ █  █ █  █  █ █  █      |"
  putStrLn " |_______________________________________________________|"

recordLetreiro :: IO()
recordLetreiro = do
  system "cls"
  putStrLn " +___________________________________________+ "
  putStrLn " |                                           |" 
  putStrLn " |      █▀█ █▀▀ █▀▀▀ █▀▀█ █▀█ █▀▄ █▀▀        |"
  putStrLn " |      █▀▄ █▀  █    █  █ █▀▄ █ █ █▀         |"
  putStrLn " |      ▀ ▀ ▀▀▀ ▀▀▀▀ ▀▀▀▀ ▀ ▀ ▀▀  ▀▀▀        |"
  putStrLn " |___________________________________________|"

iteraText:: [String] -> String
iteraText [] = ""
iteraText (x:xs) = if length xs >= 0 then
  "   Palavra " ++ show (takeI (length xs)) ++ " " ++ addSpace (hiddenWord x) ++ "\n" ++ iteraText xs
  else ""

texts :: Int -> [String] -> IO()
texts pontos words = do
  putStrLn $ " _____________________________________________"
  putStrLn $ ""
  putStrLn $ " Tentativas restantes: ATE ACERTAR"
  putStrLn $ ""
  -- putStrLn $ " Pontos: " ++ show pontos
  putStrLn $ ""
  putStrLn $ iteraText $ words
  putStrLn $ ""
  putStr $ " Insira Palavra:  "

--tratamento de erro
erroTamanhoPalavra:: IO()
erroTamanhoPalavra = do
  putStrLn $ ""
  putStrLn $ "\ESC[31mERRO: Tamanho de palavra incorreto\ESC[0m"
