require "sorts/merge_sort"

describe MergeSort do
  describe "#sort" do
    context "when passed an unsorted array" do
      let(:array) { 1000.times.map { Random.new.rand(10000) } }

      it "sorts the given array" do
        sorted_array = array.sort
        MergeSort.sort(array)
        expect(array).to eq(sorted_array)
      end
    end

    context "when passed a sorted array" do
      let(:array) { [*0..1000] }

      it "sorts the given array" do
        sorted_array = array.sort
        MergeSort.sort(array)
        expect(array).to eq(sorted_array)
      end
    end
  end

  def print_array(array)
    array.each do |v|
      print "#{v}, "
    end
    puts ''
  end
end
