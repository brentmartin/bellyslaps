def jason
  start_day
  work
  finish
  drink
  end_day
end

def start_day
  @meetings = []
  @reviews = []
  @bugs = []
  @codes = []
  @deploy = []
end

def work
  rand(3..5).times do
    scotch = 1
    @meetings << scotch
  end

  rand(1..5).times do
    scotch = -1
    @reviews << scotch
  end

  rand(0..4).times do
    scotch = rand(0..2)
    @bugs << scotch
  end

  rand(0..6).times do
    scotch = rand(-1..1)
    @codes << scotch
  end

  shipped = [0, 0, 0, 0, 1]
  shipped.shuffle
  if shipped.first == 1
    scotch = rand(-4..4)
    @deploy << scotch
  end
end

def finish
  @m_drinks = @meetings.inject(0) {|sum, i|  sum + i }
  @r_drinks = @reviews.inject(0) {|sum, i|  sum + i }
  @b_drinks = @bugs.inject(0) {|sum, i|  sum + i }
  @c_drinks = @codes.inject(0) {|sum, i|  sum + i }
  @d_drinks = @deploy.inject(0) {|sum, i|  sum + i }
  @total_drinks = @m_drinks + @r_drinks + @b_drinks + @c_drinks + @d_drinks
end

def drink
  system('clear')
  print "Jason had #{@meetings.count} meetings today. "
  print "He had #{@reviews.count} code reviews, "
  @bugs.count > 0 ? (print "and found #{@bugs.count} bugs. ") : (print "and found no bugs in the code base. ")
  @codes.count > 0 ? (print "He got to work on code #{@codes.count} times today. ") : (print "Unfortunately, he did not get to code any today. ")
  print "Also, code was pushed to production today. " if @deploy.count > 0
  puts ""
  sleep 1
  puts "Lets guess how many drinks Jason will be having!?"
  guess
end

def end_day
  puts "Shall we try it again tomorrow? (y)es or (n)o"
  t = gets.chomp
  if t.upcase == "Y"
    sleep 0.5
    jason
  elsif t.upcase == "N"
    sleep 0.5
    puts "Good idea, lets end this madness!"
    sleep 2
  else
    system('clear')
    sleep 0.5
    puts "I'm sorry, I didn't get that answer."
    sleep 2
    end_day
  end
end

def guess
  print "> "
  g = gets.chomp
  if g.to_i > @total_drinks
    sleep 0.5
    puts "Too many, try again."
    guess
  elsif g.to_i < @total_drinks
    sleep 0.5
    puts "Too little, try again."
    guess
  else
    sleep 0.5
    puts "Nailed it! Good job."
    sleep 3
  end
end

jason
