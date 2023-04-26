# Popula o banco de dados com 10 registros para cada tabela

require 'active_record'
require './tables.rb'

Estado.create([
    {sigla: "AC", nome: "Acre"},
    {sigla: "PR", nome: "Parana"},
    {sigla: "SP", nome: "Sao Paulo"},
    {sigla: "MG", nome: "Minas Gerais"},
    {sigla: "BA", nome: "Bahia"},
    {sigla: "RJ", nome: "Rio de Janeiro"},
    {sigla: "RS", nome: "Rio Grande do Sul"},
    {sigla: "SC", nome: "Santa Catarina"},
    {sigla: "GO", nome: "Goias"},
    {sigla: "MT", nome: "Mato Grosso"},
])

Pessoa.create([
    {sobrenome: "Silva", nome: "Joao", estados_id: 1},
    {sobrenome: "Ribeiro", nome: "Maria", estados_id: 2},
    {sobrenome: "Santos", nome: "Jose", estados_id: 3},
    {sobrenome: "Prestes", nome: "Joao", estados_id: 3},
    {sobrenome: "Castelo", nome: "Helena", estados_id: 3},
    {sobrenome: "Cardoso", nome: "Ana", estados_id: 4},
    {sobrenome: "Silva", nome: "Pedro", estados_id: 5},
    {sobrenome: "Silveira", nome: "Tomaz", estados_id: 6},
    {sobrenome: "Ribeiro", nome: "Paulo", estados_id: 7},
    {sobrenome: "de Moraes", nome: "Marcos", estados_id: 8},
    {sobrenome: "Bragas", nome: "Lucas", estados_id: 9},
    {sobrenome: "Campos", nome: "Leonidas", estados_id: 10},
    {sobrenome: "Santos", nome: "Joao", estados_id: 10},
])

Documento.create([
    {rg: "123456789", cpf: "12345678901", pessoas_id: 1},
    {rg: "987654321", cpf: "85765867067", pessoas_id: 2},
    {rg: "111111111", cpf: "98707098708", pessoas_id: 3},
    {rg: "222222222", cpf: "12341324234", pessoas_id: 4},
    {rg: "333333333", cpf: "76048672883", pessoas_id: 5},
    {rg: "123123323", cpf: "83769384750", pessoas_id: 6},
    {rg: "999999999", cpf: "22847548758", pessoas_id: 7},
    {rg: "787878787", cpf: "98744345357", pessoas_id: 8},
    {rg: "000000001", cpf: "58367865456", pessoas_id: 9},
    {rg: "556677889", cpf: "10101010384", pessoas_id: 10},
    {rg: "434343434", cpf: "32048579454", pessoas_id: 11},
    {rg: "676767676", cpf: "75842973967", pessoas_id: 12},
    {rg: "657578694", cpf: "86946850698", pessoas_id: 13},
])

Esporte.create([
    {nome: "Futebol"},
    {nome: "Volei"},
    {nome: "Basquete"},
    {nome: "Tenis"},
    {nome: "Natacao"},
    {nome: "Atletismo"},
    {nome: "Ginastica"},
    {nome: "Boxe"},
    {nome: "Judô"},
    {nome: "Ciclismo"},
    {nome: "Hipismo"},
])

PessoaEsporte.create([
    {pessoas_id: 1, esportes_id: 1},
    {pessoas_id: 1, esportes_id: 2},
    {pessoas_id: 1, esportes_id: 3},
    {pessoas_id: 2, esportes_id: 2},
    {pessoas_id: 2, esportes_id: 4},
    {pessoas_id: 2, esportes_id: 3},
    {pessoas_id: 3, esportes_id: 1},
    {pessoas_id: 3, esportes_id: 2},
    {pessoas_id: 3, esportes_id: 3},
    {pessoas_id: 4, esportes_id: 9},
    {pessoas_id: 4, esportes_id: 10},
    {pessoas_id: 5, esportes_id: 6},
])
