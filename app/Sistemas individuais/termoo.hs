--Imports
import System.Process
import System.IO
import System.Directory

--Termoo
main :: IO()
main = do
  startTermoo
  dBase <- openFile "palavras.txt" ReadMode 
  conteudo <- hGetLine dBase
  termoo 5 150 conteudo

termoo :: Int -> Int -> String -> IO()
termoo life pontos word = do
  texts life pontos word
  tentativa <- getLine
  putStrLn $ " _____________________________________________"
  if length tentativa /= length word  then do 
    erroTamanhoPalavra
    termoo life pontos word
  else verificaWord tentativa word pontos
  if life > 1 then termoo (life - 1) (pontos - 25) word 
  else do 
    gameOver 
    record pontos
  
--Customização da palavra

addSpace:: [Char] -> [Char]
addSpace xs = if length xs == 1
              then xs
              else take (length xs - (length xs - 1)) xs ++ " " ++ addSpace (drop 1 xs)

hiddenWord :: [Char] -> [Char]
hiddenWord xs = ['_' | length xs /= 0, x <- xs];

colorWord :: String -> String -> String -> IO()
colorWord [] [] z = do
  putStrLn $ ""
  return()
colorWord (head:body) (cabeca:corpo) (topo:pilha)= do
  if head == cabeca then do
    putStr $ " \ESC[32m" ++ [head] ++ "\ESC[0m"
    colorWord body corpo (topo:pilha)
  else if head `elem` (topo:pilha) then do
    putStr $ " \ESC[33m" ++ [head] ++ "\ESC[0m"
    colorWord body corpo (topo:pilha)
  else do
    putStr $ " \ESC[90m" ++ [head] ++ "\ESC[0m"
    colorWord body corpo (topo:pilha)

--Verificação da palavra

verificaWord :: String -> String -> Int -> IO()
verificaWord palavraInserida palavraGuardada pontos = 
  if palavraInserida == palavraGuardada then do
    acerto
    record pontos
  else do 
    putStrLn $ ""
    putStr $ " Tentativa anterior: " 
    colorWord palavraInserida palavraGuardada palavraGuardada

--Record
record :: Int -> IO()
record pontos = do 
  putStrLn $ ""
  putStr $ " Insira o seu nome:"
  nomePlayer <- getLine :: IO String
  recordT <- openFile "recordT.txt" AppendMode
  hPutStr recordT nomePlayer
  hPutStr recordT ", "
  hPutStrLn recordT (show pontos)
  hFlush recordT


--Menssagens do jogo

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

startTermoo :: IO()
startTermoo = do
  system "cls"
  putStrLn " +___________________________________________+ "
  putStrLn " |                                           |" 
  putStrLn " |      ▀▀█▀▀ █▀▀ █▀█ █▀▄ ▄▀█ █▀▀█ █▀▀█      |"
  putStrLn " |        █   █▀  █▀▄ █  █  █ █  █ █  █      |"
  putStrLn " |        ▀   ▀▀▀ ▀ ▀ ▀  ▀  ▀ ▀▀▀▀ ▀▀▀▀      |"
  putStrLn " |___________________________________________|"

recordLetreiro :: IO()
recordLetreiro = do
  system "cls"
  putStrLn " +___________________________________________+ "
  putStrLn " |                                           |" 
  putStrLn " |      █▀█ █▀▀ █▀▀▀ █▀▀█ █▀█ █▀▄ █▀▀        |"
  putStrLn " |      █▀▄ █▀  █    █  █ █▀▄ █ █ █▀         |"
  putStrLn " |      ▀ ▀ ▀▀▀ ▀▀▀▀ ▀▀▀▀ ▀ ▀ ▀▀  ▀▀▀        |"
  putStrLn " |___________________________________________|"

texts :: Int -> Int -> String -> IO()
texts life pontos word = do
  putStrLn $ " _____________________________________________"
  putStrLn $ " Tentativas restantes: " ++ show life 
  putStrLn $ ""
  putStrLn $ " Pontos: " ++ show pontos
  putStrLn $ ""
  putStr $ " Palavra: "
  putStrLn $ addSpace $ hiddenWord word
  putStrLn $ ""
  putStr $ " Insira Palavra:  "

--tratamento de erro
erroTamanhoPalavra:: IO()
erroTamanhoPalavra = do
  putStrLn $ ""
  putStrLn $ "\ESC[31mERRO: Tamanho de palavra incorreto\ESC[0m"