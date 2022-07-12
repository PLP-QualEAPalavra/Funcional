termoo :: Int -> String -> IO()
termoo vidas palavra = do
  print("--------------------------------------")
  print("Tentativas restantes: " ++ show vidas )
  print(escondePalavra palavra)
  tentativa <- getLine
  verificaPalavra tentativa palavra
  if vidas > 1 then termoo (vidas-1) palavra
  else putStrLn "Game Over"

escondePalavra :: String -> String
escondePalavra (h:t) = 
  if t /= "" then ['_'] ++ [' '] ++ escondePalavra t 
  else ['_'] ++ [' ']


main :: IO()
main = do
  termoo 5 "teste"