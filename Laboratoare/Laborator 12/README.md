# Laborator 12 - Functori, Applicative

Amintiți-vă clasele `Functor` și `Applicative`, rulați și analizați următoarele exemple:

``` haskell
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
```

## Exerciții

1. Se dă tipul de date 

``` haskell
data List a = Nil
            | Cons a (List a)
        deriving (Eq, Show)
```

Scrieți instanțe ale claselor `Functor` și `Applicative` pentru constructorul de tip `List`. 

``` haskell
instance Functor List where
    fmap = undefined
instance Applicative List where
    pure = undefined
    (<*>) = undefined
```

Exemple: 

``` haskell
f = Cons (+1) (Cons (*2) Nil)
v = Cons 1 (Cons 2 Nil)
test1 = (f <*> v) == Cons 2 (Cons 3 (Cons 2 (Cons 4 Nil)))
```

2. Se dă tipul de date 

``` haskell
data Dog = Dog {
        name :: String
        , age :: Int
        , weight :: Int
        } deriving (Eq, Show)
```

a) Scrieți funcțiile `noEmpty` și `noNegative` care validează un string, respectiv un număr întreg.

``` haskell
noEmpty :: String -> Maybe String
noEmpty = undefined 

noNegative :: Int -> Maybe Int
noNegative = undefined 

test21 = noEmpty "abc" == Just "abc"
test22 = noNegative (-5) == Nothing 
test23 = noNegative 5 == Just 5 
```

b) Scrieți o funcție care construiește un element de tip `Dog` verificând numele, vârsta și greutatea, folosind funcțiile definite pentru a). 

``` haskell
dogFromString :: String -> Int -> Int -> Maybe Dog
dogFromString = undefined 

test24 = dogFromString "Toto" 5 11 == Just (Dog {name = "Toto", age = 5, 
                                                   weight = 11})
```

c) Scrieți funcția de la b) folosind `fmap` și `<*>`.

3. Se dau următoarele tipuri de date: 

``` haskell
newtype Name = Name String deriving (Eq, Show)
newtype Address = Address String deriving (Eq, Show)
 
data Person = Person Name Address
    deriving (Eq, Show)
```

a) Implementați o funcție `validateLength` care validează lungimea unui șir de caractere – să fie mai mică decât numărul dat ca parametru.

``` haskell
validateLength :: Int -> String -> Maybe String
validateLength = undefined 
 
test31 = validateLength 5 "abc" == Just "abc"
```

b) Implementați funcțiile `mkName` și `mkAddress` care transformă un șir de caractere într-un element din tipul de date asociat, validând stringul cu funcția `validateLength` (numele trebuie să aibă maxim 25 caractere, iar adresa maxim 100). 

``` haskell
mkName :: String -> Maybe Name
mkName = undefined 
 
mkAddress :: String -> Maybe Address
mkAddress = undefined 

test32 = mkName "Popescu" ==  Just (Name "Popescu")
test33 = mkAddress "Str Academiei" ==  Just (Address "Str Academiei")
```

c) Implementați funcția `mkPerson` care primește ca argumente două șiruri de caractere și formează un element de tip `Person` dacă sunt validate  condițiile, folosind funcțiile implementate mai sus. 

``` haskell
mkPerson :: String -> String -> Maybe Person
mkPerson = undefined 

test34 = mkPerson "Popescu" "Str Academiei" == Just (Person (Name "Popescu")
                                                    (Address "Str Academiei"))
```

d) Implementați funcțiile de la b) și c) folosind `fmap` și `<*>`.