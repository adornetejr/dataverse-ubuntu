# Shell script para Dataverse

Este script foi criado para faciliar a instalação e configuração inicial do Dataverse e suas dependências, GlassFish, Solr, PostgreSQL e Rserve, entre outros ajustes no sistema. 

## Início rápido

Primeiro passo é clonar o repositório.

### Clone

``` bash
$ git clone https://github.com/ginfo-cflex/dataverse-ubuntu.git
```

Segundo passo é mudar as permições de execução do script e executa-lo como root.

### Shell script

``` bash
$ chmod 744 install.sh
$ ./install.sh
```
## O Dataverse

O Dataverse é um aplicativo da Web de código-fonte aberto para compartilhar, preservar, citar, explorar e analisar dados de pesquisa. Desenvolvido em sua maior parte na linguagem Java, utiliza o servidor de aplicação Glassfish como serviço de back-end. Várias dependências são necessárias para a sua instalação funcionar corretamente, logo criamos um Shell script que ajuda na instalação destas.

### Versão

Atualmente, o script suporta exclusivamente a versão 4.9.1 do Dataverse para o sistema Ubuntu 18.04 LTS com todos os serviços em execução na mesma máquina. Recomenda-se o uso de um servidor dedicado para execução do script pois ele realizará alterações no sistema. 

### Componentes principais

* GlassFish server (Java EE application server)
  * Local padrão: */user/local/glassfish4*
  * Arquivo padrão de configuração: */usr/local/glassfish4/glassfish/domains/domain1/config/domain.xml*
  * `$ systemctl {start|stop|restart|status} glassfish`
* Solr (indexing)
  * Arquivo padrão de configuração: */usr/local/solr/example/solr/collection1/conf/schema.xml*
  * `$ systemctl {start|stop|restart|status} solr`
* Postgres (database)
  * Local padrão de configuração: */var/lib/pgsql/9.6/data/*
  * `$ systemctl {start|stop|restart|status} postgresql-9.6`
* Apache httpd 
  * Usado como proxy front-end para o Glassfish (e Shibboleth, se abilitado).
  * Local padrão de configuração: */etc/httpd/conf.d*
  * `$ systemctl {stop|start|restart|status} httpd.`
* Shibboleth
  * Fornece um provedor de autenticação adicional.
  * Arquivo padrão de configuração: */etc/shibboleth/shibboleth2.xml*
  * Serviço opcional, não configurado por padrão.
  * `$ systemctl {start|stop|restart|status} shibd`
 
### Configurações extras

Instalação, customização, administração e informações adicionais sobre o Dataverse podem ser encontradas nos guias do site: [Dataverse](http://guides.dataverse.org/en/4.9.1/).

[![Dataverse Project logo](src/main/webapp/resources/images/dataverseproject_logo.jpg?raw=true "Dataverse Project")](http://dataverse.org)

[![Build Status](https://travis-ci.org/IQSS/dataverse.svg?branch=develop)](https://travis-ci.org/IQSS/dataverse) [![Coverage Status](https://coveralls.io/repos/IQSS/dataverse/badge.svg?branch=develop&service=github)](https://coveralls.io/github/IQSS/dataverse?branch=develop)
