{- 
class Functor f where 
     fmap :: (a -> b) -> f a -> f b 
class Functor f => Applicative f where
    pure :: a -> f a
    (<*>) :: f (a -> b) -> f a -> f b

Just length <*> Just "world"

Just (++" world") <*> Just "hello,"
pure (+) <*> Just 3 <*> Just 5
pure (+) <*> Just 3 <*> Nothing
(++) <$> ["ha","heh"] <*> ["?","!"]
-}
data List a = Nil
            | Cons a (List a)
        deriving (Eq, Show)

instance Functor List where
    fmap = undefined
instance Applicative List where
    pure = undefined
    (<*>) = undefined

f = Cons (+1) (Cons (*2) Nil)
v = Cons 1 (Cons 2 Nil)
test1 = (f <*> v) == Cons 2 (Cons 3 (Cons 2 (Cons 4 Nil)))

data Dog = Dog {
        name :: String
        , age :: Int
        , weight :: Int
        } deriving (Eq, Show)

noEmpty :: String -> Maybe String
noEmpty = undefined 

noNegative :: Int -> Maybe Int
noNegative = undefined 

test21 = noEmpty "abc" == Just "abc"
test22 = noNegative (-5) == Nothing 
test23 = noNegative 5 == Just 5 

dogFromString :: String -> Int -> Int -> Maybe Dog
dogFromString = undefined 

test24 = cowFromString "Toto" 5 11 == Just (Dog {name = "Toto", age = 5, weight = 11})

newtype Name = Name String deriving (Eq, Show)
newtype Address = Address String deriving (Eq, Show)

data Person = Person Name Address
    deriving (Eq, Show)

validateLength :: Int -> String -> Maybe String
validateLength = undefined 

test31 = validateLength 5 "abc" == Just "abc"
mkName :: String -> Maybe Name
mkName = undefined 

mkAddress :: String -> Maybe Address
mkAddress = undefined 

test32 = mkName "Popescu" ==  Just (Name "Popescu")
test33 = mkAddress "Str Academiei" ==  Just (Address "Str Academiei")

mkPerson :: String -> String -> Maybe Person
mkPerson = undefined 

test34 = mkPerson "Popescu" "Str Academiei" == Just (Person (Name "Popescu") (Address "Str Academiei"))
