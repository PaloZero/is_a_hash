require 'date'

class Task
	attr_reader :id, :date, :completed
	@task
	@id
	@completed
	@group
	@date
	
	def initialize(id, task, group, date)
		@id = id
		@task = task
		@group = group
		@date = date
		@completed = false
	end

	def ==(other)
		false unless @id == other.id
	end

	def <=>(other)
		self > other if @completed == false && other.completed == true
		self < other if @completed == true && other.completed == false
		date_order(self, other) if @completed == false && other.completed == false || @completed == true && other.completed == true
	end

	def date_order(task1, task2)
		task1 > task2 if task1.date == '' && task2.date.is_a?(Date) 
		task2 > task1 if task1.date.is_a?(Date) && task2.date == ''
		else task1.date <=> task2.date
	end

	def complete
		@completed = true
	end

	def completed?
		@completed == true
	end

	def has_data?
		@task == ''
	end

	def has_group?
		@group == ''
	end
end

date1 = Date.new(2015,03,20)
date2 = Date.new(2015,03,19)
task1 = Task.new(1,'Task1', "poo", date1)
task2 = Task.new(2,'Task2', "poo", date2)

puts task1 <=> task2   #1

task1.complete
puts task1.completed?

puts task1 <=> task2 #-1

