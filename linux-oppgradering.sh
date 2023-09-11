#!/bin/bash
# Oppgraderings-skript for ulike distribusjoner. Husk å gjøre skriptet kjørbart: chmod +x linux-oppgradering.sh
#
#
# (Kilde: http://www.linuxconfig.org/Bash_scripting_Tutorial)
#
echo "Hvilken distro er dette: "
cat /etc/*-release
#
#if [ ! "`whoami`" = "root" ]
#then
#    echo "Vennligst kjør skriptet som root. "
#    exit 1
#fi
echo "========================================== "
echo "Hva er din distribusjon? Velg fra 1-7. "
choice=9
 echo "1. Archlinux "
 echo "2. CentOS "
 echo "3. Debian "
 echo "4. Fedora "
 echo "5. Gentoo "
 echo "6. Sabayonlinux "
 echo "7. Ubuntu/Raspbian "
 echo "8. Avbryt "
 echo -n "Vennligst velg [1-8] "
while [ $choice -eq 9 ]; do
read choice

if [ $choice -eq 1 ] ; then
        echo "Archlinux "
        sudo pacman -Syu
        sudo pacman -Sc
        exit 0

else
if [ $choice -eq 2 ] ; then
        echo "CentOS "
	cat /etc/redhat-release
        sudo yum check-update
        sudo yum upgrade
        sudo yum clean all
        exit 0

else
if [ $choice -eq 3 ] ; then
        echo "Debian "
        sudo aptitude update
        sudo aptitude safe-upgrade
        sudo aptitude clean
        sudo aptitude autoclean
        exit 0

else
if [ $choice -eq 4 ] ; then
	echo "Fedora "
	sudo dnf update --refresh
        echo "Nydelig, Nå kan du ta deg en kaffe! "
	exit 0

else
if [ $choice -eq 5 ] ; then
	echo "Gentoo "
	emerge --sync
	emerge -avDuN world
	exit 0

else
if [ $choice -eq 6 ] ; then
        echo "Sabayon "
	equo update
        equo upgrade --ask
	equo cleanup
        exit 0

else
if [ $choice -eq 7 ] ; then
        echo "Ubuntu/Raspbian "
        sudo apt-get update
        sudo apt-get upgrade -y
		#echo -n "sudo apt-get dist-upgrade ? (y/n) " ; read answer
		#case $answer in
		#[Yy]* ) sudo apt-get dist-upgrade ;;
		#[Nn]* ) ;;
		#* ) ;;
        	#esac
    #sudo apt-get autoremove -y
	#sudo apt-get clean -y
	sudo apt-get autoclean -y
        echo "Nydelig, nå kan du ta deg en kaffe! "
	exit 0

else
if [ $choice -eq 8 ] ; then
        echo "avbryter... "
	echo "skuffelsen er til å ta og føle på :( "
        exit 0

else
        echo "Vennligst velg fra 1-8. "
        echo "1. Archlinux "
        echo "2. CentOS "
        echo "3. Debian "
        echo "4. Fedora "
	echo "5. Gentoo "
	echo "6. Sabayonlinux "
        echo "7. Ubuntu/Raspbian "
        echo "8. Avbryt "
        echo -n "Vennligst velg [1-8] "
        choice=9
fi
fi
fi
fi
fi
fi
fi
fi
done

