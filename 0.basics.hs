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

-- Pairs
p :: (Int, Char)
p = (3, 'x')

sumPair :: (Int, Int) -> Int
sumPair (x, y) = x + y


-- Constructing lists
emptyList = []
a = 1 : []
b = 3 : (1 : [])
c = [2,3,4] == 2 : 3 : 4 : []


hailstoneSeq :: Integer -> [Integer]
hailstoneSeq 1 = [1]
hailstoneSeq n = n : hailstoneSeq (hailstone n)

main = do
  print (sumatorial 10)
  print (hailstone 3)
  print [foo (-3), foo 0, foo 1, foo 36, foo 38]
  print (sumPair (21, 21))
  print (hailstoneSeq 5)

