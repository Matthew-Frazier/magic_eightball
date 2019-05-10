require "colorize"

class MagicEightBall
  def initialize
    @answers = [
      "Not a good idea",
      "What do you think?!...",
      "Yes",
      "I wouldn't",
      "Most definitely!",
      "Don't worry about it",
      "You do you..",
      "GO HOME!!!",
      "Please don't double dip your chips..."
      ]
  @new_answers = []
  @comb_answers = [@answers, @new_answers]
  menu
  end

  def menu
    print `clear`
    puts "What is it that you seek?:".colorize(:blue)
    puts
    puts "Type 'Ask' to ask a question".colorize(:green)
    puts "Type 'Quit' to exit".colorize(:green)
    puts
    print "> "
    choice = gets.strip.to_s.downcase
    print `clear`
    case choice
    when "ask"
      ask_question
    when "add_answers"
      create_answer
    when "reset_answers"
      clear_answers
    when "print_answers"
      print_answers
    when "quit"
      exit
    else
      puts "Invalid Choice!".colorize(:red)
      menu
    end
  end

  def ask_question
    puts "Ask The Almighty Magic 8 Ball!!!".colorize(:blue)
    print "> "
    @question = gets.strip
    puts
    print "You asked".colorize(:blue)
    print " '#{@question}?'"
    puts
    if @new_answers.empty?
      puts
      puts "#{@answers.sample}".colorize(:yellow)
    else
      puts
      puts "#{@comb_answers.sample.sample}".colorize(:yellow)
    end
    sleep(5)
    print `clear`
    menu
  end

  def create_answer
    @user_answer = gets.strip.capitalize
    if (@new_answers.include?(@user_answer))
      puts "You do realize thats already an answer... Right?!".colorize(:red)
      sleep(3)
      menu
    elsif (@answers.include?(@user_answer))
      puts "You do realize thats already an answer... Right?!".colorize(:red)
      sleep(3)
      menu
    else
      @new_answers << @user_answer
    end
    print `clear`
    menu
  end

  def clear_answers
    @new_answers.clear
    print `clear`
    menu
  end

  def print_answers
    if @new_answers.empty?
      @answers.each do |a|
        puts "#{a}".colorize(:yellow)
      end
    else
      @answers.each do |a|
        puts "#{a}".colorize(:yellow)
      end
      @new_answers.each do |n|
      puts "#{n}".colorize(:yellow)
      end
    end
    print `clear`
    menu
  end

end



MagicEightBall.new