#CREATED BY $Yenot_HaCK$
url_checker() {
	if [ ! "${1//:*}" = http ]; then
		if [ ! "${1//:*}" = https ]; then
			echo -e "\e[31m[!] URL invalida. Ingresa una pinche URL de verdad we \e[0m"
			exit 1
		fi
	fi
}

RED="\e[31m"
STOP="\e[0m"
printf "${RED}" 
figlet -w 130 -c -f smslant URLcut
printf ${STOP}

echo -n "Ingresa la URL > "
read phish
url_checker $phish
sleep 1
echo "Procesando la URL"
short=$(curl -s https://is.gd/create.php\?format\=simple\&url\=${phish})
shorter=${short#https://}
echo -e "\n\e[1;31m### Dominio de encasamiento ###\e[0m"
echo 'Dominio para enmascarar la URL(con http o https), por ejemplo: https://google.com, http: //cualquier cosa.org)a'
echo -en "\e[32m=>\e[0m"
read mask
url_checker $mask
echo -e '\nEscriba palabras de ingeniería social: (como dinero gratis, mejores trucos de publicación)'
echo -e "\e[31mNo use el espacio, solo use '-' entre las palabras de ingeniería social\e[0m"
echo -en "\e[32m=>\e[0m "
read words
echo -e "\nGenerando URL...\n"
echo "[==================]0%"
sleep 1
echo "[====================================]25%"
sleep 3
echo "[======================================================]50%"
sleep 3
echo "[========================================================================]75%"
sleep 5
echo -e "\e[1;34m[==========================================================================================]100%\e[0m"
sleep 5
final=$mask-$words@$shorter
echo -e "\nURL Generada > \e[32m ${final} \e[0m\n"
