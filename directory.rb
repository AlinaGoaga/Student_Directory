@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end


def input_students
  puts "Please enter the names of the students, their country of birth and main hobby"
  puts "To finish, just hit return twice"
  puts "Please insert the student's name"
  name = gets.strip
  while !name.empty? do
    puts "Please insert the student's country of birth"
    country_of_birth = gets.strip
    puts "Please insert the student's main hobby"
    main_hobby = gets.strip
    puts "Please insert the student's cohort"
    cohort = gets.strip
      if cohort.empty?
        cohort = "Unknown"
      end
    cohort = cohort.to_sym
    @students << {name: name, country: country_of_birth, hobby: main_hobby, cohort: cohort}
    puts "Now we have #{@students.count} student" if @students.count == 1
    puts "Now we have #{@students.count} students" if @students.count != 1
    puts "Please insert the student's name"
    name = gets.strip
  end

end


def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  i = 0
  @students.each do |student|
    puts "#{i+1}.  #{student[:name]} #{student[:country]} #{student[:hobby]} (#{student[:cohort]} cohort)".center(100)
    i += 1
  end
end

def print_grouped_by_cohort
  cohorts = []
  for i in 0...@students.length
    cohorts << @students[i][:cohort]
  end
  cohorts.uniq.each do |cohort|
    puts cohort
    for i in 0...@students.length
      if @students[i][:cohort] == cohort
        puts @students[i][:name]
      end
    end
  end
end

def print_footer
  count = @students.count
  puts "Overall, we have #{count} great student".center(100) if count == 1
  puts "Overall, we have #{count} great students".center(100) if count > 1
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

interactive_menu
