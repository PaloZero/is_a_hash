require 'date'

# this does not need description ma' friend ;)
class Task
	attr_reader :id, :date, :completed
	@task
	@id
	@completed
	@group
	@date
	
	# task constructor
	def initialize(id, task, group, date)
		@id = id
		@task = task
		@group = group
		@date = date
		@completed = false
	end

	# two tasks are the same if they have the same id
	def ==(other)
		false unless @id == other.id
	end

	# a task is greater than other if it is completed. If both are completed or incompleted, it is decided by their date.
	def <=>(other)
		return -1 if self.completed? == false && other.completed? == true
		return 1 if self.completed? == true && other.completed? == false
		date_order(self, other) if self.completed? == false && other.completed? == false || self.completed? == true && other.completed? == true
	end

	# a date 'spaceship' for tasks
	def date_order(task1, task2)
		return -1 if task1.has_date? == false && task2.has_date? == true 
		return 1 if task1.has_date? == true && task2.has_date? == false
		task1.date <=> task2.date if task1.has_date? == true && task2.has_date? == true
		id_order(task1, task2) if task1.date == task2.date
	end

	# an id 'spaceship' for tasks
	def id_order(task1, task2)
		return -1 if task1.id > task2.id
		return 1
	end

	# (eql? == '==') => true
	def eql?(other)
		self == other
	end

	# it hashes the id as an array because every task has a different id and hash method for arrays is really good !
	def hash
		[@id].hash
	end

	# completes a task
	def complete
		@completed = true
	end

	# ask if a task is completed
	def completed?
		@completed
	end

	# ask if task have date
	def has_date?
		@date == ''
	end

	# ask if task have group
	def has_group?
		@group == ''
	end

	def to_s
		"#{@id}\t[#{ if @completed then "x" else " " end }]\t#{ if @date.nil? then "\t" else @date.to_s end} #{yield; @task}"
	end
end

####TESTING####
date1 = Date.new(2015,03,20)
date2 = Date.new(2015,03,20)
task1 = Task.new(1,'Task', "poo", date1)
task2 = Task.new(2,'Task', "poo", date1)
task1.complete
puts task1.completed? #true

puts task1 <=> task2 #1

task2.complete
puts task2.completed? #true

puts task1 <=> task2 #1 because task2 is the last task

