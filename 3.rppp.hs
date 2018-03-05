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

filterIntList :: (Int -> Bool) -> IntList -> IntList
filterIntList _ Empty = Empty
filterIntList p (Cons x xs)
  | p x       = Cons x (filterIntList p xs)
  | otherwise = filterIntList p xs

myIntList = Cons (-2) (Cons (-3) (Cons (-5) Empty))

-- Polymorphic data types
data List t = E | C t (List t)
  deriving Show

filterList _ E = E
filterList p (C x xs)
  | p x       = C x (filterList p xs)
  | otherwise = filterList p xs

lst1 :: List Int
lst1 = C 3 (C 2 (C 5 E))

lst2 :: List Char
lst2 = C 'x' ( C 'y' (C 'z' E))

lst3 :: List Bool
lst3 = C True (C False (C True E))

myList = C 2 (C (-3) (C 5 E))

main = do
  print ("myIntList",show myIntList)
  print ("absAll",show $ absAll myIntList)
  print ("squareAll", show $ squareAll myIntList)
  print ("mapIntList", show $ mapIntList (\x -> x * 2) myIntList)
  print ("keepOnlyEven", show $ keepOnlyEven myIntList)
  print ("filterIntList", show $ filterIntList even myIntList)
  print ("filterList", show $ filterList even myList)
