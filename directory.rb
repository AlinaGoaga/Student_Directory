def input_students
  puts "Please enter the names of the students, their country of birth and main hobby"
  puts "To finish, just hit return twice"
  students = []
  puts "Please insert the student's name"
  name = gets.strip

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
  puts "Overall, we have #{names.count} great students".center(100) if names.count != 0
end

# print_grouped_by_cohort(students)

def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students # this will be the array of hashes
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end

interactive_menu
