require 'active_record'
require './tables.rb'

def interact_with_user
  print "> "

  input = gets.chomp

  if input == "exit"
    exit
  end

  command = parse_input(input)
  execute_command(command)

  interact_with_user
end

def parse_input(input)
  input = input.split
  operation = input[0]
  table = input[1]
  attributes = input[2..]
    .map { |attribute| attribute.split("=") }
    .to_h

  return { operation: operation, table: table, attributes: attributes }
end

def execute_command(command)
  case command[:operation]
  when "insere"
    insert(command[:table], command[:attributes])
  when "altera"
    update(command[:table], command[:attributes])
  when "exclui"
    delete(command[:table], command[:attributes])
  when "lista"
    list(command[:table], command[:attributes])
  else
    raise "Operação inválida"
  end
end

def insert(table, attributes)
  case table
  when "estados"
    Estado.create(attributes)
  when "pessoas"
    Pessoa.create(attributes)
  when "documentos"
    Documento.create(attributes)
  when "esportes"
    Esporte.create(attributes)
  else
    raise "Tabela inválida"
  end
end

def update(table, attributes)
  case table
  when "estados"
    Estado.update(attributes)
  when "pessoas"
    Pessoa.update(attributes)
  when "documentos"
    Documento.update(attributes)
  when "esportes"
    Esporte.update(attributes)
  else
    raise "Tabela inválida"
  end
end

def delete(table, attributes)
  case table
  when "estados"
    Estado.destroy(attributes)
  when "pessoas"
    Pessoa.destroy(attributes)
  when "documentos"
    Documento.destroy(attributes)
  when "esportes"
    Esporte.destroy(attributes)
  else
    raise "Tabela inválida"
  end
end

def list(table, attributes)
  case table
  when "estados"
    Estado.all.each do |estado|
      puts "#{estado.id} - #{estado.sigla} - #{estado.nome}"
    end
  when "pessoas"
    Pessoa.all.each do |pessoa|
      puts "#{pessoa.id} - #{pessoa.nome} #{pessoa.sobrenome} - #{pessoa.estados.sigla}"
    end
  when "documentos"
    Documento.all.each do |documento|
      puts "#{documento.id} - #{documento.rg} - #{documento.cpf} - #{documento.pessoas.nome} #{documento.pessoas.sobrenome}"
    end
  when "esportes"
    Esporte.all.each do |esporte|
      puts "#{esporte.id} - #{esporte.nome}"
    end
  else
    raise "Tabela inválida"
  end
end