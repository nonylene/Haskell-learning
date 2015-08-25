import Data.Char

f 3 = 2  
f x = x + 1
a = f 2
fib n = case n of 
    0 -> 0
    1 -> 1
    _|n > 1 ->  fib(n - 1) + fib (n - 2)
fact n = product [1..n]
hoge x y = (x + y, x- y)


main = do
    print $ fact 3
    print $ fact 4
    print $ fact 5
    print $ fst $ hoge 5 3
    print $ ord 'a'
    print $ chr 65
