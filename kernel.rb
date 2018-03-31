module Kernel
  alias_method :old_puts, :puts
  def puts (s)
    old_puts(' ' + s)
  end
end