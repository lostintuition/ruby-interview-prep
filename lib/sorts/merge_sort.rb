class MergeSort
  def self.sort(collection)
    sort_helper(collection, [], 0, collection.size - 1)
  end

  private

  def self.sort_helper(collection, auxiliary, low, high)
    return if high <= low

    mid = low + (high - low) / 2
    sort_helper(collection, auxiliary, low, mid)
    sort_helper(collection, auxiliary, mid + 1, high)
    merge(collection, auxiliary, low, high)
  end

  def self.merge(collection, auxiliary, low, high)
    mid = low + (high - low) / 2

    (low..high).each do |index|
      auxiliary[index] = collection[index]
    end

    i = low
    j = mid + 1
    (low..high).each do |index|
      if i > mid
        collection[index] = auxiliary[j]
        j += 1
      elsif j > high
        collection[index] = auxiliary[i]
        i += 1
      elsif auxiliary[i] <= auxiliary[j]
        collection[index] = auxiliary[i]
        i += 1
      else
        collection[index] = auxiliary[j]
        j += 1
      end
    end
  end
end
