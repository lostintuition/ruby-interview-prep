#! /usr/bin/env ruby

# Suppose you need to reorder the elements of a very large array so tha the equal elements appear together. For example, if the array is (b,a,c,b,d,a,b,d) then (a,a,b,b,b,c,d,d) is an acceptable reordering, as is (d,d,c,a,a,b,b,b).
#
# If the entries are integers, this reordering can be achieved by sorting the array. If the number of distinct integers is very small relative to the size of the array, an efficient approach to sorting the array is to count the number of occurrences of each distinct integer and write the appropriate number of each integer, in sorted order, to the array. When array entires are objects, with multiple fields, only one of which is to be used as a key, the problem is harder to solve.
#
# You are given an array of student objects. Each student has an integer-valued age field taht is to be treated as a key. Rearrange the elements of the array so that the students of equal age appear together. The order in which different ages appear is not important. How would your solution change if ages have to appear in sorted order?

# This was my original answer. It is similar in complexity to the book's answer, except that it has a space complexity of O(n) rather than O(m).
def partition_array(students)
  age_to_student = {}
  students.each do |student|
    if age_to_student.has_key?(student.age)
      age_to_student[student.age].push(student)
    else
      age_to_student[student.age] = [student]
    end
  end

  ages = age_to_student.keys
  sorted_ages = ages.sort

  partitioned_students = []
  sorted_ages.each do |age|
    age_to_student[age].each do |student|
      partitioned_students.push(student)
    end
  end

  return partitioned_students
end

def partition_array(students)
  age_to_student = {}
  students.each do |student|
    if age_to_student.has_key?(student.age)
      age_to_student[student.age].push(student)
    else
      age_to_student[student.age] = [student]
    end
  end

  ages = age_to_student.keys
  sorted_ages = ages.sort

  partitioned_students = []
  sorted_ages.each do |age|
    age_to_student[age].each do |student|
      partitioned_students.push(student)
    end
  end

  return partitioned_students
end

# This is the implementation by the book. To sort the array, use a BST map (i.e. TreeMap) as the age_to_offset map. This will make sure that we iterate over the map in sorted order
def partition_array_1(students)
  age_to_count = get_age_to_count(students)

  age_to_offset = get_age_to_offset(age_to_count)

  # this works because we will only move items that are not yet sorted to places where they will be sorted
  #
  # i.e. once we move a student from offset 0 to offset 5, we will increment age_to_offset to make sure we do not attempt to move that student again
  #
  # we set 'from' to entries from age_to_offset because there are elements that have not been sorted yet
  while !age_to_offset.empty?
    from = age_to_offset.first
    from_student = students[from.last]
    to = age_to_offset[from_student.age]
    swap(students, from.last, to)

    age_to_count[from_student.age] -= 1
    if age_to_count[from_student.age] > 0
      age_to_offset[from_student.age] += 1
    else
      age_to_offset.delete(from_student.age)
    end
  end

  return students
end

def get_age_to_count(students)
  age_to_count = {}
  students.each do |student|
    if age_to_count.has_key?(student.age)
      age_to_count[student.age] += 1
    else
      age_to_count[student.age] = 1
    end
  end

  return age_to_count
end

def get_age_to_offset(age_to_count)
  age_to_offset = {}
  offset = 0
  age_to_count.each do |age, count|
    age_to_offset[age] = offset
    offset += count
  end

  return age_to_offset
end

def swap(students, from, to)
  students[from], students[to] = students[to], students[from]
end

class Student
  attr_accessor :age, :name

  def initialize(age, name)
    @age = age
    @name = name
  end

  def to_s
    "#{age}, #{name}"
  end
end

s1 = Student.new(1, "Bob")
s2 = Student.new(1, "Billy")
s3 = Student.new(1, "Bane")
s4 = Student.new(2, "John")
s5 = Student.new(3, "Dan")
s6 = Student.new(3, "Duke")
s7 = Student.new(4, "Leslie")

students = [s1, s2, s3, s4, s5, s6, s7].shuffle

partitioned_students = partition_array_1(students)
puts partitioned_students
