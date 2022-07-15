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

startAnagrama :: IO()
startAnagrama = do
  system "cls"
  putStrLn " +_______________________________________________________+ "
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
