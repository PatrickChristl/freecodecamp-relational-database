#! /bin/bash
PSQL="psql --username=freecodecamp --dbname=salon -t --no-align -c "
echo -e "~~~~~ MY SALON ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi
 
  # Get services from db
  SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
 
  # print dynamically
  echo "$SERVICES" | while IFS="|" read ID NAME
  do
    echo "$ID) $NAME"

  done
 
  read SERVICE_ID_SELECTED
 
  case $SERVICE_ID_SELECTED in
    1|2|3|4|5) RENT_SERVICE ;;
    *) MAIN_MENU "I could not find that service. What would you like today?" ;;
  esac
}

RENT_SERVICE() {
 
  AVAILABLE_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED" | xargs)
 
  # ask for phone number
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE

  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'" | xargs)

  # check if the customer exists
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
 

    # Insert new customer
    INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone,name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'" | xargs)

  fi
 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'" | xargs)
  # ask for service time
  echo -e "\nWhat time would you like your $AVAILABLE_SERVICE, $CUSTOMER_NAME?"
  read SERVICE_TIME

  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

  echo -e "\nI have put you down for a $AVAILABLE_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
 
  
}
 
MAIN_MENU
