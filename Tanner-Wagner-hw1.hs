-- Homework 1 Due February 8th 11:59 pm
-- Tanner Wagner
-- Professor Haugh
-- CS 357
-- 8 February 2024

{-
Submission rules:
- All text answers must be given in Haskell comment underneath the problem header.
- You must submit a single .hs file with the following name: firstName-lastName-
hw1.hs.
Failure to do so will result in -10 points.
- You will lose 10 points if you put a module statement at the top of the file.
- You will lose 10 points for any import statements you have in your file and will
automatically miss any problems you used an imported function on.
- If your file doesn't compile you will lose 10 points and miss any problems that
were causing the compilation errors.
- This means that any function which is causing compiler errors should be commented
out.
There will be no partial credit.
- You must use the skeleton file provided and must not alter any type signature.
If you alter a type signature you will automatically miss that problem.
-}

-------------------------------------------------------------------------------------
-- Problem 1 Prelude Types (1 pt each, 15 pts)
-- Give the type of each of the following builtin Haskell functions.
-- Provide your answers in Haskell comments below each function.

-- head ::
-- Answer: head :: [a] -> a

-- tail ::
-- Answer: tail :: [a] -> [a]

-- fst ::
-- Answer: fst :: (a, b) -> a

-- snd ::
-- Answer: snd :: (a, b) -> b

-- length ::
-- Answer: length :: Foldable t => t a -> Int

-- null ::
-- Answer: null :: Foldable t => t a -> Bool

-- take ::
-- Answer: take :: Int -> [a] -> [a]

-- drop ::
-- Answer: drop :: Int -> [a] -> [a]

-- sum ::
-- Answer: sum :: (Foldable t, Num a) => t a -> a

-- product ::
-- Answer: product :: (Foldable t, Num a) => t a -> a

-- (++) ::
-- Answer: (++) :: [a] -> [a] -> [a]

-- (!!) ::
-- Answer: (!!) :: GHC.Stack.Types.HasCallStack => [a] -> Int -> a

-- elem ::
-- Answer: elem :: (Foldable t, Eq a) => a -> t a -> Bool

-- (:) ::
-- Answer: (:) :: a -> [a] -> [a]

-- last ::
-- Answer: last :: GHC.Stack.Types.HasCallStack => [a] -> a

---------------------------------------------------------------------
-- Problem 2 More Types (1 pt each, 15 pts)
-- What is the type of the following Haskell expressions?
-- Provide your answers in Haskell comments below each expression.

-- True ::
-- Answer: True :: Bool

-- not True ::
-- Answer: not True :: Bool

-- not ::
-- Answer: not :: Bool -> Bool

-- 1 + 2 ::
-- Answer: 1 + 2 :: Num a => a

-- (+) 1 2 ::
-- Answer: (+) 1 2 :: Num a => a

-- (+) 1 ::
-- Answer: (+) 1 :: Num a => a -> a

-- (+) ::
-- Answer: (+) :: Num a => a -> a -> a

-- [True, False] ::
-- Answer: [True, False] :: [Bool]

-- [1, 2, 3] ::
-- Answer: [1, 2, 3] :: Num a => [a]

-- [1, 2, 3] ++ [4, 5, 6] ::
-- Answer: [1, 2, 3] ++ [4, 5, 6] :: Num a => [a]

-- [] ::
-- Answer: [] :: [a]

-- [[]] ::
-- Answer: [[]] :: [[a]]

-- [[], []] ::
-- Answer: [[], []] :: [[a]]

-- take 10 [] ::
-- Answer: take 10 [] :: [a]

-- take 10 ::
-- Answer: take 10 :: [a] -> [a]

---------------------------------------------------------------
-- Problem 3 Layout (3 pts each, 15 pts)
-- Fix the error in each of the following pieces of code.

--------------------------------------------------------------
-- Issue with code snippet #1 is spacing issue between x,y.
{-
f = x + y
  where
    x = 1
     y = 2
-}

-- Here is the fixed code:

f = x + y
  where
    x = 1
    y = 2

----------------------------------------------------------------
-- Issue with code snippet #2 is that X and Y are capitalized.
{-
g X Y = X + Y
-}

-- Here is the fixed code

g x y = x + y

------------------------------------------------------------------
-- Issue with code snippet #3 is that it lacks a type declaration for Foo 
-- Additonally, Foo should be lower case (foo) not capitalized (Foo)
{-
Foo x y = x + y
-}

