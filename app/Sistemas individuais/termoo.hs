termoo :: Int -> String -> IO()
termoo life word = do
  print("--------------------------------------")
  print("Tentativas restantes: " ++ show life )
  print(addSpace (hiddenWord word))
  tentativa <- getLine

  if length tentativa > length word then putStrLn "Insira palavra do tamanho correto." 
  else if life > 1 then termoo (life-1) word 
  else putStrLn "Game Over" 
  -- verificaword tentativa word
  -- if life > 1 then termoo (life-1) word
  -- else putStrLn "Game Over"

addSpace:: [Char] -> [Char]
addSpace xs = if length xs == 1
              then xs
              else take (length xs - (length xs - 1)) xs ++ " " ++ addSpace (drop 1 xs)

hiddenWord :: [Char] -> [Char]
hiddenWord xs = ['_' | length xs /= 0, x <- xs];


main :: IO()
main = do
  termoo 5 "teste"