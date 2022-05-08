#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

#display title
echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to My Salon, how can I help you?\n"

#functions
  MAIN_MENU(){
    # display argument if exist
    if [[ $1 ]]
    then
      echo -e "\n$1"
    fi
  #get services
  SERVICES=$($PSQL "SELECT * FROM services ORDER BY service_id")
  #show service menu
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
  do
  echo "$SERVICE_ID) $SERVICE_NAME"
  done
  #read service selected
  read SERVICE_ID_SELECTED
  #if input is not INT
  if  [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    # return to main menu
    MAIN_MENU "That is not a valid service number."
  fi
  #if input is an integer but is not a service
  SERVICE_ID_SELECTED_CHECK=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")
  if [[ -z $SERVICE_ID_SELECTED_CHECK ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  fi
  }

  CUSTOMER(){
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE' ")
  #if customer doesn't exist
  if [[ -z $CUSTOMER_NAME ]]
  then 
  #get new customer name
    echo -e "\n I don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #insert into table
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE' ")
  fi
  }

  TIME(){
  SERV_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = '$SERVICE_ID_SELECTED' ")

  echo -e "\n What time would you like your $SERV_SELECTED, $CUSTOMER_NAME ? "
  read SERVICE_TIME
  }

  CONFIRMATION(){
  
  INSERT_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id,service_id,time) VALUES ( '$CUSTOMER_ID', '$SERVICE_ID_SELECTED' , '$SERVICE_TIME') " )
  echo -e "\n I have put you down for a $SERV_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
  }

#program
  MAIN_MENU
  CUSTOMER
  TIME
  CONFIRMATION
