import Control.Exception
import System.IO


{-
TO DO

type Dados = 
Dados do bando de dados
-}
main :: IO()
main = do --Selecionar dados e iniciar jogo
  

sair :: IO()
sair putStrLn "FIM DE JOGO, Obrigado por jogar!"

menu :: dados -> IO()
menu dados = do --Menu Principal
  putStrLn "-------------------------------- MENU --------------------------------"
		putStrLn "\nDigite 1 : Novo Jogo"
		putStrLn "Digite 2 : Ranking"
		putStrLn "Digite 3 : Créditos"
		putStrLn "Digite 0 : Sair"
		putStr "Opção: "
		op <- getChar
		getChar -- descarta o Enter
		executarOpcao op dados op


executarOpcao :: Char-> dados ->
executatOpcao dados op = do
  case op of 
    '1' -> novoJogo dados
    '2' -> menuRanking dados
     _  -> putStrLn "ExArgumentoInvalido"

menuRanking :: Dados -> IO()
menuRanking dados = do --Menu para ver rankings
  putStrLn "-------------------------------- SCORE --------------------------------"
	putStrLn "\nDigite 1 : ADIVINHA PALAVRA"
  putStrLn "Digite 2 : ANAGRAMA"
	putStrLn "Digite 0 : Voltar"
	putStr "Opção: "
  tipoScore <- getChar
  getChar -- descarta o Enter
  ranking tipoScore dados 

score :: Char -> Dados 
score op dados = do
  case op of
    '1' -> scoreAdivinha dados
    '2' -> scoreAnagrama dados
    '0' -> menu dados
    _ -> putStrLn "ExArgumentoInvalido"
