# we loggen in met een AD User in Linux
#nu willen we connecteren naar de Windows share

#We maken hier een script voor aan 
>nano connectToShare.sh

--> in het script

############################################################

#!/bin/bash

read -p "Enter folder name: " Usern
echo -n "Enter password: "
read -s PASS
echo -e "\n"

#map aanmaken om de share op te mounten
mkdir "/home/$Usern@ssol.local/share"

#plaatsen van de share in /etc/fstab met de username & passwd
echo -e "//10.14.2.3/Home/$Usern\t/home/$User@ssol.local/share\tcifs\tusername=$Usern@ssol.local,password=$PASS\t0 0" >> /etc/fstab

#het mounten van de map
mount "/home/$Usern@ssol.local/share" -o uid="$Usern@ssol.local" -o gid="domain users@ssol.local"

exit
############################################################

#script uitvoerbaar maken
># chmod +x connectToShare.sh

#nu moeten we er voor zorgen dat elke nieuwe AD gebruiker dit script heeft 

># cp connectToShare.sh /etc/skel/connectToShare.sh

# de bestanden die in /etc/skel staan wordt automatisch aangemaakt voor nieuwe users
