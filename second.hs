{-# OPTIONS -Wall #-}
import Control.Monad
-- main = do
--     line <- getLine
--     when (not $ null line) $ do putStrLn $ reverse line
--     if null line
--         then return ()
--         else putStrLn $ reverse line
--
main = do
    colors <- forM [1,2,3,4] $ \a -> do
        putStrLn $ "Which color do you associate with the number "
            ++ show a ++ "!"
        getLine
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    mapM putStrLn colors


