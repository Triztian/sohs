{-
https://www.schoolofhaskell.com/school/starting-with-haskell/introduction-to-haskell/3-recursion-patterns-polymorphism-and-the-prelude
-}

data IntList = Empty | Cons Int IntList
  deriving Show

addOneToAll :: IntList -> IntList
addOneToAll Empty       = Empty
addOneToAll (Cons x xs) = Cons (x + 1)  (addOneToAll xs)

absAll :: IntList -> IntList
absAll Empty        = Empty
absAll (Cons x xs)  = Cons (abs x) (absAll xs)

squareAll :: IntList -> IntList
squareAll Empty       = Empty
squareAll (Cons x xs) = Cons (x * x) (squareAll xs)

mapIntList :: (Int -> Int) -> IntList -> IntList
mapIntList _ Empty        = Empty
mapIntList f (Cons x xs)  = Cons (f x) (mapIntList f xs)

keepOnlyEven :: IntList -> IntList
keepOnlyEven Empty = Empty
keepOnlyEven (Cons x xs) 
  | even x    = Cons x (keepOnlyEven xs)
  | otherwise = keepOnlyEven xs

myIntList = Cons (-2) (Cons (-3) (Cons (-5) Empty))

main = do
  print ("myIntList",show myIntList)
  print ("absAll",show $ absAll myIntList)
  print ("squareAll", show $ squareAll myIntList)
  print ("mapIntList", show $ mapIntList (\x -> x * 2) myIntList)
  print ("keepOnlyEven", show $ keepOnlyEven myIntList)
