# Laborator 3 - Liste

## Liste

Funcții utile: `head`, `tail`, `take`, `drop`, `length`.

1. Implementați următoarele funcții folosind liste:

a) `verifL` - verifică dacă lungimea unei liste date ca parametru este pară.

``` haskell 
verifL :: [Int] -> Bool
verifL = undefined
```

b) `takefinal` - pentru o listă `l` dată ca parametru și un număr `n`, întoarce o listă care conține ultimele `n` elemente ale listei `l`. Dacă lista are mai puțin de `n` elemente, întoarce lista nemodificată.

``` haskell 
takefinal :: [Int] -> Int -> [Int]
takefinal = undefined
```

Cum trebuie să modificăm prototipul funcției pentru a putea folosi funcția și pentru șiruri de caractere?

c) `remove` - pentru o listă și un număr `n`, întoarce lista primită ca parametru din care se șterge elementul de pe poziția `n`. (Hint: puteți folosi funcțiile `take` și `drop`). Scrieți și prototipul funcției.

## Recursivitate și liste

Listele sunt definite inductiv:

  - lista vidă: `[]`
  
  - lista construită prin adăugarea unui element `head` unei liste `tail` deja existente: `(head:tail)`

_Exemplu._ Dată fiind o listă de numere întregi, să se scrie o funcție `semiPareRec` care elimină numerele impare și le injumătățește pe cele pare. De exemplu:

``` haskell
-- semiPareRec [0,2,1,7,8,56,17,18] == [0,1,4,28,9]

semiPareRec :: [Int] -> [Int]
semiPareRec [] = []
semiPareRec (h:t)
 | even h    = h `div` 2 : t'
 | otherwise = t'
 where t' = semiPareRec t
```

2. Scrieți următoarele funcții folosind conceptul de recursivitate:

a) `myreplicate` - pentru un întreg `n` și o valoare `v`, întoarce lista ce conține `n` elemente egale cu `v`. Să se scrie și prototipul funcției.

b) `sumImp` - pentru o listă de numere întregi, calculează suma elementelor impare. Să se scrie și prototipul funcției.

c) `totalLen` - pentru o listă de șiruri de caractere, calculează suma lungimilor șirurilor care încep cu caracterul 'A'.

``` haskell
totalLen :: [String] -> Int
totalLen = undefined
```

3. Scrieți o funcție `nrVocale` care primește ca parametru o listă de șiruri de caractere și calculează numărul total de vocale din șirurile palindrom. Pentru a verifica dacă un șir e palindrom, puteți folosi funcția `reverse`, iar pentru a căuta un element într-o listă, puteți folosi funcția `elem`. Puteți defini funcții auxiliare.

``` haskell
nrVocale :: [String] -> Int
nrVocale = undefined
-- nrVocale ["sos", "civic", "palton", "desen", "aerisirea"] == 9
```

4. Scrieți o funcție  care primește ca parametri un număr și o listă de întregi și adaugă numărul dat după fiecare  element par din listă. Să se scrie și prototipul funcției.

``` haskell 
-- f 3 [1,2,3,4,5,6] == [1,2,3,3,4,3,5,6,3]
```

## Liste definite cu proprietăți caracteristice sau prin selecție

Haskell permite definirea unei liste prin selectarea și transformarea elementelor din alte liste sursă, folosind o sintaxă asemănătoare definirii mulțimilor matematice prin specificarea proprietăților caracteristice:

```
[expresie | selectori, legari, filtrari]
```

unde

__selectori__ = una sau mai multe construcții de forma `pattern <- elista` (separate prin virgulă) unde `elista` este o expresie reprezentând o listă, iar `pattern` este un șablon pentru elementele listei `elista`

__legari__ = zero sau mai multe expresii (separate prin virgulă) de forma
    `let pattern = expresie` ce folosesc la legarea corespunzătoare a
    variabilelor din `pattern` cu valoarea `expresie`

__filtrari__ = zero sau mai multe expresii de tip `Bool`
    (separate prin virgulă) folosite la eliminarea instanțelor selectate pentru
    care condiția e falsă

__expresie__ = expresie descriind elementele listei rezultat

