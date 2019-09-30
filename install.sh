#!/bin/bash
DIR=$PWD
# ATUALIZA PACOTES
apt update -y
# ATUALIZA PACOTES
apt upgrade -y
# INSTALA PACOTES OPCIONAIS
apt install -y nano lynx net-tools git htop 
# INSTALA PACOTES OBRIGATORIOS
apt install -y wget unzip curl lsof openjdk-8-jdk openjdk-8-jre imagemagick postfix r-base
# CONFIGURA SENDMAIL
cd /etc/postfix
cp $DIR/main.cf .
service postfix restart
# DOWNLOAD DOS PACOTES DE INSTALACAO DO DATAVERSE
dvinstall="/tmp/dvinstall.zip"
link=https://github.com/IQSS/dataverse/releases/download/v4.9.1/dvinstall.zip
cd /tmp/
if [ -f "$dvinstall" ]
then
    ls $dvinstall
    md5sum $dvinstall
else
    wget $link
fi
# REMOVE AS PASTAS ANTES DE DESCOMPACTAR
rm -rf dvinstall
unzip dvinstall.zip
echo "Etapa (1/7) concluida!"
echo "Pressione Ctrl+C para cancelar e Enter para continuar!"
read -e $X
cd $DIR
chmod 744 glassfish.sh
sudo ./glassfish.sh
echo "Etapa (2/7) concluida!"
echo "Pressione Ctrl+C para cancelar e Enter para continuar!"
read -e $X
cd $DIR
chmod 744 jq.sh
sudo ./jq.sh
echo "Etapa (3/7) concluida!"
echo "Pressione Ctrl+C para cancelar e Enter para continuar!"
read -e $X
cd $DIR
chmod 744 solr.sh
sudo ./solr.sh
echo "Etapa (4/7) concluida!"
echo "Pressione Ctrl+C para cancelar e Enter para continuar!"
read -e $X
cd $DIR
chmod 744 postgresql.sh
sudo ./postgresql.sh
echo "Etapa (5/7) concluida!"
echo "Pressione Ctrl+C para cancelar e Enter para continuar!"
read -e $X
cd $DIR
chmod 744 rserve.sh
sudo ./rserve.sh
clear
echo "Etapa (6/7) concluida!"
echo " "
echo "ATENÇÃO!!"
echo " "
echo "Se a próxima etapa trancar em 'Updates Done. Retarting...' por mais de 30 segundos."
echo " "
echo "Abra outro terminal e execute o comando:"
echo "# service glassfish restart"
echo " "
echo "Pressione Ctrl+C para cancelar e Enter para continuar!"
read -e $X
# EXECUTA SCRIPT DE INSTALACAO DO DATAVERSE
#
# SE O SCRIPT TRANCAR EM 'Updates Done. Retarting...'
# ABRA OUTRO TERMINAL E REINICIE O GLASSFISH
# $ systemctl restart glassfish.service
#
cd /tmp/dvinstall
rm -rf default.config
cp $DIR/default.config .
./install
echo "Etapa (7/7) concluida!"
