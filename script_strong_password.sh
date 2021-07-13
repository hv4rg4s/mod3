#! /bin/bash
#by hvargas
#PCI DSS
#https://es.pcisecuritystandards.org/_onelink_/pcisecurity/en2es/minisite/en/docs/PCI_DSS_v3.pdf

#8.2.3 Las contraseñas/frases deben tener lo siguiente:
#• Una longitud mínima de siete caracteres.
#• Combinación de caracteres numéricos y alfabéticos. 
#De manera alternativa, la contraseña/frase debe tener una complejidad y una solidez, al menos,equivalente a los parámetros que se especifican anteriormente.

#8.2.5 No permita que una persona envíe una contraseña/frase nueva que sea igual a cualquiera de las últimas cuatro contraseñas/frases utilizadas.

#Install libpam-pwquality cracklib-runtime for strong password policy 
sudo apt-get -y install libpam-pwquality cracklib-runtime
#sudo vi /etc/pam.d/common-password
echo 'Editing common-password file to apply policies:'

sudo sed -i '25 c\
password        requisite                       pam_pwquality.so retry=3 minlen=7 lcredit=-1 ucredit=-1 dcredit=-1 ocredit=-1 remember=4 difok=2' /etc/pam.d/common-password

#retry: No. of consecutive times a user can enter an incorrect password.
#minlen: Minimum length of password
#difok: No. of character that can be similar to the old password
#lcredit: Min No. of lowercase letters
#ucredit: Min No. of uppercase letters
#dcredit: Min No. of digits
#ocredit: Min No. of symbols
#remember: The number of previous passwords against which you want to check for a repeating password 


echo 'Editing login.defs file to apply policies maximum number of days a password may be used:'

#8.2.4 Cambie la contraseña/frase de usuario, al menos, cada 90 días.
# Password aging controls:
#
#       PASS_MAX_DAYS   Maximum number of days a password may be used.
#       PASS_MIN_DAYS   Minimum number of days allowed between password changes.
#       PASS_WARN_AGE   Number of days warning given before a password expires.
#default 
#PASS_MIN_DAYS   0
#PASS_WARN_AGE   7
#sudo vi /etc/login.defs

sudo sed -i '160 c\
PASS_MAX_DAYS   90' /etc/login.defs
