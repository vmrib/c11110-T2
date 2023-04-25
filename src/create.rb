# Cria um banco de dados SQLite3 com 4 tabelas:
#   - alunos
#   - professores
#   - dinf
#   - materias
#
# Um professor orienta vários alunos. Um aluno possui um orientador.
# Um aluno possui um login no dinf.
# Um aluno possui várias matérias e uma matéria possui vários alunos.
# Um professor possui várias matérias e uma matéria possui vários professores.
#
# A tabela alunos possui os seguintes campos:
#   - grr: string, chave primária
#   - nome: string
#   - grr_orientador: string, chave estrangeira
#
# A tabela professores possui os seguintes campos:
#   - grr: string, chave estrangeira
#   - nome: string
#
# A tabela dinf possui os seguintes campos:
#   - grr: string, chave estrangeira
#   - login: string
#
# A tabela materias possui os seguintes campos:
#   - grr_aluno: string, chave estrangeira
#   - grr_professor: string, chave estrangeira
#   - nome: string
#   - semestre: inteiro
#   - ano: inteiro

require 'active_record'


# Conecta no banco de dados
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'database.db')

# Cria a tabela alunos
ActiveRecord::Base.connection.create_table(:alunos, id: :string, primary_key: 'grr') do |t|
    t.string :nome
    t.references :professores, foreign_key: true
end

# Cria a tabela professores
ActiveRecord::Base.connection.create_table(:professores, id: :string, primary_key: 'grr') do |t|
    t.string :nome
end

# Cria a tabela dinf
ActiveRecord::Base.connection.create_table(:dinf, id: false) do |t|
    t.references :alunos, foreign_key: true
    t.string :login
end

# Cria a tabela materias
ActiveRecord::Base.connection.create_table(:materias, id: false) do |t|
    t.references :alunos, foreign_key: true
    t.references :professores, foreign_key: true
    t.string :nome
    t.integer :semestre
    t.integer :ano
end

