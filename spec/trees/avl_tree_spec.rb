require "trees/avl_tree"

describe AvlTree do

  describe "#put" do
    context "when items are put in" do
      subject(:avl_tree) { AvlTree.new }
      let(:key_to_value) do
        key_to_value = {}
        100.times.map do
          random_value = Random.rand(1000)
          key_to_value[random_value] = random_value
        end
        key_to_value
      end

      before do
        key_to_value.each do |key, value|
          avl_tree.insert(key, value)
        end
      end

      it "has a sorted preorder" do
        sorted_keys = key_to_value.keys.sort
        preorder = sorted_keys.collect { |key| key_to_value[key] }
        expect(avl_tree.preorder).to contain_exactly(*preorder)
      end

      it "contains the value for each key" do
        key_to_value.keys.each do |key|
          expect(avl_tree.get(key)).to eq(key_to_value[key])
        end
      end
    end
  end

  describe "#delete" do
    context "when items are put in" do
      subject(:avl_tree) { AvlTree.new }
      let(:key_to_value) do
        key_to_value = {}
        1000.times.map do
          random_value = Random.rand(100000)
          key_to_value[random_value] = random_value
        end
        key_to_value
      end

      before do
        key_to_value.each do |key, value|
          avl_tree.insert(key, value)
        end
      end

      it "has a sorted preorder" do
        keys = key_to_value.keys
        250.times.map do
          random_index = Random.new.rand(0..keys.size - 1)
          key = keys.delete_at(random_index)
          avl_tree.delete(key)
        end

        sorted_keys = keys.sort
        preorder = sorted_keys
        puts avl_tree.preorder.size
        puts key_to_value.keys.size
        expect(avl_tree.preorder).to contain_exactly(*preorder)
      end

      it "contains the value for each key" do
        key_to_value.keys.each do |key|
          expect(avl_tree.get(key)).to eq(key_to_value[key])
        end
      end
    end
  end


  describe "#rotate_right" do
    subject(:avl_tree) { AvlTree.new }

    it "maintains a sorted preorder" do
      root = AvlTree::Node.new(4, 4)
      root.left = AvlTree::Node.new(2, 2)
      root.left.left = AvlTree::Node.new(1, 1)
      root.left.right = AvlTree::Node.new(3, 3)
      root.right = AvlTree::Node.new(5, 5)

      original_preorder = preorder(root)
      rotated_preorder = preorder(avl_tree.right_rotate(root))

      expect(rotated_preorder).to contain_exactly(*original_preorder)
    end
  end

  def preorder(node)
    accumulator = []
    preorder_helper(node, accumulator)
    return accumulator
  end

  def preorder_helper(node, accumulator)
    return if node.nil?

    preorder_helper(node.left, accumulator)
    accumulator << node.value
    preorder_helper(node.right, accumulator)

  end
end
