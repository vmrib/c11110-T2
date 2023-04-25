require 'active_record'

# Connect to the database
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'test.db')

# Create a new table called 'estados' with the columns 'id', 'nome' and 'sigla'
# CREATE TABLE estados (
#   id INTEGER PRIMARY KEY AUTOINCREMENT,
#   sigla varchar(2)
#   nome varchar(255),
# )
ActiveRecord::Base.connection.create_table :estados do |t|
  t.string :sigla, limit: 2
  t.string :nome
end

# Create a model called Estado
# Expects a table named `users`  by convention
class Estado < ActiveRecord::Base
end

# Create a new estado object then save it to store in database
estado = Estado.new(sigla: "AC", nome: "Acre")
estado.save

# Create and save in one step with `.create()`
Estado.create(sigla: "PR", nome: "Parana")

# Create and save record with hash
record = {"sigla" => "SP", "nome" => "Sao Paulo"}
Estado.create(record)