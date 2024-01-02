module TodoList
  extend self

  def todo(what, subtasks: [], wait: true)
    if subtasks.any?
      substasks_count = subtasks.count
      puts what + " (#{substasks_count} subtask#{(substasks_count > 1) ? "s" : ""})"

      subtasks.each do |subtask|
        subtask(subtask, wait: wait)
      end
    else
      print "#{what}... "
      wait_for_enter_or_space if wait
      done
    end
  end

  def subtask(what, wait: true)
    print "  #{what}... "
    wait_for_enter_or_space if wait
    done
  end

  def wait_for_enter_or_space
    require "io/console"

    loop do
      case $stdin.getch
      when "\r", " "
        break
      when "\u0003", "\e" # Ctrl-C or Esc
        puts
        exit
      end
    end
  end

  def done
    puts "✅"
  end
end
