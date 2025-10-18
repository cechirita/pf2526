verifL :: [Int] -> Bool
verifL = undefined

takefinal :: [Int] -> Int -> [Int]
takefinal = undefined

-- semiPareRec [0,2,1,7,8,56,17,18] == [0,1,4,28,9]
semiPareRec :: [Int] -> [Int]
semiPareRec [] = []
semiPareRec (h:t)
 | even h    = h `div` 2 : t'
 | otherwise = t'
 where t' = semiPareRec t
 
totalLen :: [String] -> Int
totalLen = undefined

nrVocale :: [String] -> Int
nrVocale = undefined
-- nrVocale ["sos", "civic", "palton", "desen", "aerisirea"] == 9

-- f 3 [1,2,3,4,5,6] = [1,2,3,3,4,3,5,6,3]

semiPareComp :: [Int] -> [Int]
semiPareComp l = [ x `div` 2 | x <- l, even x ]

-- divizori 4 == [1,2,4]

listadiv :: [Int] -> [[Int]]
listadiv = undefined
-- listadiv [1,4,6,8] == [[1],[1,2,4],[1,2,3,6],[1,2,4,8]]

-- inInterval 5 10 [1..15] == [5,6,7,8,9,10]
-- inInterval 5 10 [1,3,5,2,8,-1] == [5,8]

-- pozitive [0,1,-3,-2,8,-1,6] == 3

-- pozitiiImpare [0,1,-3,-2,8,-1,6,1] == [1,2,5,7]

-- multDigits "The time is 4:25" == 40
-- multDigits "No digits here!" == 1
