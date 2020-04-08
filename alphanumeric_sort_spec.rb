def split_numbers_and_letters(line)
  line.chars.slice_when do |a, b|
    a_number = ('0'..'9').to_a.include?(a)
    b_number = ('0'..'9').to_a.include?(b)

    (a_number && !b_number) || (!a_number && b_number)
  end.map(&:join)
end

def sort(*input)
  input.sort_by do |line|
    split_numbers_and_letters(line).map do |word|
      [word.to_i, word]
    end
  end
end

describe 'AlphanumericSort' do
  it 'returns array' do
    expect(sort).to eq([])
    expect(sort("a","b")).to eq(["a","b"])
    expect(sort("b","a")).to eq(["a","b"])
    expect(sort("a 11", "a 2")).to eq(["a 2","a 11"])
    expect(sort("a11", "a2")).to eq(["a2","a11"])
    expect(sort("a000011", "a02")).to eq(["a02","a000011"])
  end
end
