
-- Suppose we want to write a function

greaterThan100 :: [Integer] -> [Integer]
greaterThan100 []     = []
greaterThan100 (x:xs) = if x > 100 then [x] ++ greaterThan100 xs else greaterThan100 xs

main = do
  print (greaterThan100 [0, 101, 98, 102, 34, 999])

