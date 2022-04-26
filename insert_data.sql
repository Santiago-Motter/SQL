#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE TABLE games, teams")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
#OPPONENT
  if [[ $OPPONENT != opponent ]]
  then
    TEAM_ID_O=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    if [[ -z $TEAM_ID_O ]]
    then
      INSERT_TEAM_RESULT_O=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT_O == "INSERT 0 1" ]]
      then       
        echo inserted into teams, $OPPONENT
      fi
    fi
  fi
#WINNER
if [[ $WINNER != winner ]]
  then
    TEAM_ID_W=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    if [[ -z $TEAM_ID_W ]]
    then
      INSERT_TEAM_RESULT_W=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_TEAM_RESULT_W == "INSERT 0 1" ]]
      then       
        echo inserted into teams, $WINNER
      fi
    fi
  fi

#GAMES
TEAM_ID_W=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
TEAM_ID_O=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

if [[ -n $TEAM_ID_W || -n $TEAM_ID_O ]]
then
  if [[ $YEAR != year ]]
  then
    INSERT_GAMES=$($PSQL "INSERT INTO games (year,round,winner_id,opponent_id,winner_goals,opponent_goals) VALUES ('$YEAR', '$ROUND', '$TEAM_ID_W', '$TEAM_ID_O','$WINNER_GOALS', '$OPPONENT_GOALS')")
    if [[ $INSERT_GAMES == "INSERT 0 1" ]]
    then       
      echo inserted into games, $YEAR
    fi
  fi
fi


done


