require "trees/avl_tree"

describe AvlTree do

  describe "#put" do
    context "when items are put in" do
      subject(:red_black_tree) { RedBlackTree.new }
      let(:key_to_value) { { 0 => 15, 1 => 27, 2 => 14, 4 => 32 } }
      before do
        key_to_value.each do |key, value|
          red_black_tree.put(key, value)
        end
      end

      it "has a sorted preorder" do
        avl_tree = AvlTree.new
        sorted_keys = key_to_value.keys.sort
        preorder = sorted_keys.collect { |key| key_to_value[key] }
        expect(red_black_tree.preorder).to contain_exactly(*preorder)
      end

      it "contains the value for each key" do
        key_to_value.keys.each do |key|
          expect(red_black_tree.get(key)).to eq(key_to_value[key])
        end
      end
    end
  end
end
