class ToDos

  # Called when creating new instance of class ToDos.
  # Creates @to_dos as SortedSet.
  # Sets @current_id to 0.
  # Sets @current_group and @current date to nil in order not to be confused with other values.

  def initialize
    @to_dos = SortedSet.new
    @groups = []
    @current_id = 0
    @default_date = nil
    @default_group = nil
  end

  def list
    
  end
  

  # Adds a new Item to the To Do List
  def add(id, task_name, group, date)
    group = @default_group unless @default_group.nil? || group != ''
    date = @default_date unless @default_date.nil? || date != ''
    @groups.add_group_array(group)
    item = Item.new(next_id, task_name, add_group, add_date)
    self << item
  end

  # Searches the To Do List for an Item's Task Data that matches 'query'
  def find(query)
    @to_dos.each { |item| puts item if item.data.include?(query) }
  end

  # Seatches the ToDo List for an Item's ID that matches 'id'
  def find_by_id(id)
    @to_dos.each { |item| return item if item.id == id}
  end

  def archive

  end

  #

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

  # Adds 'group' to the Groups Array if it is not already in it
  def add_group_array(group)
    @groups.append(group) unless @groups.include(group)
  end

end