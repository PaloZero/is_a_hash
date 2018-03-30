class ToDos

  # Called when creating new instance of class ToDos.
  # Creates @to_dos as SortedSet.
  # Sets @current_id to 0.
  # Sets @current_group and @current date to nil in order not to be confused with other values.

  def initialize
    @to_dos = SortedSet.new
    @current_id = 0
    @current_date = nil
    @current_group = nil
  end

  def list

  end
  
  def add(id, task_name, group, date)
    add_group = @default_group unless @default_group.nil?
    add_date = @default_date unless @default_date.nil?
    item = Item.new(id, task_name, add_group, add_date)
    self << item
  end

  def find(query)
    each { |item| puts item if item.data.include?(query) }

  end

  def find_by_id(id)
    each { |item| return item if item.id == id}
  end

  def archive

  end

  #

  def next_id

  end

  def set_date(default_date)
    @default_date = default_date
  end

  def set_group(default_group)
    @default_group = default_group
  end

end