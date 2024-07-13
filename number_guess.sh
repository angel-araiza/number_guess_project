#!/bin/bash
MIN=1
MAX=1000
SECRET_NUMBER=$(( RANDOM % (MAX - MIN + 1) + MIN))

PSQL="psql --username=freecodecamp --dbname=accounts -t --no-align -c"

echo "Enter your username:"
read USERNAME

CHECK_USERNAME=$($PSQL "SELECT username FROM accounts WHERE username = '$USERNAME'")
if [[ -z $CHECK_USERNAME ]]
then
  INSERT_USERNAME=$($PSQL "INSERT INTO accounts(username) VALUES('$USERNAME')")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM accounts WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM accounts WHERE username = '$USERNAME'")
  echo -e "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"
read GUESS
NUMBER_OF_GUESSES=1

GUESSING() {
if [[ ! $GUESS =~ ^[0-9]+$ ]]
then
  echo "That is not an integer, guess again:"
  read GUESS
  GUESSING
else
  if [[ $GUESS -eq $SECRET_NUMBER ]]
then
  CHECK_BEST=$($PSQL "SELECT best_game FROM accounts WHERE username = '$USERNAME'")
  if [[ -z $CHECK_BEST ]]
  then
    INSERT_GUESS=$($PSQL "UPDATE accounts SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
  else
    if [[ $NUMBER_OF_GUESSES -lt $CHECK_BEST ]]
    then
      UPDATE_BEST=$($PSQL "UPDATE accounts SET best_game = $NUMBER_OF_GUESSES WHERE username = '$USERNAME'")
    fi
  fi
  FIND_GP=$($PSQL "SELECT games_played FROM accounts WHERE username = '$USERNAME'")
  if [[ -z $FIND_GP ]]
  then
    INSERT_GP=$($PSQL "UPDATE accounts SET games_played =1 WHERE username = '$USERNAME'")
  else
    NEW_GP=$(( $FIND_GP + 1 ))
    UPDATE_GP=$($PSQL "UPDATE accounts SET games_played = $NEW_GP WHERE username = '$USERNAME'")
  fi
  echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
elif [[ $GUESS -gt $SECRET_NUMBER ]]
then
  (( NUMBER_OF_GUESSES++ ))
  echo "It's lower than that, guess again:"
  read GUESS
  GUESSING
else
  (( NUMBER_OF_GUESSES++ ))
  echo "It's higher than that, guess again:"
  read GUESS
  GUESSING
fi
fi

}

GUESSING