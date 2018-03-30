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

  def add

  end

  def find

  end

  def find_by_id

  end

  def archive

  end

  #

  def next_id
    @current_id += 1
  end

  def set_date

  end

  def set_group

  end
end