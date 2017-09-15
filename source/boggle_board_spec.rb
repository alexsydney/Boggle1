require_relative 'boggle_board'

describe "Boggle Board - Release 0" do

  let(:board) { BoggleBoard.new }

  def is_valid_letters(letter_string)
      arr = letter_string.split("\n")
      # arr = ["C J I T", "N S I G", "Z J Z X", "L J Q A"]
      result = nil
      count_correct = 0
      arr.each do |el|
          inner_arr = el.split(" ")
          inner_arr.each do |val|
              result = val.match(/^[A-Z]/)
              if result != nil
                  count_correct += 1
              end

          end
      end
      count_correct == 16 ? true : false
  end

  it "can be shaken" do
    expect{board.shake!}.not_to raise_error
  end

  it 'has a printable representation of 4 underscores in each of 4 rows on separate lines BEFORE it is shaken' do
    # expect(board.to_s).to match(/^_{4}${4}/)
    expected_result = "_ _ _ _\n_ _ _ _\n_ _ _ _\n_ _ _ _\n"
    expect(board.to_s).to eq expected_result
  end

  it 'has a printable representation of 4 letters in each of 4 rows on separate lines AFTER it is shaken including Qu' do
    board.shake!
    expect(is_valid_letters(board.to_s)).to eq true
  end

  it 'has the same state every time to_s is called' do
    first_string = board.to_s
    second_string = board.to_s
    expect(first_string).to eq second_string
  end

  it 'has a different state after shake is called' do
    first_string = board.to_s
    board.shake!
    second_string = board.to_s
    expect(first_string).not_to eq second_string
  end

  it 'has 16 letters in total' do
    expect(board.shake!.length).to eq(16)
  end

  it 'has 4 rows represented by containing 4x newline characters' do
    board.shake!
    # puts "spaces is: #{board.to_s}"
    expect(board.to_s.count("\n")).to eq 4
  end
end

describe "Boggle Board - Release 1" do
  pending "Write your own tests here"

end

describe "Boggle Board - Release 2" do
  let(:board) { BoggleBoard.new }

  it "can throw dice" do
    expect{board.throwdice(nil)}.not_to raise_error
  end

  it "can convert Q into Qu" do
    alpha2_test = ["A", "Q", "O", "O", "T", "I", "Y", "T", "R", "O", "M", "E", "N", "K", "H", "I"]
    output_expected = ["A   Qu  O   O \n", "T   I   Y   T \n", "R   O   M   E \n", "N   K   H   I \n"]
    expect(board.throwdice(alpha2_test)).to eq output_expected
  end
end
