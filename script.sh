#!/bin/bash
read -p "Appuyez sur Entrée pour commencer..."
echo ""
echo "Question 1"

#Question 1
# on affiche sans lignes vides, age >= 18, email non vide et format email valide, 
# on utilise une expression reguliere ici mais dans le cas présent cela ne semble pas utile car les emails semblent tous valides dans le CSV
# on la laisse au cas où ca arrive lol
awk -F',' '!/^$/ && $4 > 0 && $3 != "" && $3 ~ /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/ { print }' customer_profiles.csv
read -p "Appuyez sur Entrée pour continuer..."
echo ""

#Question 2
echo "Question 2"
echo ""

input_file="viewing_data.csv"
output_file="total_view_BOOM.csv"

# ici on fait la somme par utilisateur
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
echo "Les tableaux en Bash j'ai jamais vu ca de toute ma fucking vie"

#ce qui suit sont des tests de compréhension, ne pas tenir compte si j'ai pas le temps de modifier mon code avant de push lol
Tableau=("Linux" "Windows" "MacOS")
echo "${Tableau[1]}"
Tableau+=([6]="Android")
Tableau[1]="iOS"
echo "${Tableau[0]}"
echo "${Tableau[1]}"