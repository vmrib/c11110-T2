# Cria modelos para as tabelas

require 'active_record'


# Conecta no banco de dados
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'database.db')

# Modelo para a tabela alunos
class Aluno < ActiveRecord::Base
    :belongs_to :professores
    :has_one :dinf
    :has_and_belongs_to_many :materias
end

# Modelo para a tabela professores
class Professor < ActiveRecord::Base
    :has_many :alunos
    :has_and_belongs_to_many :materias
end

# Modelo para a tabela dinf
class Dinf < ActiveRecord::Base
    :belongs_to :alunos
end

# Modelo para a tabela materias
class Materia < ActiveRecord::Base
    :belongs_to :alunos
    :belongs_to :professores
end