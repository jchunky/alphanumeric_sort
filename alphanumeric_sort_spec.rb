module AlphanumericSort
  extend self

  def sort(*input)
    input.sort_by(&method(:line_sort_criteria))
  end

  private

  def line_sort_criteria(line)
    line.split.map(&method(:word_sort_criteria))
  end

  def word_sort_criteria(word)
    split_numbers_and_letters(word).map do |word|
      [word.to_i, word]
    end
  end

  def split_numbers_and_letters(word)
    word.chars.slice_when do |a, b|
      (digit?(a) && !digit?(b)) || (!digit?(a) && digit?(b))
    end.map(&:join)
  end

  def digit?(char)
    char =~ /\d/
  end
end

def sort(*input)
  AlphanumericSort.sort(*input)
end

describe "AlphanumericSort" do
  it "sorts arguments alphanumerically" do
    expect(sort).to eq([])
    expect(sort("a", "b")).to eq(%w[a b])
    expect(sort("b", "a")).to eq(%w[a b])
    expect(sort("a 11", "a 2")).to eq(["a 2", "a 11"])
    expect(sort("a11", "a2")).to eq(%w[a2 a11])
    expect(sort("a000011", "a02")).to eq(%w[a02 a000011])
    expect(sort("line-2", "line-1")).to eq(%w[line-1 line-2])
    expect(sort("line 1", "line 0 a1")).to eq(["line 0 a1", "line 1"])
    expect(sort("line 1", "line 1 a")).to eq(["line 1", "line 1 a"])
    expect(sort("line 1", "line a")).to eq(["line a", "line 1"])
  end
end
