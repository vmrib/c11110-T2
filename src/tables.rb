# Cria modelos para as tabelas

require 'active_record'


# Conecta no banco de dados
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: '../db/database.db')

# Modelo para a tabela estados
class Estado < ActiveRecord::Base
    :has_many: :pessoas
end

# Modelo para a tabela pessoas
class Pessoa < ActiveRecord::Base
    :belongs_to :estados
    :has_one :documentos
    :has_and_belongs_to_many :esportes, -> uniq
end

# Modelo para a tabela documentos
class Documento < ActiveRecord::Base
    :belongs_to :pessoas
end

# Modelo para a tabela esportes
class Esporte < ActiveRecord::Base
    :has_and_belongs_to_many :pessoas, -> uniq
end