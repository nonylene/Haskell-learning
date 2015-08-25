{-# OPTIONS -Wall #-}
import Data.List
import qualified Data.Map as Map
factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n - 1)
circumference :: Float -> Float
circumference n = 2 * pi * n


headD :: [a] -> [a]
headD [] = error "cannot"
headD xs@(x:_) = x : xs

addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (a, b) (c, d) = (a + b ,c  +d)

bmiTell :: Double -> Double -> String
bmiTell weight height
    | bmi <= skinny = "emo"
    | otherwise = "You are too fat"
    where bmi = weight / height ^ 2
          (skinny, normal, fat) = (18.5, 25.0, 30.0)


cylinder :: Double -> Double -> Double
cylinder r h =
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea

describeList :: [a] -> String
describeList ls = "The list is" ++ what ls
    where what []  = "empty"
          what [x] = "singleton"
          what xs = "other"

nonymax :: Ord a => [a] -> a
nonymax [] = error "empty..."
nonymax [x] = x
nonymax (x:xs) = max x (nonymax xs)

nonyReplicate :: Int -> a -> [a]

nonyReplicate x y
    | x <= 0 = []
    | otherwise = y : nonyReplicate (x-1) y

nonyTake :: Int -> [a] -> [a]
nonyTake x y
    | x <= 0 = []
nonyTake _ [] = []
nonyTake x (y:ys) = y : nonyTake (x-1) ys

nonyReverse :: [a] -> [a]
nonyReverse [] = []
nonyReverse (x:xs) = nonyReverse xs ++ [x]

nonyRepeat :: a -> [a]
nonyRepeat a = a : nonyRepeat a

nonyZip :: [a] -> [b] -> [(a,b)]
nonyZip _ [] = []
nonyZip [] _ = []
nonyZip (a:as) (b:bs) = (a,b) : nonyZip as bs

nonyElem :: (Eq a) => a -> [a] -> Bool
nonyElem a [] = False
nonyElem a (x:xs) = a == x || nonyElem a xs

quickSort :: (Ord a) => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort [y | y <- xs, y <= x] ++ [x] ++ quickSort [y | y <- xs, y > x]

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

nonyZipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
nonyZipWith _ [] _ = []
nonyZipWith _ _ [] = []
nonyZipWith f (x:xs) (y:ys) = f x y : nonyZipWith f xs ys

nonyFlip :: (a -> b -> c) -> (b -> a -> c)
nonyFlip f a b = f b a

nonyMap :: (a -> b) -> [a] -> [b]
nonyMap _ [] = []
nonyMap f (x:xs) = f x : nonyMap f xs

nonyFilter :: (a -> Bool) -> [a] -> [a]
nonyFilter _ [] = []
nonyFilter f (x:xs) = (if f x then [x] else []) ++ nonyFilter f xs

colattz :: Integer -> [Integer]
colattz x
    | x == 1 = [1]
    | even x = x : colattz (div x 2)
    | otherwise = x : colattz (x * 3 + 1)

nonySum :: (Num a) => [a] -> a
nonySum = foldl (+) 0

nonyElem' :: (Eq a) => a -> [a] -> Bool
nonyElem' y = foldr (\x acc -> acc || x == y) False

nonyMaximum :: (Ord a) => [a] -> a
nonyMaximum = foldl1 max

nonyReverse' :: [a] -> [a]
nonyReverse' = foldl (flip (:)) []

nonyFilter' :: (a -> Bool) -> [a] -> [a]
nonyFilter' f = foldr (\x acc -> (if f x then [x] else []) ++ acc) []

nonyLast :: [a] -> a
nonyLast = foldr1 (\_ x -> x )

nonyIndexNum :: (Eq a) => [a] -> [a]-> Int
nonyIndexNum x y = length . filter (isPrefixOf x) $ tails y

findKey :: (Eq k) => k -> [(k, a)] -> Maybe a
findKey key xs = foldr (\x acc -> if fst x == key then Just $ snd x else acc) Nothing xs

nonyMapWith :: (Ord a) => [(a, [String])] -> Map.Map a [String]
nonyMapWith xs = Map.fromListWith (++) xs

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float | Rectangle Point Point
    deriving (Show)

area :: Shape -> Float
area (Circle _ r) = pi * r ^ 2
area (Rectangle (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape -> Float -> Float -> Shape
nudge (Circle (Point x y) r) a b = Circle (Point (x+a) (y+b)) r
nudge (Rectangle (Point x1 y1) (Point x2 y2)) a b = Rectangle (Point (x1+a) (y1+b)) (Point (x2+a) (y2+b))
