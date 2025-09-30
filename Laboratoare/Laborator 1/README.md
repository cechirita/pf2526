# Laborator 1 - Introducere în Haskell

*Pentru început, vă veți familiariza cu  mediul de programare GHC (Glasgow Haskell Compiler). Acesta include două componente: GHCi (un interpretor) și GHC (un compilator).*

## Descărcare și instalare

### Instrucțiuni Instalare Haskell folosind GHCup

GHCup permite dezvoltatorilor să instaleze versiuni ale GHC (Glasgow Haskell Compiler) și să gestioneze proiecte pe sisteme precum GNU/Linux, macOS, FreeBSD, și Windows, instalând întregul Haskell Toolchain, care este format din:

- GHC

- Cabal -  permite gestionarea proiectelor și a dependințelor

- HLS (Haskell Language Server) - oferă programelor de editat informații despre codul sursă precum erori sau sugestii de completare

- Stack - poate gestiona proiecte cu versiuni diferite ale compilatorului GHC, oferind posibilitatea de a avea teste.

Pentru instalare, urmați instrucțiunile de la adresa [https://www.haskell.org/ghcup/](https://www.haskell.org/ghcup/).

### IDE
Puteți folosi editorul text preferat pentru a scrie cod de Haskell. 

#### VSCode 
Haskell poate fi [integrat în VSCode](https://www.haskell.org/ghcup/install/#vscode-integration). 

#### Bravo, ai stil!
 Recomandăm folosirea unui stil standard de formatare a fișierelor sursă, precum [acesta](https://github.com/tibbe/haskell-style-guide/blob/master/haskell-style.md).

## GHCi

1. Deschideți un terminal și introduceți comanda `ghci` (în Windows este posibil să aveți instalat WinGHCi). După câteva informații despre versiunea instalată, va apărea promptul:

`ghci>`

sau, în funcție de versiunea instalată:

`Prelude>`

__Prelude__ este biblioteca standard: [http://hackage.haskell.org/package/base-4.12.0.0/docs/Prelude.html](http://hackage.haskell.org/package/base-4.12.0.0/docs/Prelude.html)

În interpretor puteți:

- introduce expresii, care vor fi evaluate atunci când este posibil:
``` haskell
Prelude> 2+3
5
Prelude> False || True
True
Prelude> x
<interactive>:10:1: error: Variable not in scope: x
Prelude> x = 3
Prelude> x
3
Prelude> y = x+1
Prelude> y
4
Prelude> head [1,2,3]
1
Prelude> head "abcd"
'a'
Prelude> tail "abcd"
'bcd'
```

Funcțiile `head` și `tail`  aparțin modulului standard __Prelude__.

- introduce comenzi; orice comandă este precedată de `":"`

:?  - este comanda *help*

:q  - este comanda *quit*

:cd - este comanda *change directory*

:t - este comanda *type*
``` haskell
Prelude> :t True
True :: Bool```

Citiți mai mult despre  __GHCi__:
[https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/ghci.html](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/ghci.html)

## Fișiere sursă

2. Fișierele sursă sunt fișiere text cu extensia ___.hs___. Le puteți edita cu un editor la alegerea voastră. Deschideți fișierul `lab1.hs` care conține următoarele linii de cod:
``` haskell
myInt = 31415926535897932384626433832795028841971693993751058209749445923
double :: Integer -> Integer
double x = x+x```

Fără a încărca fișierul, încercați să calculați `double myInt`:

``Prelude> double myInt``

Observați mesajele de eroare. Acum încărcați fișierul folosind comanda ___load___ (`:l`).

``` haskell
Prelude> :l lab1.hs
[1 of 1] Compiling Main             ( lab1.hs, interpreted )
Ok, 1 module loaded.```

Promptul poate rămâne neschimbat, sau să fie înlocuit cu numele unui ___modul___. 
De exemplu, în linia următoare, este înlocuit cu numele modulului `Main`, definit automat de `ghci` pentru fișierul tocmai încărcat. 

`` *Main> ``

Modulele sunt unități elementare de structurare a codului despre care vom învăța în cursurile viitoare. Puteți reveni în __Prelude__  folosind `:m - Main`.

Încercați să calculați `double myInt` din nou:
``*Main> double myInt``

Executați `double` cu alte argumente:
``*Main> double 2000``

Adăugați o funcție `triple` fișierului `lab1.hs`. Dacă fișierul este deja încărcat, puteți să îl reîncărcați folosind comanda ___reload___ (`:r`). Testați funcția `triple` pentru inputul `myInt`.

``` haskell
*Main> :r
Ok, 1 module loaded.
*Main> triple myInt```

## Hoogle

Există numeroase biblioteci utile de Haskell. Puteți găsi informații despre ele în __Hoogle__: 
 [https://hoogle.haskell.org/](https://hoogle.haskell.org/)

 Căutați în __Hoogle__ funcția `head` folosită anterior. Observați că se găsește în mai multe biblioteci, printre care `Prelude` și `Data.List`.

## Citiți, citiți, citiți!
Citiți capitolul introductiv din M. Lipovaca, Learn You a Haskell for Great Good! 
[https://learnyouahaskell.com/introduction](https://learnyouahaskell.com/introduction)
