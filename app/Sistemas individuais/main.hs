import Control.Exception
import System.IO

main :: IO()
main = do
  menuText

--Controle de caminhos
menusController :: Char -> IO()
menusController op = do
  if op == '1' then menuJogos
  else if op == '2' then menuRecordes
  else if op == '3' then creditos
  else if op == '0' then return() 
  else do
    putStrLn $ "Opção invalida insira uma das opções"

--recordesController :: Char -> IO()

--jogosController :: Char -> IO()



--Textos
menuText :: IO()
menuText = do 
  putStrLn $ "Digite 1 : JOGAR"
  putStrLn $ "Digite 2 : RECORDES"
  putStrLn $ "Digite 3 : CREDITOS"
  putStrLn $ "Digite 0 : SAIR"
  op <- getChar
  menusController op

menuJogos :: IO()
menuJogos = do
  putStrLn $ "Digite 1: JOGAR MODO ANAGRAMA"
  putStrLn $ "Digite 2: JOGAR MODO TERMOO"
  putStrLn $ "Digite 0: VOLTAR"
  op <- getChar
  --jogosController 
  

menuRecordes :: IO()
menuRecordes = do
  putStrLn $ "Digite 1: RECORDES MODO ANAGRAMA"
  putStrLn $ "Digite 2: RECORDES MODO TERMOO"
  putStrLn $ "Digite 0: VOLTAR"
  

creditos:: IO()
creditos = do 
  putStrLn $ "Fabio Almendro"
  putStrLn $ "Guilherme de sena fernandes"
  putStrLn $ "Huandrey de Souza Pontes"
  putStrLn $ "Maria das Graças Soares da Costa"
  putStrLn $ "Maysa Freire de Araújo"
  
