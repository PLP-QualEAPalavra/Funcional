{-# LANGUAGE OverloadedStrings #-}
module LocalDB.ConnectionDB where
import Database.PostgreSQL.Simple

localDB:: ConnectInfo
localDB = defaultConnectInfo {
    connectHost = "localhost",
    connectDatabase = "palavras",
    connectUser = "postgres",
    connectPassword = "postgres",
    connectPort = 5432
}

connectionMyDB :: IO Connection
connectionMyDB = connect localDB

createPalavras :: Connection -> IO()
createPalavras conn = do
    execute_ conn "CREATE TABLE IF NOT EXISTS palavras"
    return ()

iniciandoDatabase :: IO Connection
iniciandoDatabase = do
		c <- connectionMyDB
		createPalavras c
		return c