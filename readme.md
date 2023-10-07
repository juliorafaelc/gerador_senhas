# Gerador de Senhas aleatorias

Gerador de senhas aleatorias desenvolvida em Ruby ultilizando classes e metodos e testes unitarios com RSpec

## Instalação

Necessário instalação do Ruby 2.6.0 ou superior
Instalar as dependências utilizando o gerenciador de pacotes bundler

```bash
gem install bundler
```
```bash
bundle install
```

## Uso do Gerador de senhas

É necessário comentar a linha 68 para executar os testes unitários

Preencha os parametros na linha 68 para customizar sua senha, inserindo

tamanho: "tamanho da senha em numero"

letras_minusculas: "true ou false caso queira letras minúsculas em sua senha"

letras_maiusculas: "true ou false caso queira letras maiúsculas em sua senha"

numeros: "true ou false caso queira numeros em sua senha"

caracteres_especiais: "true ou false caso queira caracteres_especiais em sua senha"

Execute o comando pelo terminal:

```bash
ruby gerador_senha.rb
```

## Execução dos testes unitários
Acessar a pasta RSpec pelo terminal
```bash
cd rspec
```
Executar o comando no terminal
```bash
bundle exec rspec
```