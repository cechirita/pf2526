# Laborator 10 - Logică propozițională

## Logica propozițională

În acest laborator vom implementa o colecție de funcții utile pentru lucrul cu logica propozițională în Haskell. Pentru următoarea definiție:

``` haskell
type Nume = String
data Prop
  = Var Nume
  | F
  | T
  | Not Prop
  | Prop :|: Prop
  | Prop :&: Prop
  deriving Eq
infixr 2 :|:
infixr 3 :&:
```

- tipul `Prop` este o reprezentare a formulelor propoziționale
- variabilele propoziționale precum `p` și `q` pot fi reprezentate ca `Var "p"` și `Var "q"`
- constantele booleene `F` și `T` reprezintă `false` și `true`
- operatorul unar `Not` reprezintă negația
($\lnot$). *A nu se confunda cu funcția `not :: Bool -> Bool`!*
- operatorii (infix) binari `:|:` și `:&:` reprezintă disjuncția ($\lor$) și conjuncția ($\land$).

1. Scrieți următoarele formule ca expresii de tip `Prop`, denumindu-le `pa`, `pb`, `pc`.

a. $(P \lor Q) \land (P \land Q)$

``` haskell
pa :: Prop
pa = (Var "P" :|: Var "Q") :&: (Var "P" :&: Var "Q")
```

b. $(P \lor Q) \land (\lnot P \land \lnot Q)$

``` haskell
pb :: Prop
pb = undefined
```

c. $(P \land (Q \lor R)) \land ((\lnot P \lor \lnot Q) \land (\lnot P \lor \lnot R))$

``` haskell
pc :: Prop
pc = undefined
```

2. Faceți tipul `Prop` instanță a clasei de tipuri `Show`, înlocuind conectorii `Not`, `:|:` și `:&:` cu `~`, `|` și `&` și folosind direct numele variabilelor în loc de construcția `Var nume`.

``` haskell
instance Show Prop where
  show = undefined

test_ShowProp :: Bool
test_ShowProp =
    show (Not (Var "P") :&: Var "Q") == "((~P)&Q)"
```

## Evaluarea expresiilor logice

Pentru a putea evalua o expresie logică vom considera un mediu de evaluare care asociază valori `Bool` variabilelor propoziționale:

``` haskell
type Env = [(Nume, Bool)]
```

Tipul `Env` este o listă de atribuiri de valori de adevăr pentru (numele) variabilelor propoziționale.

Pentru a obține valoarea asociată unui `Nume` în `Env`, putem folosi funcția predefinită `lookup :: Eq a => a -> [(a,b)] -> Maybe b`.

Deși nu foarte elegant, pentru a simplifica exercițiile de mai jos, vom defini o variantă a funcției `lookup` care generează o eroare dacă valoarea nu este găsită.

``` haskell
impureLookup :: Eq a => a -> [(a,b)] -> b
impureLookup a = fromJust . lookup a
```

O soluție mai elegantă ar fi să reprezentăm toate funcțiile ca fiind parțiale (rezultat de tip `Maybe`) și sa controlăm propagarea erorilor (_Extra_: încercați la final să faceți aceste modificări ca exercițiu suplimentar).

3. Definiți o funcție `eval` care, dată fiind o expresie logică și un mediu de evaluare, calculează valoarea de adevăr a expresiei.

``` haskell
eval :: Prop -> Env -> Bool
eval = undefined

test_eval = eval  (Var "P" :|: Var "Q") [("P", True), ("Q", False)] == True
```

## Satisfiabilitate

O formulă în logica propozițională este _satisfiabilă_ dacă există o atribuire de valori de adevăr pentru variabilele propoziționale din formulă pentru care aceasta se evaluează la `True`.

Pentru a verifica dacă o formulă este satisfiabilă, vom genera toate atribuirile posibile de valori de adevăr și vom testa dacă formula se evaluează la `True` pentru vreuna dintre ele.

4. Definiți o funcție `variabile` care colectează lista tuturor variabilelor dintr-o formulă. _Hint_: folosiți funcția `nub`.

``` haskell
variabile :: Prop -> [Nume]
variabile = undefined

test_variabile =
  variabile (Not (Var "P") :&: Var "Q") == ["P", "Q"]
```

5. Dată fiind o listă de nume, definiți toate atribuirile de valori de adevăr posibile pentru ea.

``` haskell
envs :: [Nume] -> [Env]
envs = undefined

test_envs =
    envs ["P", "Q"]
    ==
    [ [ ("P",False)
      , ("Q",False)
      ]
    , [ ("P",False)
      , ("Q",True)
      ]
    , [ ("P",True)
      , ("Q",False)
      ]
    , [ ("P",True)
      , ("Q",True)
      ]
    ]
```

6. Definiți o funcție `satisfiabila` care, dată fiind o propoziție, verifică dacă aceasta este satisfiabilă. _Hint_: puteți folosi rezultatele de la exercițiile 4 și 5.

``` haskell
satisfiabila :: Prop -> Bool
satisfiabila = undefined

test_satisfiabila1 = satisfiabila (Not (Var "P") :&: Var "Q") == True
test_satisfiabila2 = satisfiabila (Not (Var "P") :&: Var "P") == False
```

7. O propoziție este validă dacă se evaluează la `True` pentru orice
interpretare a variabilelor.  O formulare echivalentă este aceea că o propoziție este validă dacă negația ei este nesatisfiabilă.
Definiți o funcție `valida` care verifică dacă o propoziție este validă.

``` haskell
valida :: Prop -> Bool
valida = undefined

test_valida1 = valida (Not (Var "P") :&: Var "Q") == False
test_valida2 = valida (Not (Var "P") :|: Var "P") == True
```

## Implicație și echivalență

8. Extindeți tipul de date `Prop` și funcțiile definite până acum pentru a include conectorii logici `->` (implicație) și `<->` (echivalență), folosind constructorii `:->:` și `:<->:`.

9. Două propoziții sunt echivalente dacă au mereu aceeași valoare de adevăr, indiferent de valorile variabilelor propoziționale. Scrieți o funcție care verifică dacă două propoziții sunt echivalente.

``` haskell
echivalenta :: Prop -> Prop -> Bool
echivalenta = undefined

test_echivalenta1 =
  True
  ==
  (Var "P" :&: Var "Q") `echivalenta` (Not (Not (Var "P") :|: Not (Var "Q")))
test_echivalenta2 =
  False
  ==
  (Var "P") `echivalenta` (Var "Q")
test_echivalenta3 =
  True
  ==
  (Var "R" :|: Not (Var "R")) `echivalenta` (Var "Q" :|: Not (Var "Q"))
```