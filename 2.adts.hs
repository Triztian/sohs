data Thing = Shoe
           | Ship
           | SealingWax
           | Cabbage
           | King
           | Queen
    deriving Show

myShoe :: Thing
myShoe = Shoe

listO'Things :: [Thing]
listO'Things = [Shoe, SealingWax, King, Cabbage, King]

-- Show 
isSmall :: Thing -> Bool
isSmall Shoe        = True
isSmall Ship        = False
isSmall King        = False
isSmall SealingWax  = True
isSmall Cabbage     = True

isSmall2 :: Thing -> Bool
isSmall2 Ship   = False
isSmall2 King   = False
isSmall2 _      = True


data FailableDouble = Failure
                    | OK Double
  deriving Show

a = Failure
b = OK 3.4


safeDiv :: Double -> Double -> FailableDouble
safeDiv _ 0 = Failure
safeDiv x y = OK (x / y)

failureToZero :: FailableDouble -> Double
failureToZero Failure = 0
failureToZero (OK d) = d

failureToZero' :: FailableDouble -> Double
failureToZero' x = case x of
                     Failure  -> 0
                     OK d     -> d

data Person = Person String Int Thing
  deriving Show

getAge :: Person -> Int
getAge (Person _ age _) = age

brent = Person "Brent" 25 Cabbage
liz = Person "Liz" 28 Queen
tris = Person "Tristian" 28 King

showName :: Person -> String
showName p@(Person n _ _) = "The name field of " ++ show p ++ " is " ++ n

checkFav :: Person -> String
checkFav (Person n _ SealingWax) = n ++ ", my favourite kind of person"
checkFav (Person n _ _) = n ++ ", your favourite thing is lame"

caseExpr :: String
caseExpr = case "Hello" of
  []      -> show 3
  ('H':s) -> show $ length s
  _       -> show 7

-- Recursive Data types
data IntList = Empty | Cons Int IntList

intListProd :: IntList -> Int
intListProd Empty         = 1
intListProd (Cons x xs)   = x * intListProd xs

data Tree = Leaf Char
          | Node Tree Int Tree
  deriving Show

t :: Tree
t = Node (Leaf 'x') 1 (Node (Leaf 'y') 2 (Leaf 'z'))

main = do
  -- Small 1
  print (isSmall Cabbage)
  print (isSmall King)

  -- Small 2
  print (isSmall2 Ship)
  print (isSmall2 Cabbage)

  print (a, b)

  print ("safeDiv", safeDiv 2 0, safeDiv 3 4)
  print ("failureToZero", failureToZero Failure, failureToZero (OK 3.141516))
  print ("failureToZero'", failureToZero' Failure, failureToZero' (OK 3.141516))

  print liz
  print ("Liz Age", getAge liz)

  putStrLn ("showName: " ++ showName liz)
  putStrLn ("checkFav (cool): " ++ checkFav liz)
  putStrLn ("checkFav (lame): " ++ checkFav tris)

  putStrLn ("caseExpr: " ++ caseExpr)
  print ("intListProd", intListProd (Cons 3 (Cons 2 (Cons 4 Empty))))
  print ("Tree", show t)

