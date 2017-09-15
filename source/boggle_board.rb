class BoggleBoard
  attr_accessor :alphabetblock2
  def initialize
    # how we describe it
    @spaces = Array.new(16,"_")

    # put A..Z into Array
    @alphabet = ("A".."Z").to_a
    ## take "Q" out and pleace with Qu for now.
    #  @alphabet = @alphabet - ["Q"] + ["Qu"]

    # replace all Q's in @alphabet with Qu
    @alphabet.map! { |el| el == "Q" ? "Qu" : el }
    # print @alphabet

    # for Release 1
    @alphabetblock = ["AAEEGN","ELRTTY","AOOTTW","ABBJOO","EHRTVW","CIMOTU","DISTTY","EIOSST","DELRVY","ACHOPS","HIMNQU","EEINSU","EEGHNW","AFFKPS","HLNNRZ","DEILRX"]
  end

  # for Release 2 : Dealing with Q
  def throwdice(alpha2_test)
    @alphabetblock1 = []
    @alphabetblock2 = []
    @alphabetblock3 = []

    for i in 0..15 do
      @alphabetblock1<<@alphabetblock[i].split(//)
      # puts "#{i} has #{@alphabetblock[i].inspect}"
      if not alpha2_test
        @alphabetblock2<<@alphabetblock1[i].sample
      end
    end
    if alpha2_test
      @alphabetblock2 = alpha2_test
    end
    puts alphabetblock2.inspect

    #   puts @alphabetblock2.inspect
    #   @alphabetblock2 = @alphabetblock2.map {|letter| letter.gsub(/Q/, 'Qu')}
    @alphabetblock2 = @alphabetblock2.map { |el| el == "Q" ? "Qu" : el + " " }
    #   @alphabetblock2.map! { |el| el == "Q" ? "Qu" : el }

    4.times do
      # test for the alphabetblock1 into alphabetblock3
      # @alphabetblock3<<@alphabetblock1.shift(4).join("  ") + "\n"
      # test for the alphabetblock2 into alphabetblock3
      @alphabetblock3<<@alphabetblock2.shift(4).join("  ") + "\n"
    end

    @alphabetblock3
  end

  # take spaces
  #     # replace them with random numbers (a good idea is to create a VAR for this)
  #     # split it into board
  #     # call the shake method with Boggleboard class
  #     # could use "MAP"
  def shake!
    @spaces.map! do |space|
      #for Release 0 : Simple Boggle Board use @alphabet
      #space = @alphabet.shuffle.take(1)
      # for Release 1 : Smart(er) Boggle Board
      # space = @alphabetblock.shuffle.take(1)
      # for Release 2 : Dealing with Q
      space = @alphabet.shuffle.take(1)
    end
  end

  # Defining to_s on an object controls how the object is
  # represented as a string, e.g., when you pass it to puts
  def to_s
    # When the board is created it should look something like this when I print it:

    # run it 4 times
    # 4.times do
    #     output_string << @spaces.shift(4).join(' ') + "\n"
    # end

    output_string =  String.new

    ##### this run for Release 0 : Simple Boggle Board start from Here
    ## for shake! method
    # header = "```ruby\n"
    # footer = "```\n"
    # output_string = header
    # output_string = output_string + @spaces[0..3].join(' ') + "\n"
    # output_string = output_string + @spaces[4..7].join(' ') + "\n"
    # output_string = output_string + @spaces[8..11].join(' ') + "\n"
    # output_string = output_string + @spaces[12..15].join(' ') + "\n"
    # output_string = output_string + footer

    ### end of Release 0 : Simple Boggle Board
    # start of Release 1 : Smart(er) Boggle Board
    # header = "```text\n"
    # footer = "```\n"
    # output_string = header
    # 16.times do
    #     output_string << @spaces.shift(1).join(' ') + "\n"
    # end
    # output_string = output_string + footer

    # end of Release 1 : Smart(er) Boggle Board

    ### Start: - Release 2 : Dealing with Q
    output_string = output_string + @spaces[0..3].join(' ') + "\n"
    output_string = output_string + @spaces[4..7].join(' ') + "\n"
    output_string = output_string + @spaces[8..11].join(' ') + "\n"
    output_string = output_string + @spaces[12..15].join(' ') + "\n"
    output_string = output_string

    ### End - Release 2 : Dealing with Q

    #### test for grep method

    #   a = %w[January February March April May]
    # a.grep(/ary/)   # ["January, "February"]
    # b = [1, 20, 5, 7, 13, 33, 15, 28]
    # b.grep(12..24)   # [20, 13, 15]
    #
    #  @alphabet = ("A".."Z").to_a
    #  @alphabet.map! { |el| el == "Q" ? "Qu" : el }
    #  @alphabet.grep(/"Qu"/)

    # end of test grep method

    output_string
  end
end

board = BoggleBoard.new
# puts board  # show 4 blank lines on 4 rows
board.shake!  # called shake! method to get random alphabet
puts board    # show random alphabet on 4 rows on each alphabet
puts board.throwdice(nil)
