module Letreiros where
import System.Process

startTermoo :: IO()
startTermoo = do
  system "cls"
  putStrLn " +___________________________________________+ "
  putStrLn " |                                           |" 
  putStrLn " |      ▀▀█▀▀ █▀▀ █▀█ █▀▄ ▄▀█ █▀▀█ █▀▀█      |"
  putStrLn " |        █   █▀  █▀▄ █  █  █ █  █ █  █      |"
  putStrLn " |        ▀   ▀▀▀ ▀ ▀ ▀  ▀  ▀ ▀▀▀▀ ▀▀▀▀      |"
  putStrLn " |___________________________________________|"

regrasTermoo :: IO()
regrasTermoo = do
system "cls"
putStrLn " +___________________________________________+ "
putStrLn " A cada nova palavra, você inicia o jogo com 150 pontos. "
putStrLn " Para cada tentativa que você não acertar a palavra, você perde 25 pontos, "
putStrLn " ou seja, se você acertar a palavra de primeira, pontua 150 pontos,"
putStrLn " se acertar na segunda pontua 125 pontos e assim respectivamente.  "
putStrLn " Ao final de cada palavra acertada, a pontuação é somada ao total de pontos. "
putStrLn " Caso suas vidas acabem, o jogo será encerrado. "
putStrLn " _______________________________________________ "
putStrLn " Se a letra aparecer verde: ela está na palavra e na posição correta. "
putStrLn " Se a letra aparecer amarela: ela está na palavra, mas a posição está incorreta. "
putStrLn " Se a letra aparecer vermelha: ela não está na palavra. "


