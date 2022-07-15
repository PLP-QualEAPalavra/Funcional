import qualified Letreiros
import Control.Exception
import System.IO
import System.Exit
import System.Process
import System.Directory

main :: IO()
main = do
  menuText

--Textos
menuText :: IO()
menuText = do
    Letreiros.menuLetreiro
    putStrLn $ " _____________________________________________"
    putStrLn $ " Digite 1 : JOGAR"
    putStrLn $ " Digite 2 : RECORDES"
    putStrLn $ " Digite 3 : CREDITOS"
    putStrLn $ " Digite 0 : SAIR"
    putStrLn $ " _____________________________________________"
    putStr $ " Qual a sua opção:  "
    op <- getChar
    getChar
    menusController op

menuJogos :: IO()
menuJogos = do
  Letreiros.menuLetreiro
  putStrLn $ " _____________________________________________"
  putStrLn $ " Digite 1: JOGAR MODO ANAGRAMA"
  putStrLn $ " Digite 2: JOGAR MODO TERMOO"
  putStrLn $ " Digite 0: VOLTAR"
  putStrLn $ " _____________________________________________"
  putStr $ " Qual a sua opção:  "
  op <- getChar
  getChar
  jogosController op
  

menuRecordes :: IO()
menuRecordes = do
  Letreiros.menuLetreiro
  putStrLn $ " _____________________________________________"
  putStrLn $ " Digite 1: RECORDES MODO ANAGRAMA"
  putStrLn $ " Digite 2: RECORDES MODO TERMOO"
  putStrLn $ " Digite 0: VOLTAR"
  putStrLn $ " _____________________________________________"
  putStr $ " Qual a sua opção:  "
  op <- getChar
  getChar
  recordesController op

creditos:: IO()
creditos = do 
  Letreiros.creditosLetreiro
  putStrLn $ " _____________________________________________"
  putStrLn $ " Fabio Almendro"
  putStrLn $ " Guilherme de sena fernandes"
  putStrLn $ " Huandrey de Souza Pontes"
  putStrLn $ " Maria das Graças Soares da Costa"
  putStrLn $ " Maysa Freire de Araújo"
  putStrLn $ " _____________________________________________"
  putStrLn $ " Pressione 'enter' para voltar "
  putStrLn $ " _____________________________________________"
  putStr $ " "
  op <- getChar
  menuText
  

--Controle de caminhos
menusController :: Char -> IO()
menusController op = do
  if op == '1' then menuJogos
  else if op == '2' then menuRecordes
  else if op == '3' then creditos
  else if op == '0' then exitSuccess
  else do
    putStrLn $ "Opção invalida insira uma das opções"
    menuText

recordesController :: Char -> IO()
recordesController op = do
    if op == '2' then mainRecord
    else if op == '0' then menuText
    else do
        putStrLn $ "Opção invalida insira uma das opções"
        menuRecordes


jogosController :: Char -> IO()
jogosController op = do
  if op == '2' then mainTermoo
  --else if op == '2' then mainAnagrama
  --else if op == '3' then creditos
  else if op == '0' then menuText
  else do
    putStrLn $ "Opção invalida insira uma das opções"
    menuJogos

--Termoo
mainTermoo :: IO()
mainTermoo = do
  Letreiros.startTermoo
  dBase <- readFileLines "palavras.txt" 
  termoo 5 150 dBase

termoo :: Int -> Int -> [String] -> IO()
termoo life pontos [] = do
  record pontos
  menuText
termoo life pontos (primeiraPalavra:resto) = do
  texts life pontos primeiraPalavra
  tentativa <- getLine
  putStrLn $ " _____________________________________________"
  if length tentativa /= length primeiraPalavra  then do 
    erroTamanhoPalavra
    termoo life pontos (primeiraPalavra:resto)
  else do
    if tentativa == primeiraPalavra then do
      Letreiros.acerto
      termoo 5 (pontos+150) resto
    else do 
      putStrLn $ ""
      putStr $ " Tentativa anterior: " 
      colorWord tentativa primeiraPalavra primeiraPalavra 
  if life > 1 then termoo (life - 1) (pontos - 25) (primeiraPalavra:resto)
  else do 
    Letreiros.gameOver 
    record pontos
    menuText
  
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

--Pegar palavras
readFileLines :: FilePath -> IO [String]
readFileLines = fmap lines.readFile


--Record
record :: Int -> IO()
record pontos = do 
  putStrLn $ ""
  putStr $ " Insira o seu nome:"
  nomePlayer <- getLine :: IO String
  recordStr <- openFile "recordTermoName.txt" AppendMode
  hPutStr recordStr nomePlayer
  hFlush recordStr
  hClose recordStr
  recordInt <- openFile "recordTermoPontos.txt" AppendMode
  hPutStrLn recordInt (show pontos)
  hFlush recordInt
  hClose recordInt


--Menssagens do jogo
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

--Recordes
mainRecord:: IO()
mainRecord = do 
    Letreiros.recordLetreiro
    arqNames <- readFileLines "recordTermoName.txt"
    arqPontos <- readFileLines "recordTermoPontos.txt"
    laco1 arqNames arqPontos $ ordena (converIntList arqPontos)
    putStrLn $ " _____________________________________________" 
    putStrLn $ "         Pressione enter para voltar!" 
    putStrLn $ " _____________________________________________"
    putStr $ " "
    op <- getChar
    recordesController op

converIntList :: [String] -> [Int]
converIntList [] = []
converIntList (x1:xn) = [read x1::Int] ++ converIntList xn

getMaior :: [Int] -> Int
getMaior [x] = x
getMaior (x1:xn) = 
  if x1 > getMaior xn then x1
  else getMaior xn

remove_maior :: [Int] -> [Int]
remove_maior [] = []
remove_maior (x1:xn) = 
  if x1 == (getMaior $ x1:xn) then xn
  else (x1:remove_maior xn)

aux_ordena :: [Int] -> [Int] -> [Int]
aux_ordena lista_ordenada [] = lista_ordenada
aux_ordena lista_ordenada (x1:xn) = aux_ordena (lista_ordenada++[getMaior (x1:xn)]) (remove_maior(x1:xn))


ordena :: [Int] -> [Int] 
ordena lista = aux_ordena [] lista

laco1 :: [String] -> [String] -> [Int] -> IO()
laco1 listaN listaP []   = return()
laco1 (n1:nn) (p1:pn) (i1:is)  = do
  laco2 (n1:nn) (p1:pn) i1
  laco1 (n1:nn) (p1:pn) is 

laco2 :: [String] -> [String] -> Int -> IO()
laco2 [] [] mPonto = return()
laco2 (n1:nn) (p1:pn) mPonto = do
  let valor = read p1 :: Int
  if valor == mPonto then do 
    putStr "  Jogador: "
    putStr  n1
    putStr  "  | Pontuacao: "
    putStrLn p1
  else laco2 nn pn mPonto
