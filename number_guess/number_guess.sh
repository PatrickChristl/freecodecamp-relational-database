#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

#exist user already?
EXISTINGUSER=$($PSQL "SELECT games_played,best_game FROM users WHERE username='$USERNAME'")
IFS="|" read GAMES_PLAYED BEST_GAME <<< "$EXISTINGUSER"

if [[ -z $EXISTINGUSER ]]
then 
echo "Welcome, $USERNAME! It looks like this is your first time here."
$PSQL "INSERT INTO users(username) VALUES('$USERNAME')" > /dev/null
else
echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
fi

GENERATINGNUMBER=$(( RANDOM % 1000 + 1 ))
NUMBER_OF_GUESSES=0

echo "Guess the secret number between 1 and 1000:"
while true
do
read GUESSINGNUMBER
NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

#check if number is not an input
if ! [[ $GUESSINGNUMBER =~ ^[0-9]+$ ]]
then
echo "That is not an integer, guess again:"
elif [[ $GUESSINGNUMBER -lt $GENERATINGNUMBER ]]
then
echo "It's higher than that, guess again:"
elif [[ $GUESSINGNUMBER -gt $GENERATINGNUMBER ]]
then
echo "It's lower than that, guess again:"
else
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $GENERATINGNUMBER. Nice job!"
$PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$USERNAME'" > /dev/null
$PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE username='$USERNAME' AND (best_game IS NULL OR $NUMBER_OF_GUESSES < best_game)" > /dev/null
break
fi
done
