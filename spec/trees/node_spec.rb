require "trees/node"

describe Node do
  describe "#new" do
    before :each do
      @color = :red
      @key = 1
      @value = 1
      @node = Node.new(@key, @value, @color)
    end

    it "creates an instance of the Node class" do
      expect(@node).to be_an_instance_of(Node)
    end

    it "creates a node with the specified color" do
      expect(@node.color).to equal(@color)
    end

    it "creates a node with the specified key" do
      expect(@node.key).to equal(@key)
    end

    it "creates a node with the specified value" do
      expect(@node.value).to equal(@value)
    end

    it "creates a node with a default size of 1" do
      expect(@node.size).to equal(1)
    end
  end
end
