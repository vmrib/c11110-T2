require 'active_record'
require './tables.rb'

def interact_with_user
  print "> "

  input = gets.chomp

  if input == "sair"
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
    .map { |attribute| attribute.tr "\"", ""}
    .map { |attribute| attribute.split("=") }
    .to_h

  return { operation: operation, table: table, attributes: attributes }
end

def get_model(table)
  case table
  when "estados"
    return Estado
  when "pessoas"
    return Pessoa
  when "documentos"
    return Documento
  when "esportes"
    return Esporte
  when "esportes_pessoas"
    return EsportesPessoa
  else
    puts "Tabela inválida"
    return nil
  end
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
    puts "Operação inválida"
  end
end

def insert(table, attributes)
  if get_model(table).nil?
    return
  end
  get_model(table).create(attributes)
end

def update(table, attributes)
  if get_model(table).nil?
    return
  end
  get_model(table).update(attributes)
end

def delete(table, attributes)
  if get_model(table).nil?
    return
  end
  get_model(table).where(attributes).destroy_all
end

def list(table, attributes)
  if get_model(table).nil?
    return
  end
  if not attributes.empty?
    puts "A operação lista não aceita atributos"
    return
  end

  case table
  when "estados"
    puts "id - sigla - nome"
    Estado.all.each do |estado|
      puts "#{estado.id} - #{estado.sigla} - #{estado.nome}"
    end
  when "pessoas"
    puts "id - nome - sobrenome - estado_id"
    Pessoa.all.each do |pessoa|
      puts "#{pessoa.id} - #{pessoa.nome} - #{pessoa.sobrenome} - #{pessoa.estado_id}"
    end
  when "documentos"
    puts "id - rg - cpf - pessoa_id"
    Documento.all.each do |documento|
      puts "#{documento.id} - #{documento.rg} - #{documento.cpf} - #{documento.pessoa_id}"
    end
  when "esportes"
    puts "id - nome"
    Esporte.all.each do |esporte|
      puts "#{esporte.id} - #{esporte.nome}"
    end
  when "esportes_pessoas"
    puts "esporte_id - pessoa_id"
    EsportesPessoa.all.each do |esportes_pessoa|
      puts "#{esportes_pessoa.esporte_id} - #{esportes_pessoa.pessoa_id}"
    end
  else
    puts "Tabela inválida"
  end
end