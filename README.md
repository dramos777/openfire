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
docker pull dramos777/openfire:1.0

```
Build da imagem:

```
git clone https://github.com/dramos777/openfire-1.0.git
cd openfire-1.0
docker image build -t dramos777/openfire:1.0 .

```

### Exemplos

```
docker volume create openfire
docker container run --name openfire-server -d -p 5222:5222 -p 5269:5269 -p 7443:7443 -p 9090:9090 -p 9091:9091 --mount type=volume,src=openfire,dst=/opt/openfire/ dramos777/openfire:1.0

```
No exemplo acima o container do servidor estará ativo e pronto para as configurações iniciais e conexão com o banco de dados (procedimento feito pela interface web).

### Testado em:
- Debian GNU/Linux 10 com Docker 20.10.9.
- Como banco de dados foi utilizado uma imagem do mariadb.

### Variáveis

- OPENFIRE_VERSION=4_6_4
- JDK_VERSION=11

Os valores acima serão atribuídos por padrão no build da imagem.

### Volumes

```
/etc/openfire/
/var/lib/openfire/
/var/log/

```
Os diretórios acima são links simbólicos.

```
/opt/openfire/

```
O diretório acima é o raiz da aplicação.

### Histórico

v1.0 26/10/2021, Emanuel Dramos:
- Criação do Dockerfile
- Criação do README.md
- Build da imagem e push para o Dockerhub
- Push do projeto para o github

v1.0 27/10/2021, Emanuel Dramos:
- Deploy da aplicação e conexão com o banco de dados


### Autor e mantenedor
Emanuel Dramos
- **Github:** https://github.com/dramos777
