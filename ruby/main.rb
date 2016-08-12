  @meetings = []
  @reviews = []
  @bugs = []
  @codes = []
  @deploy = []
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
  @m_drinks = @meetings.inject(0) {|sum, i|  sum + i }
  @r_drinks = @reviews.inject(0) {|sum, i|  sum + i }
  @b_drinks = @bugs.inject(0) {|sum, i|  sum + i }
  @c_drinks = @codes.inject(0) {|sum, i|  sum + i }
  @d_drinks = @deploy.inject(0) {|sum, i|  sum + i }
  @total_drinks = @m_drinks + @r_drinks + @b_drinks + @c_drinks + @d_drinks
