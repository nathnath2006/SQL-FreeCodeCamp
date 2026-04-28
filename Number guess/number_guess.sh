#!/bin/bash
RANDOM_NUMBER=$(( RANDOM % 1000 + 1 ))
PSQL="psql --username=freecodecamp --dbname=number_guess --no-align --tuples-only -c"

echo "Enter your username:"
read PLAYER_NAME

USERNAME=$($PSQL "SELECT username FROM users WHERE username='$PLAYER_NAME'")

if [[ -z $USERNAME ]]
then
  $PSQL "INSERT INTO users(username) VALUES('$PLAYER_NAME')" &>/dev/null
  echo "Welcome, $PLAYER_NAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username='$PLAYER_NAME'" | xargs)
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$PLAYER_NAME'" | xargs)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$PLAYER_NAME'" | xargs)

echo "Guess the secret number between 1 and 1000:"
read GUESS
COUNT=1

while [[ $GUESS != $RANDOM_NUMBER ]]
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif [[ $GUESS -lt $RANDOM_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    COUNT=$(( COUNT + 1 ))
  elif [[ $GUESS -gt $RANDOM_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    COUNT=$(( COUNT + 1 ))
  fi
  read GUESS
done

$PSQL "UPDATE users SET games_played = games_played + 1 WHERE username='$PLAYER_NAME'" &>/dev/null

if [[ $BEST_GAME -eq 0 || $COUNT -lt $BEST_GAME ]]
then
  $PSQL "UPDATE users SET best_game=$COUNT WHERE username='$PLAYER_NAME'" &>/dev/null
fi

echo "You guessed it in $COUNT tries. The secret number was $RANDOM_NUMBER. Nice job!"