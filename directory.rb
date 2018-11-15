def input_students
  puts "Please enter the names of the students, their country of birth and main hobby"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Please insert the student's name"
  name = gets.strip

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please insert the student's country of birth"
    country_of_birth = gets.strip
    puts "Please insert the student's main hobby"
    main_hobby = gets.strip
    puts "What cohort are you in?"
    cohort = gets.strip
    if cohort.empty?
      cohort = "Unknown"
    end
    cohort = cohort.to_sym
    # add the student hash to the array
    students << {name: name, country: country_of_birth, hobby: main_hobby, cohort: cohort}
    puts "Now we have #{students.count} student" if students.count == 1
    puts "Now we have #{students.count} students" if students.count != 1
    # get another name from the user
    puts "Please insert the student's name"
    name = gets.strip
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

def print_grouped_by_cohort(students)
  cohorts = []
  for i in 0...students.length
    cohorts << students[i][:cohort]
  end
  cohorts.uniq.each do |cohort|
    puts cohort
    for i in 0...students.length
      if students[i][:cohort] == cohort
      puts students[i][:name]
      end
    end
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
print_grouped_by_cohort(students)
