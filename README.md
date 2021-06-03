# Laravel - Docker compose

<p align="center">
    <a href="https://laravel.com" rel="nofollow">
        <img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" style="max-width:100%;">
    </a>
</p>

<p align="center">
    <a href="https://https://www.docker.com/" rel="nofollow">
        <img width="400" alt="Logo-docker" src="https://www.docker.com/sites/default/files/d8/2019-07/horizontal-logo-monochromatic-white.png"/> 
    </a>
</p>

## Configurações


Para executar o arquivo de configuração de setup, certifique-se de que você tem as ferramentas 
**docker** e **docker-compose** devidamente instaladas em seu ambiente de desenvolvimento, utilizando
os seguintes comandos: 

```
$ docker -v
$ docker-compose -v
```

Caso não tenha as ferramentas em seu ambiente, instale-as utilizando os seguintes links:

- [Instalação do Docker](https://docs.docker.com/get-docker/)
- [Instalação do Docker Compose](https://docs.docker.com/compose/install/)

## Instalação

Para subir o container com um novo projeto laravel, digitando o seguinte comando:

```
$ ./setup.sh
```

Para subir o container a partir de um repositório ja existente, digitando o seguinte comando:

```
$ ./setup.sh --repo "link-do-repositório"
```

Caso o script tenha rodado com sucesso, você pode usar a api
acessando **http://localhost:9000** em sua máquina.

## Observações

1. Caso deseje rodar mais projetos laravel no seu ambiente, você deve ficar atento e trocar o número da porta
em que rodará seus aplicativos. Para alterar o número da porta, basta editar o arquivo **docker-compose.yml**.

2. Além disso, também é importante trocar o nome dos **containers** caso deseje rodar mais de um projeto em seu ambiente local. Para isso, basta alterar os itens **container_name** dos containers **app** e **nginx** no arquivo **docker-compose.yml**.
