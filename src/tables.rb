# Cria modelos para as tabelas

require 'active_record'


# Conecta no banco de dados
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../db/database.sqlite3')

# Modelo para a tabela estados
class Estado < ActiveRecord::Base
    has_many :pessoa, dependent: :destroy
end

# Modelo para a tabela pessoas
class Pessoa < ActiveRecord::Base
    belongs_to :estado
    has_one :documento, dependent: :destroy
    has_and_belongs_to_many :esporte, -> { distinct }, dependent: :destroy
end

# Modelo para a tabela documentos
class Documento < ActiveRecord::Base
    belongs_to :pessoa
end

# Modelo para a tabela esportes
class Esporte < ActiveRecord::Base
    has_and_belongs_to_many :pessoa, -> { distinct }, dependent: :destroy
end

# Modelo para a tabela esportes_pessoas
class EsportesPessoa < ActiveRecord::Base
    belongs_to :esporte
    belongs_to :pessoa
end