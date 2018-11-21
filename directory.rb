@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def add_hashes_to_array(name, cohort)
  cohort = cohort.to_sym
  @students << {name: name, cohort: cohort}
end


def input_students
  puts "To finish, just hit return twice"
  puts "Please insert the student's name"
  name = STDIN.gets.strip
  while !name.empty? do
    puts "Please insert the student's cohort"
    cohort = STDIN.gets.strip
    if cohort.empty?
      cohort = "Unknown"
    end
    add_hashes_to_array(name, cohort)
    puts "Now we have #{@students.count} student" if @students.count == 1
    puts "Now we have #{@students.count} students" if @students.count != 1
    puts "Please insert the student's name"
    name = STDIN.gets.strip
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

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_hashes_to_array(name, cohort)
  end
  file.close
end

def try_load_students #this loads the students from the file right at the beginning of the program
  filename = ARGV.first
  if filename == nil
    filename = "students.csv"
  end
  load_students(filename)
  puts "Loaded #{@students.count} students from #{filename}"
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
