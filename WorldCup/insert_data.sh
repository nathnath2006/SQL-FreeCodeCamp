#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  #Teams insert
  if [[ $YEAR != "year" ]]
  then
    WINNING_TEAM=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $WINNING_TEAM ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES ('$WINNER')"
    fi

    OPPONENT_TEAM=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $OPPONENT_TEAM ]]
    then
      $PSQL "INSERT INTO teams(name) VALUES ('$OPPONENT')"
    fi
    echo "WINNER: $WINNER | OPPONENT: $OPPONENT"

    #Games insert
    WINNING_TEAM=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    OPPONENT_TEAM=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    $PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES ($YEAR,'$ROUND','$WINNING_TEAM','$OPPONENT_TEAM',$WINNER_GOALS,$OPPONENT_GOALS)"
  fi
done