-- Here is the fixed code

foo :: Num a => a -> a -> a
foo x y = x + y

------------------------------------------------------------------------
-- Issue with code snippet #4 is that 4,5,6 should be wrapped in brackets
{-
h = [1,2,3] ++ 4,5,6
-}

-- Here is the fixed code

h = [1,2,3] ++ [4,5,6]

------------------------------------------------------------------------------
-- Issue with code snippet #5 is that x and y are improperly indented after where
-- also, where is improperly indented
{-
u = x * y
where
x = 1
y = 2
-}

-- Here is the fixed code

u = x * y
  where
    x = 1
    y = 2

---------------------------------------------------------------------------------

-- Problem 4 Classes (3 pts each, 18 pts)
-- For each problem give a list of functions separated by commas.
-- For example, the Eq typeclass defines the (==), (/=) functions.
-- Provide your answers in Haskell comments below each question.

-- Which functions does the Ord typeclass define?
-- The Ord typeclass defines the following: (<), (<=), (>), (>=), compare, and max, min functions.

-- Which functions does the Show typeclass define?
-- The Show typeclass defines the following: show function.

-- Which functions does the Read typeclass define?
-- The Read typeclass defines the following: read function.

-- Which functions does the Num typeclass define?
-- The Num typeclass defines the following: (+), (-), (*), negate, abs, signum, and fromInteger functions.

-- Which functions does the Integral typeclass define?
-- The Integral typeclass defines the following: quot, rem, div, mod, quotRem, and divMod functions.

-- Which functions does the Fractional typeclass define?
-- The Fractional typeclass defines the following: (/), recip, and fromRational functions.

--------------------------------------------------------------------------------------------
-- Problem 5 Functions (37 pts)

---------------------------------------------------------------------------------------------
-- (5 pts) (Chapter 4 Exercise 1) Define a function, halve :: [a] -> ([a], [a]), 
-- which takes an even-length list and splits in half
-- For example, halve [1, 2, 3, 4] == ([1, 2], [3, 4])

halve :: [a] -> ([a], [a])
halve xs = splitAt (length xs `div` 2) xs

-----------------------------------------------------------------------------------------------
-- (10 pts) (Chapter 4 Exercise 2) Define a function, fourth :: [a] -> a, which takes a list and returns the fourth element
-- For example: fourth [1, 2, 3, 4, 5] == 4
-- You must define this function in three ways (name each function fourth1, fourth2, fourth3):
-- 1. (3 pts) Using the head and tail functions
-- 2. (3 pts) Using the !! function
-- 3. (4 pts) Using pattern matching

-- Using head and tail functions:
fourth1 :: [a] -> a
fourth1 xs = head (tail (tail (tail xs)))

-- Using !! function:
fourth2 :: [a] -> a
fourth2 xs = xs !! 3

-- Using pattern matching:
fourth3 :: [a] -> a
fourth3 (_:_:_:x:_) = x
-- This pattern matching version looks at every element 1-4 and specifically binds the fourth element as x 

------------------------------------------------------------------------------------------------------
-- (22 pts) (Chapter 4 Exercise 8) Luhn algorithm is used to check credit card numbers for simple
-- errors such as mistyping a digit, and proceeds as follows:
-- consider each digit as a separate number;
-- moving left, double every other number from the second last;
-- subtract 9 from each number that is now greater than 9;
-- add all the resulting numbers together;
-- if the total is divisible by 10, the card number is valid 
-- Define a function luhnDouble :: Int -> Int that doubles a digit and subtracts 9
-- if the result is greater than 9
-- For example: > luhnDouble 3 === 6
-- > luhnDouble 6 === 3
-- Using luhnDouble and the integer remainder function mod, define a function luhn :: Int -> Int -> Int -> Int -> Bool
-- that decides if a four digit bank card number is valid 
-- For example: luhn 1 7 8 4 == True
-- luhn 4 7 8 3 == False

luhnDouble :: Int -> Int 
luhnDouble x = if doubled > 9 then doubled - 9 else doubled 
    where doubled = x * 2

luhn :: Int -> Int -> Int -> Int -> Bool
luhn a b c d =
    let total = sum [luhnDouble a, b, luhnDouble c, d]
    in total `mod` 10 == 0