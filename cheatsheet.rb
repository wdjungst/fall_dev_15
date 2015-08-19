@copy = 'Copy - cp - cp path/to/file path/to/destination'
@move = 'Move - mv - mv path/to/file path/to/destination'
@make_dir = 'Make directory - mkdir - mkdir path/name/of/directory/'
@main_menu = 'Main Menu'

def menu
  puts 'Cheatsheet'
  puts '********************'
  puts '1. Command Line'
  puts '2. VIM'
  puts '3. Search'
  puts '4. Quit'
  print 'Make a selection: '
  gets.to_i
end

def sub_menu(choice)
  return_to_main = false
  case choice
    when 1
      while return_to_main == false
        puts "1. #{@copy}"
        puts "2. #{@move}"
        puts "3. #{@make_dir}"
        puts "4. #{@main_menu}"
        print 'Make a selection: '
        selection = gets.to_i
        if selection == 1 || selection == 2 || selection == 3
          command_menu(selection)
        elsif selection == 4
          return_to_main = true
        else
          puts 'Make a selection from the list above'
          top_menu(choice)
        end
      end
      sub_menu(menu)
    when 2
      puts '1. Write - w - :w'
      puts '2. Quit - q - :q'
      puts '3. Write Quit - wq - :wq'
      puts '4. Insert Mode - i - :i'
      puts '5. Exit to normal mode - esc - <esc>'
      puts '6. Main Menu'
      print 'Make a selection: '
      selection = gets.to_i
      case selection
        when 1,2,3,4,5
          puts 'Not yet implemented cannot man vim commands'
          sub_menu(choice)
        when 6
          sub_menu(menu)
        else
          puts 'Make a selection from above'
          top_menu(choice)
      end
    when 3
      print 'Enter a command: '
      command = gets.strip
      print_man(command)
    when 4
      exit 0
    else
      puts 'Invalid chioce please choose 1 - 4'
      menu
  end
end

def command_menu(selection)
  case selection
    when 1
      print_man(@copy)
    when 2
      print_man(@move)
    when 3
      print_man(@make_dir)
  end
end

def print_man(term)
  if term.include? "-"
    cmd = term.split('-')[1]
    puts `man #{cmd}`
  else
    puts `man #{term.downcase}`
    sub_menu(menu)
  end
end

sub_menu(menu)
