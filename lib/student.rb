class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each do |key, value|
<<<<<<< HEAD
      temp = key.to_s
      temp += "="
      self.send(temp, student_hash[key])
    end
    @@all << self
  end

  def self.create_from_collection(students_array)
    students_array.each {|element| Student.new(element)}
  end

  def add_student_attributes(attributes_hash)
    attributes_hash.each do |key, value|
      temp = key.to_s
      temp += "="
      self.send(temp, attributes_hash[key])
    end
  end

  def self.all
    @@all
=======
      @key = value
    end
  end

  def self.create_from_collection(students_array)

  end

  def add_student_attributes(attributes_hash)

  end

  def self.all

>>>>>>> f531902b54084f4526da91cc5553ed6c2922a75a
  end
end
