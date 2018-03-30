require_relative 'task'
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
    @to_dos.each { |e| @to_dos.delete(e) if e.complete?}
  end
  
  def next_id

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