{-
https://www.schoolofhaskell.com/school/starting-with-haskell/introduction-to-haskell/4-higher-order-programming-and-type-inference
-}

greaterThan100 :: [Integer] -> [Integer]
greaterThan100 (_:xs)       = filter (>100) xs
greaterThan100 []           = []

myTest :: [Integer] -> Bool
myTest = even . length . greaterThan100

foobar :: [Integer] -> Integer
foobar []     = 0
foobar (x:xs)
  | x > 3     = (7*x + 2) + foobar xs
  | otherwise = foobar xs

-- Pipelined version
foobar' :: [Integer] -> Integer
foobar' = sum . map (\x -> 7*x + 2) . filter (>3)


main = do
  let l = [0, 101, 98, 102, 34, 999]
  print (greaterThan100 l)
  print (myTest l)
  print (foobar [1,2,3,4,5])
  print (foobar' [1,2,3,4,5])

