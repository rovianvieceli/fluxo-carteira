# Introdução

Uma configuração básica do Docker, com configuração inicial, para um ambiente de desenvolvimento.

* Docker
* Nginx (latest)
* PHP-FPM (8.0)
* MySQL (5.7)

## Começo rápido

Coloque seu código na pasta `app`, execute` docker-compose up` e seu aplicativo estará disponível em `http://localhost`.

### Coisas a saber:

* A raiz do servidor está na pasta `./app`.
* Os arquivos de configuração estão localizados na pasta `./docker-compose`

## Nginx

Se você precisar personalizar a configuração do Nginx (e provavelmente o fará). Para adicionar mais hosts ou editar os
existentes, adicione/edite os arquivos localizados em `./docker-compose/nginx`.

## MySQL

O MySQL sobe com um banco configurado, chamado `sample` abaixo as configs do `docker-copose.yml`

```yml
      MYSQL_DATABASE: sample
      MYSQL_USER: admin
      MYSQL_PASSWORD: root
      MYSQL_ROOT_PASSWORD: root
```

# Ações

* Após subir os containers, entre no container do `php` e execute o `composer`

```bash
 docker-compose php bash 
```

###### No windows talvez seja necessário o comando winpty no inicio de instrução

* Volte um diretório, pois como sabemos está setado o `WORKDIR` para `/var/www/public`

```bash
cd ..
composer install
```