\paragraph{Exemplu} Iată cum arată o posibilă implementare a funcției
`semiPare` folosind descrieri de liste:

``` haskell
semiPareComp :: [Int] -> [Int]
semiPareComp l = [ x `div` 2 | x <- l, even x ]
```

## Exerciții

5. Scrieți o funcție care determină lista divizorilor unui număr întreg primit ca parametru. Să se scrie și prototipul funcției.

``` haskell
-- divizori 4 == [1,2,4]
```

6. Scrieți o funcție care primește ca parametru o listă de numere întregi și întoarce lista listelor de divizori.

``` haskell
listadiv :: [Int] -> [[Int]]
listadiv = undefined

-- listadiv [1,4,6,8] == [[1],[1,2,4],[1,2,3,6],[1,2,4,8]]
```

7. Scrieți o funcție care primește ca parametri:

- două numere întregi ce reprezintă limita inferioară și cea superioară a unui interval închis și

- o listă de numere întregi

   și întoarce numerele din listă ce aparțin intervalului. 
De exemplu:

``` haskell
-- inInterval 5 10 [1..15] == [5,6,7,8,9,10]

-- inInterval 5 10 [1,3,5,2,8,-1] == [5,8]
```

   a) Definiți funcția recursiv și denumiți-o `inIntervalRec`.
   b) Folosiți descrieri de liste. Denumiți funcția `inIntervalComp`.

8. Scrieți o funcție care numără câte numere strict pozitive sunt într-o listă dată ca argument. De exemplu:

``` haskell
-- pozitive [0,1,-3,-2,8,-1,6] == 3
```

 a) Definiți funcția recursiv și denumiți-o `pozitiveRec`.
 b) Folosiți descrieri de liste. Denumiți funcția `pozitiveComp`.
  
     Hint: Nu puteți folosi recursivitate. Veți avea nevoie de o funcție de agregare (consultați modulul [`Data.List`](https://hackage.haskell.org/package/base-4.12.0.0/docs/GHC-List.html)). De ce nu e posibil să scriem `pozitiveComp` folosind doar descrieri de liste?

9. Scrieți o funcție care întoarce lista pozițiilor elementelor impare dintr-o listă de numere primită ca parmetru. De exemplu:

``` haskell
-- pozitiiImpare [0,1,-3,-2,8,-1,6,1] == [1,2,5,7]
```

  a) Definiți funcția recursiv și denumiți-o `pozitiiImpareRec`.
  
     Hint: folosiți o funcție ajutătoare, cu un parametru în plus reprezentând poziția curentă din listă.
    
  b) Folosiți descrieri de liste. Denumiți funcția `pozitiiImpareComp`.
     
     Hint: folosiți funcția `zip` pentru a asocia poziții elementelor listei (puteți găsi un exemplu în curs).

10. Scrieți o funcție care calculează produsul tuturor cifrelor care apar într-un șir de caractere primit ca parametru. Dacă șirul nu conține cifre, funcția întoarce `1` . De exemplu:

``` haskell
-- multDigits "The time is 4:25" == 40
-- multDigits "No digits here!" == 1
```

  a) Definiți funcția recursiv și denumiți-o `multDigitsRec`.
  b) Folosiți descrieri de liste. Denumiți funcția `multDigitsComp`.
  
     Hint: Veți avea nevoie de funcția `isDigit` care verifică dacă un caracter e cifră și de funcția `digitToInt` care transformă un caracter în cifră. Cele 2 funcții se află în pachetul `Data.Char`.


## Extra

11. Scrieți o funcție care primește ca argument o listă și întoarce toate permutările ei.
12. Scrieți o funcție care primește ca argument o listă și un număr întreg `k`, și întoarce toate combinările de `k` elemente din listă. 
13. Scrieți o funcție care primește ca argument o listă și un număr întreg `k`, și întoarce toate aranjamentele de `k` elemente din listă. 
14. Scrieți o funcție care primește ca argument un număr întreg ce reprezintă dimensiunea unei table de șah și un numar întreg ce reprezintă numărul de dame ce trebuie așezate pe tablă, și întoarce lista pozițiilor în care pot fi așezate damele fără să se atace.