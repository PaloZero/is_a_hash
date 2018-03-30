
require_relative 'to_dos'
require_relative 'string'
require_relative 'date'
require_relative 'task'

to_do_list = ToDos.new

while (input = gets.chomp) != 'exit'
  data_array = input.parse


  case data_array[0]
    when 'add'
      to_do_list.add(data_array[1], data_array[2], data_array[3])
    when 'list'
      if data_array.last != ''
        to_do_list.list_by_date(data_array.last.transform_to_date)
      elsif data_array[1] != ''
        to_do_list.list_by_group(data_array[1])
      else
        to_do_list.list
      end
    when 'complete'
      to_do_list.complete(data_array[1])
    when 'ac'
      to_do_list.archive
    when 'save'
      to_do_list.save(data_array[1])
    when 'open'
      to_do_list.open(data_array[1])
    when 'find'
      to_do_list.find(data_array[1])
    when 'set'
      to_do_list.set(data_array[1])
    when 'help'
      puts "List of valid Commands:
          add - add a new task
          list - list all tasks
          ac - archive all files
          save - saves To Do List to file
          open - loads To Do List from file
          find - searches To Do list for matches
          set - sets default group or date
          exit - ends programs"
    else
      puts 'INVALID COMMAND'
  end
end