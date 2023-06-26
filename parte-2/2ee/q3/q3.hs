import Control.Concurrent
import Control.Concurrent.MVar
import Control.Concurrent.STM
import Text.Printf

-- Aline Gouveia (amtg)
-- II Exercício Escolar - PLC (Q2)

main :: IO ()
main = do
    pepsiCola <- newTVarIO 2000
    poloNorte <- newTVarIO 2000
    quate <- newTVarIO 2000

    lockMaquina <- newMVar 0
    codCliente <- newMVar 1

    forkIO(produtor pepsiCola poloNorte quate lockMaquina)
    forkIO(consumidor pepsiCola poloNorte quate lockMaquina codCliente 0)
    forkIO(consumidor pepsiCola poloNorte quate lockMaquina codCliente 1)
    forkIO(consumidor pepsiCola poloNorte quate lockMaquina codCliente 2)
    return ()

produtor :: TVar Int -> TVar Int -> TVar Int -> MVar Int -> IO ()
produtor pepsiCola poloNorte quate lockMaquina = do
    abastecerPepsiCola
    abastecerPoloNorte
    abastecerQuate
    produtor pepsiCola poloNorte quate lockMaquina
    where
        abastecerPepsiCola = do
            estoquePepsiCola <- atomically (readTVar pepsiCola)
            if estoquePepsiCola <= 1000
            then do
                diretoUsoMaquina <- takeMVar lockMaquina
                threadDelay 1500
                atomically (writeTVar pepsiCola (estoquePepsiCola+1000))
                printf "🥤 O refrigerante %s foi reabastecido com 1000ml, e agora possui %d ml\n" "Pepsi Cola" (estoquePepsiCola+1000)
                putMVar lockMaquina diretoUsoMaquina
            else return() 

        abastecerPoloNorte = do
            estoquePoloNorte <- atomically (readTVar poloNorte)
            if estoquePoloNorte <= 1000
            then do
                diretoUsoMaquina <- takeMVar lockMaquina
                threadDelay 1500
                atomically (writeTVar poloNorte (estoquePoloNorte+1000))
                printf "🥤 O refrigerante %s foi reabastecido com 1000ml, e agora possui %d ml\n" "Guaraná Polo Norte" (estoquePoloNorte+1000)
                putMVar lockMaquina diretoUsoMaquina
            else return ()

        abastecerQuate = do
            estoqueQuate <- atomically (readTVar quate)
            if estoqueQuate <= 1000
            then do
                diretoUsoMaquina <- takeMVar lockMaquina
                threadDelay 1500
                atomically (writeTVar quate (estoqueQuate+1000))
                printf "🥤 O refrigerante %s foi reabastecido com 1000ml, e agora possui %d ml\n" "Guaraná Quate" (estoqueQuate+1000)
                putMVar lockMaquina diretoUsoMaquina
            else return ()

consumidor :: TVar Int -> TVar Int -> TVar Int -> MVar Int -> MVar Int -> Int -> IO ()
consumidor pepsiCola poloNorte quate lockMaquina codCliente tipoRefri = do
    case tipoRefri of
        0 -> do
            estoque <- atomically (readTVar pepsiCola)
            if estoque >= 300
            then do
                diretoUsoMaquina <- takeMVar lockMaquina
                cod <- takeMVar codCliente
                printf "• O cliente %d do refrigerante %s está enchendo seu copo\n" cod "Pepsi Cola"
                threadDelay 1000
                atomically (writeTVar pepsiCola (estoque-300))
                putMVar codCliente (cod+1)
                putMVar lockMaquina diretoUsoMaquina
            else do
                consumidor pepsiCola poloNorte quate lockMaquina codCliente tipoRefri
        1 -> do
            estoque <- atomically (readTVar poloNorte)
            if estoque >= 300
            then do
                diretoUsoMaquina <- takeMVar lockMaquina
                cod <- takeMVar codCliente
                printf "• O cliente %d do refrigerante %s está enchendo seu copo\n" cod "Guaraná Polo Norte"
                threadDelay 1000
                atomically (writeTVar poloNorte (estoque-300))
                putMVar codCliente (cod+1)
                putMVar lockMaquina diretoUsoMaquina
            else do
                consumidor pepsiCola poloNorte quate lockMaquina codCliente tipoRefri
        n -> do
            estoque <- atomically (readTVar quate)
            if estoque >= 300
            then do
                diretoUsoMaquina <- takeMVar lockMaquina
                cod <- takeMVar codCliente
                printf "• O cliente %d do refrigerante %s está enchendo seu copo\n" cod "Guaraná Quate"
                threadDelay 1000
                atomically (writeTVar quate (estoque-300))
                putMVar codCliente (cod+1)
                putMVar lockMaquina diretoUsoMaquina
            else do
                consumidor pepsiCola poloNorte quate lockMaquina codCliente tipoRefri

    consumidor pepsiCola poloNorte quate lockMaquina codCliente tipoRefri