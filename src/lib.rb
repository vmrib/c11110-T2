require 'active_record'

def interact_with_user
  print "> "

  input = gets.chomp

  if input == "exit"
    exit
  end

  query = parse_input(input)
  execute_query(query)

  interact_with_user
end

def parse_input(input)
  input = input.split
  operation = check_operation(input[0])
  table = input[1]
  attributes = input[2..]
    .map { |attribute| attribute.split("=") }
    .to_h

  return { operation: operation, table: table, attributes: attributes }
end

def check_operation(operation)
  if operation == "insere" || operation == "altera" || operation == "exclui" || operation == "lista"
    return operation
  else
    raise "Operação inválida"
  end
end

def execute_query(query)
end