class Student

  attr_accessor :name, :location, :twitter, :linkedin, :github, :blog, :profile_quote, :bio, :profile_url

  @@all = []

  def initialize(student_hash)
    student_hash.each do |key, value|
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
  end
end
