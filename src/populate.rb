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
    {sobrenome: "Silva", nome: "Joao", estado_id: 1},
    {sobrenome: "Ribeiro", nome: "Maria", estado_id: 2},
    {sobrenome: "Santos", nome: "Jose", estado_id: 3},
    {sobrenome: "Prestes", nome: "Joao", estado_id: 3},
    {sobrenome: "Castelo", nome: "Helena", estado_id: 3},
    {sobrenome: "Cardoso", nome: "Ana", estado_id: 4},
    {sobrenome: "Silva", nome: "Pedro", estado_id: 5},
    {sobrenome: "Silveira", nome: "Tomaz", estado_id: 6},
    {sobrenome: "Ribeiro", nome: "Paulo", estado_id: 7},
    {sobrenome: "de Moraes", nome: "Marcos", estado_id: 8},
    {sobrenome: "Bragas", nome: "Lucas", estado_id: 9},
    {sobrenome: "Campos", nome: "Leonidas", estado_id: 10},
    {sobrenome: "Santos", nome: "Joao", estado_id: 10},
])

Documento.create([
    {rg: "123456789", cpf: "12345678901", pessoa_id: 1},
    {rg: "987654321", cpf: "85765867067", pessoa_id: 2},
    {rg: "111111111", cpf: "98707098708", pessoa_id: 3},
    {rg: "222222222", cpf: "12341324234", pessoa_id: 4},
    {rg: "333333333", cpf: "76048672883", pessoa_id: 5},
    {rg: "123123323", cpf: "83769384750", pessoa_id: 6},
    {rg: "999999999", cpf: "22847548758", pessoa_id: 7},
    {rg: "787878787", cpf: "98744345357", pessoa_id: 8},
    {rg: "000000001", cpf: "58367865456", pessoa_id: 9},
    {rg: "556677889", cpf: "10101010384", pessoa_id: 10},
    {rg: "434343434", cpf: "32048579454", pessoa_id: 11},
    {rg: "676767676", cpf: "75842973967", pessoa_id: 12},
    {rg: "657578694", cpf: "86946850698", pessoa_id: 13},
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

pessoas = Pessoa.all
esportes = Esporte.all

pessoas.first.esporte << esportes.first
pessoas.first.esporte << esportes.second
pessoas.first.esporte << esportes.third
pessoas.second.esporte << esportes.second
pessoas.second.esporte << esportes.fourth
pessoas.second.esporte << esportes.third
pessoas.third.esporte << esportes.first
pessoas.third.esporte << esportes.second
pessoas.third.esporte << esportes.third
pessoas.fourth.esporte << esportes[8]
pessoas.fourth.esporte << esportes[9]
pessoas.fifth.esporte << esportes[5]
