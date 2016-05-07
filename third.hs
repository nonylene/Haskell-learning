import Control.Monad
import Data.Char

main = interact respondPalindRomes

shortLinesOnly :: String -> String
shortLinesOnly = unlines . filter (\line -> length line < 10) . lines

respondPalindRomes :: String -> String
respondPalindRomes =
    unlines .
    map (\xs -> if xs == (reverse xs) then "yeah" else "no") .
    lines
