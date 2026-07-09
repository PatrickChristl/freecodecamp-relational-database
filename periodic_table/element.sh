#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c "

if [[ $# -eq 0 ]] 
then
  echo "Please provide an element as an argument."
  exit
fi

input=$1

#if input is a number
if [[ $input =~ ^[0-9]+$ ]]
then
required_data=$($PSQL "SELECT atomic_number, name , symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$input");
if [[ -z "$required_data" ]]
then
  echo "I could not find that element in the database."
  exit
fi
#IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$required_data"
#echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."



#if input is a symbol
elif [[ ${#input} -le 2 ]]
then
required_data=$($PSQL "SELECT atomic_number, name , symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol='$input'");
if [[ -z "$required_data" ]] 
then
  echo "I could not find that element in the database."
  exit
fi
#IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$required_data"
#echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

else
required_data=$($PSQL "SELECT atomic_number, name , symbol, type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE name='$input'");
if [[ -z "$required_data" ]] 
then
  echo "I could not find that element in the database."
  exit
fi
#IFS="|" read ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$required_data"
#echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

fi


#IFS="|" read -r atomic_number name symbol type atomic_mass melting_point boiling_point <<< "$required_data"
required_data=$(echo "$required_data" | sed 's/^ *//')
IFS="|" read -r ATOMIC_NUMBER NAME SYMBOL TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$required_data"

echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

