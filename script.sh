#!/bin/bash
read -p "Appuyez sur Entrée pour commencer..."
echo ""
echo "Question 1"

#Question 1
# on supprime lignes vides, age >= 18, email non vide et format email valide
awk -F',' '!/^$/ && $4 >= 18 && $3 != "" && $3 ~ /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/ { print }' customer_profiles.csv
read -p "Appuyez sur Entrée pour continuer..."
echo ""

#Question 2
echo "Question 2"
echo ""

input_file="viewing_data.csv"
output_file="total_view_BOOM.csv"

awk -F',' '
NR > 1 { total[$1] += $5 }
END {
    print "customer_id,total_viewing_duration"
    for (id in total)
        print id "," total[id]
}' "$input_file" > "$output_file"

cat "$output_file"

read -p "Appuyez sur Entrée pour commencer..."
echo "Question 3"
