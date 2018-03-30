require_relative 'task'
require 'yaml'

class ToDos

  # Called when creating new instance of class ToDos.
  # Creates @to_dos as SortedSet.
  # Sets @current_id to 0.
  # Sets @default_group and @default_date to nil in order not to be confused with other values.

  def initialize
    @to_dos = SortedSet.new
    @current_id = 0
    @default_date = nil
    @default_group = nil
  end

  def list
    @to_dos.each { |task| task.to_s { yield } }
  end

  def list_by_group(group_name)
    @to_dos.each { |task| task.to_s { "+" + task.group.to_s } if task.group == group_name }
  end

  def list_by_date(date)
    @to_dos.each { |task| task.to_s if task.date == date }
  end

  # Adds a new Item to the To Do List
  def add(id, task_name, group, date)
    add_group = @default_group unless @default_group.nil?
    add_date = @default_date unless @default_date.nil?
    item = Item.new(id, task_name, add_group, add_date)
    self << item
  end

  # Searches the To Do List for an Item's Task Data that matches 'query'
  def find(query)
    each { |item| puts item if item.data.include?(query) }
  end

  # Seatches the ToDo List for an Item's ID that matches 'id'
  def find_by_id(id)
    each { |item| return item if item.id == id}
  end

  def archive
    @to_dos.each { |e| @to_dos.delete(e) if e.complete? }
  end

  def save(filename)
    serialized_self = YAML.dump(self)
    File.open(filename, "w") do |savefile|
      savefile.syswrite(serialized_self.to_s)
    end
    self
  end

  def open(filename)
    serialized_self = nil
    File.open(filename, "r") do |savefile|
      serialized_self = savefile.gets
    end
    my_load = YAML.load(serialized_self)
    @to_dos.clear
    @to_dos = my_load.to_dos
    @current_id = my_load.current_id
    @default_date = my_load.default_date
    @default_group = my_load.default_group
    self
  end
  
  private def next_id
    @current_id += 1
  end

  # Sets the Item's default Due Date to 'default_date'
  def set_date(default_date)
    @default_date = default_date
  end

  # Sets the Item's default Group to 'default_group'
  def set_group(default_group)
    @default_group = default_group
  end
end