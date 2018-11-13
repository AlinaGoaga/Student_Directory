def input_students
  puts "Please enter the names of the students, their country of birth and main hobby"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Please insert the student's name"
  name = gets.chomp
  puts "Please insert the student's country of birth"
  country_of_birth = gets.chomp
  puts "Please insert the student's main hobby"
  main_hobby = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, country: country_of_birth, hobby: main_hobby, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please insert the student's name"
    name = gets.chomp
    if name != ""
        puts "Please insert the student's country of birth"
        country_of_birth = gets.chomp
        puts "Please insert the student's main hobby"
        main_hobby = gets.chomp
    end
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  while i < students.length
    puts "#{i+1}.  #{students[i][:name]} #{students[i][:country]} #{students[i][:hobby]} (#{students[i][:cohort]} cohort)"
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
