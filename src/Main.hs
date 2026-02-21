module Main where

import qualified Data.Map as Map
import Types
import Blockchain

genesis :: Blockchain
genesis = Blockchain
  { chain = []
  , ledger = Map.fromList
      [ ("Alice", 1000000)
      , ("Bob", 500000)
      , ("Charlie", 0)
      ]
  }

simulate :: IO ()
simulate = do
  let txs1 =
        [ Tx "Alice" "Bob" 100000
        , Tx "Bob" "Charlie" 50000
        ]

  let txs2 =
        [ Tx "Charlie" "Alice" 20000
        ]

  let txs3 =
        [ Tx "Alice" "Charlie" 30000
        ]

  case addBlock genesis txs1 of
    Left err -> putStrLn err
    Right bc1 ->
      case addBlock bc1 txs2 of
        Left err -> putStrLn err
        Right bc2 ->
          case addBlock bc2 txs3 of
            Left err -> putStrLn err
            Right finalChain -> do
              putStrLn "\n📦 Full Blockchain:"
              mapM_ print (chain finalChain)

              putStrLn "\n💰 Final Ledger:"
              print (ledger finalChain)

              putStrLn "\n🔍 Chain Valid?"
              print (validateChain finalChain)

main :: IO ()
main = do
  putStrLn "🚀 Advanced Mini Blockchain Simulator"
  simulate
