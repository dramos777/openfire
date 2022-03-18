# Openfire
*Openfire is a real time collaboration (RTC) server licensed under the Open Source Apache License. It uses the only widely adopted open protocol for instant messaging, XMPP Openfire is incredibly easy to setup and administer, but offers rock-solid security and performance. (https://www.igniterealtime.org/projects/openfire/)*

### Resumo

Imagem docker criada para simplificar o deploy da aplicação openfire em ambientes Linux.

### Dependências

- Linux
- Docker 

### Forma de usar
Download da imagem do Dockerhub:

```
docker pull dramos777/openfire:1.2

```
Build da imagem:

```
git clone https://github.com/dramos777/openfire-1.2.git
cd openfire-1.2
docker image build -t dramos777/openfire:1.2 .

```

### Exemplos

```
docker container run --name openfire-app -d --network openfire -p 5222:5222 -p 5269:5269 -p 7443:7443 -p 9090:9090 -p 9091:9091 --mount type=volume,src=openfire,dst=/opt/openfire/ dramos777/openfire:1.2

```

### Testado em:
- Debian GNU/Linux 11 com Docker 20.10.12.
- Debian GNU/Linux 10 com Docker 20.10.9.
- Como banco de dados foi utilizado uma imagem do mariadb.

### Variáveis

- OPENFIRE_VERSION=4_7_1
- JDK_VERSION=11

Os valores acima serão atribuídos por padrão no build da imagem.

### Volumes

```
/etc/openfire/
/var/lib/openfire/
/var/log/

```
Os diretórios acima são links simbólicos. O diretório raiz da aplicação é /opt/openfire

### Histórico

v1.0 28/10/2021, Emanuel Dramos:
- Criação do Dockerfile
- Criação do README.md
- Build da imagem e push para o Dockerhub
- Push do projeto para o github

v1.0 28/10/2021, Emanuel Dramos:
- Deploy da aplicação e conexão com o banco de dados

v1.2 18/03/2022, Emanuel Dramos:
- Atualização da versão do openfire (v4.7.1)
- Atualização do Dockerfile (v1.2)
- Atualização do docker-compose.yml
- Deploy da aplicação e conexção com o mariadb


### Autor e mantenedor
Emanuel Dramos
- **Github:** https://github.com/dramos777
