require "questions/adhoc/boggle_board"

describe BoggleBoard do
  describe "#sort" do
    context "when passed an unsorted array" do
      subject(:boggle_board) { BoggleBoard.new }

      it "sorts the given array" do
        boggle_board.print_all_words
      end
    end
  end
end
