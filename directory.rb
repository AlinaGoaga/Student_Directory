def input_students
  puts "Please enter the names of the students, their country of birth and main hobby"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Please insert the student's name"
  name = gets.chomp

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please insert the student's country of birth"
    country_of_birth = gets.chomp
    puts "Please insert the student's main hobby"
    main_hobby = gets.chomp
    puts "What cohort are you in?"
    cohort = gets.chomp
    if cohort.empty?
       cohort = "Unknown"
    end
    cohort.to_sym
    # add the student hash to the array
    students << {name: name, country: country_of_birth, hobby: main_hobby, cohort: cohort}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Please insert the student's name"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  i = 0
  while i < students.length
    puts "#{i+1}.  #{students[i][:name]} #{students[i][:country]} #{students[i][:hobby]} (#{students[i][:cohort]} cohort)".center(100)
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(100)
end
#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
