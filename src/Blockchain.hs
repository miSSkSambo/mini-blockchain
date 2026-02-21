module Blockchain where

import Types
import Ledger
import Data.Hashable (hash)
import Data.List (foldl')

data Block = Block
  { index        :: Int
  , previousHash :: Int
  , transactions :: [Tx]
  , blockHash    :: Int
  } deriving (Show)

data Blockchain = Blockchain
  { chain  :: [Block]
  , ledger :: Ledger
  } deriving (Show)

-- Process all transactions in a block
processBlock :: Ledger -> [Tx] -> Either String Ledger
processBlock = foldl' step . Right
  where
    step (Left err) _ = Left err
    step (Right led) tx = applyTx led tx

-- Compute block hash
computeHash :: Int -> Int -> [Tx] -> Int
computeHash idx prev txs =
  hash (show idx ++ show prev ++ show txs)

-- Add block to chain
addBlock :: Blockchain -> [Tx] -> Either String Blockchain
addBlock bc txs = do
  newLedger <- processBlock (ledger bc) txs

  let prevHash =
        if null (chain bc)
          then 0
          else blockHash (last (chain bc))

  let idx = length (chain bc)
  let newHash = computeHash idx prevHash txs
  let newBlock = Block idx prevHash txs newHash

  return $ Blockchain
    { chain = chain bc ++ [newBlock]
    , ledger = newLedger
    }

-- Validate entire blockchain
validateChain :: Blockchain -> Bool
validateChain bc =
  all validBlock (zip [0..] (chain bc))
  where
    validBlock (i, block)
      | i == 0 =
          blockHash block ==
          computeHash (index block) 0 (transactions block)
      | otherwise =
          let prev = chain bc !! (i - 1)
          in previousHash block == blockHash prev
             && blockHash block ==
                computeHash (index block)
                            (previousHash block)
                            (transactions block)
