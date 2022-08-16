module RegrasTermoo where
import qualified Letreiros

regrasTermoo :: IO()
regrasTermoo = do
  Letreiros.startTermoo
  putStrLn " +___________________________________________+ "
  putStrLn " A cada nova palavra, você inicia o jogo com"
  putStrLn " 150 pontos. Para cada tentativa que você não "
  putStrLn " acertar a palavra, você perde 25 pontos,ou "
  putStrLn " seja, se você acertar a palavra de primeira,"
  putStrLn " pontua 150 pontos, se acertar na segunda"
  putStrLn " pontua 125 pontos e assim respectivamente.  "
  putStrLn " Ao final de cada palavra acertada, a pontuação"
  putStrLn " Caso suas vidas acabem, o jogo será encerrado."
  putStrLn " é somada ao total de pontos. "
  putStrLn " _______________________________________________ "
  putStrLn " Se a letra aparecer verde: ela está na palavra"
  putStrLn " e na posição correta. "
  putStrLn " Se a letra aparecer amarela: ela está na palavra,"
  putStrLn " mas a posição está incorreta. "
  putStrLn " Se a letra aparecer vermelha: ela não está na"
  putStrLn " palavra."
  putStrLn " _____________________________________________" 
  putStrLn "         Pressione enter para começar!" 
  putStrLn " _____________________________________________"

