require "trees/red_black_tree"

describe RedBlackTree do
  subject(:red_black_tree) { RedBlackTree.new }

  describe "#put" do
    it "should put stuff in" do
      red_black_tree.put(1, 1)
      red_black_tree.put(2, 2)
      red_black_tree.put(0, 0)
      red_black_tree.put(4, 4)

      puts "value: #{red_black_tree.get(1)}"
      puts "value: #{red_black_tree.get(2)}"
      puts "value: #{red_black_tree.get(0)}"
      puts "value: #{red_black_tree.get(4)}"
      puts red_black_tree.preorder
    end
  end
end
