module Letreiros where
import System.Process

gameOver :: IO()
gameOver = do
    system "cls"
    putStrLn " +__________________________________________+ "
    putStrLn " |                                          |" 
    putStrLn " |         █▀█ █▀▀ █▀█ █▀▄ █▀▀ █ █          |" 
    putStrLn " |         █▀▀ █▀  █▀▄ █ █ █▀  █ █          |"
    putStrLn " |         ▀   ▀▀▀ ▀ ▀ ▀▀  ▀▀▀  ▀▀          |"
    putStrLn " |__________________________________________|"


timeIsOver :: IO()
timeIsOver = do
    system "cls"
    putStrLn " +____________________________________________________________+ "
    putStrLn " |                                                            |" 
    putStrLn " |       ▀▀█▀▀ █ █▀▄ ▄▀█ █▀▀  █ █▀▀  █▀▀█ █   █ █▀▀ █▀█       |" 
    putStrLn " |         █   █ █  █  █ █▀▀  █ ▀▀█  █  █  █▄█  █▀▀ █▀▄       |"
    putStrLn " |         ▀   ▀ ▀  ▀  ▀ ▀▀▀  ▀ ▀▀▀  ▀▀▀▀   ▀   ▀▀▀ ▀ ▀       |"
    putStrLn " |____________________________________________________________|"


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

startanagrama :: IO()
startanagrama = do
  system "cls"
  putStrLn " +______________________________________________________+ "
  putStrLn " |                                                       |" 
  putStrLn " |      █▀▀█ █▀█ █ █▀▀█ █▀▀▀ █▀▀█ █▀▀█ █▀▄ ▄▀█ █▀▀█      |"
  putStrLn " |      █▄▄█ █ █ █ █▄▄█ █ ▄▄ █▀▀▄ █▄▄█ █  █  █ █▄▄█      |"
  putStrLn " |      █  █ █ █▄█ █  █ █▄▄█ █  █ █  █ █  █  █ █  █      |"
  putStrLn " |_______________________________________________________|"


menuLetreiro :: IO()
menuLetreiro = do
  system "cls"
  putStrLn " +___________________________________________+ "
  putStrLn " |                                           |" 
  putStrLn " |          █▀▄ ▄▀█ █▀▀ █▀▄  █ █ █           |"
  putStrLn " |          █  █  █ █▀  █  ▀▄█ █ █           |"
  putStrLn " |          ▀  ▀  ▀ ▀▀▀ ▀    ▀  ▀▀           |"
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

creditosLetreiro :: IO()
creditosLetreiro = do 
  system "cls"
  putStrLn " +___________________________________________+ "
  putStrLn " |                                           |" 
  putStrLn " |     █▀▀▀ █▀█ █▀▀ █▀▄ █ ▀▀█▀▀ █▀▀█ █▀▀▀    |"
  putStrLn " |     █    █▀▄ █▀  █ █ █   █   █  █ ▀▀▀█    |" 
  putStrLn " |     ▀▀▀▀ ▀ ▀ ▀▀▀ ▀▀  ▀   ▀   ▀▀▀▀ ▀▀▀▀    |"
  putStrLn " |___________________________________________|"
