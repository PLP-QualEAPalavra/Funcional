module RegrasAnagramas where
import qualified Letreiros




regrasAnagrama :: IO()
regrasAnagrama = do
  Letreiros.startAnagrama
  putStrLn " +___________________________________________+ "
  putStrLn " O jogador pode tentar infinitas vezes contanto que "
  putStrLn " não não ultrapasse o tempo de 10 minutos. "
  putStrLn " Nesse modo existe um conjunto de palavras com caracteres "
  putStrLn " em comum e o jogador deve encontrar uma combinação que "
  putStrLn " que forme uma palavra. "
  putStrLn " A cada palavra acertada, você ganha 10 pontos, sendo "
  putStrLn " somado no seu total de pontos. "
  putStrLn " Quando acerta uma palavra em sequência, aumentará "
  putStrLn " um multiplicador, por exemplo com o acerto de uma palavra  "
  putStrLn " é alcançado 10 pontos, com o acerto de outra em seguida se "
  putStrLn " consegue 20 pontos. "
  putStrLn " A cada tentativa errada se perde 1 ponto.  "
  putStrLn " A partida acaba quando é alcançado o limite do tempo ou se "
  putStrLn " acertando todas as palavras do anagrama. "
