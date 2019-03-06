class Array
  def swap(idx1,idx2)
    temp = self.dup
    temp[idx1],temp[idx2] = temp[idx2],temp[idx1]
    temp
  end

  def swap!(idx1,idx2)
    self[idx1],self[idx2] = self[idx2],self[idx1]
    self
  end
end

p alphs = [*('0'..'9')]
p pos1 = rand(0...10)
p pos2 = rand(0...10)
p alphs.swap(pos1, pos2)
