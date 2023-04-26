# Cria um banco de dados SQLite3 com 3 tabelas:
#   - estados
#   - pessoas
#   - documentos
#   - esportes
#   - esportes_pessoas
#
# Um estado possui várias pessoas e uma pessoa possui um estado.
# Uma pessoa possui um documento e um documento pertence a uma pessoa.
# Uma pessoa pode praticar vários esportes e um esporte pode ser praticado por várias pessoas.
#
# A tabela estados possui os seguintes campos:
#   - id: inteiro, chave primária, autoincremento
#   - sigla: string, limite 2 caracteres
#   - nome: string
#
# A tabela pessoas possui os seguintes campos:
#   - id: inteiro, chave primária, autoincremento
#   - sobrenome: string
#   - nome: string
#   - estados_id: inteiro, chave estrangeira
#
# A tabela documentos possui os seguintes campos:
#   - id: inteiro, chave primária, autoincremento
#   - rg: string
#   - cpf: string
#   - pessoas_id: inteiro, chave estrangeira
#
# A tabela esportes possui os seguintes campos:
#   - id: inteiro, chave primária, autoincremento
#   - nome: string
#
# A tabela esportes_pessoas possui os seguintes campos:
#   - esportes_id: inteiro, chave estrangeira
#   - pessoas_id: inteiro, chave estrangeira
#
require 'active_record'


# Conecta no banco de dados
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../db/database.db')

# Cria a tabela estados
ActiveRecord::Base.connection.create_table :estados do |t|
    t.string :sigla, limit: 2
    t.string :nome
end

# Cria a tabela pessoas
ActiveRecord::Base.connection.create_table :pessoas do |t|
    t.string :sobrenome
    t.string :nome
    t.references :estados, foreign_key: true
end

# Cria a tabela documentos
ActiveRecord::Base.connection.create_table :documentos do |t|
    t.string :rg
    t.string :cpf
    t.references :pessoas, foreign_key: true
end

# Cria a tabela esportes
ActiveRecord::Base.connection.create_table :esportes do |t|
    t.string :nome
end

# Cria a tabela esportes_pessoas
ActiveRecord::Base.connection.create_table :esportes_pessoas, id: false do |t|
    t.references :esportes, foreign_key: true
    t.references :pessoas, foreign_key: true
end

