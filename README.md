# Execução

Para (re)criar o banco de dados execute

    $ source recreate_db.sh

Para rodar o programa execute

    $ ruby main.rb

# Operações

- `insere` - insere uma nova entrada na tabela
- `altera` - altera uma entrada da tabela
- `exclui` - remove uma entrada da tabela
- `lista` - exibe todas as entradas da tabela

## Formato

Para as operações `insere` e `exclui` o formato é

    <operação> <tabela> <atributo>=<valor> <atributo>=<valor> ...

Para a operação `altera` o formato é

    <operação> <tabela> <atributo>=<valor> <atributo>=<valor> ...
    <atributo>=<valor> <atributo>=<valor> ...

Para a operação `lista` o formato é

    <operação> <tabela>

## Exemplos

    insere pessoas nome="João" idade=20 estado="SP"

    altera pessoas nome="João"
    idade=21

    exclui pessoas nome="João"

    lista pessoas

# Tabelas

- estados
- pessoas
- documentos
- esportes
- espotes_pessoas

## Relacionamentos

- estados -> pessoas: 1:N
- pessoas -> documentos: 1:1
- pessoas -> esportes: N:N
