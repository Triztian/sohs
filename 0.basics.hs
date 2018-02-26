sumatorial :: Integer -> Integer

sumatorial 0 = 0
sumatorial n = n + sumatorial (n - 1)

hailstone :: Integer -> Integer
hailstone n 
  | n `mod` 2 == 0  = n `div` 2
  | otherwise       = 3 * n + 1

foo :: Integer -> Integer
foo 0 = 16
foo 1 
  | "Haskell" > "C++" = 3
  | otherwise         = 4

foo n
  | n < 0           = 0
  | n `mod` 17 == 2 = -43
  | otherwise       = n + 3

main = do
  print (sumatorial 10)
  print (hailstone 3)
  print [foo (-3), foo 0, foo 1, foo 36, foo 38]

