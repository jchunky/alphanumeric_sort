def digit?(char)
  char =~ /\d/
end

def transition_between_letters_and_numbers(a, b)
  (digit?(a) && !digit?(b)) || (!digit?(a) && digit?(b))
end

def split_numbers_and_letters(word)
  word.chars.slice_when(&method(:transition_between_letters_and_numbers)).map(&:join)
end

def fragment_sort_criteria(fragment)
  [fragment.to_i, fragment]
end

def word_sort_criteria(word)
  split_numbers_and_letters(word).map(&method(:fragment_sort_criteria))
end

def line_sort_criteria(line)
  line.split.map(&method(:word_sort_criteria))
end

def sort(*input)
  input.sort_by(&method(:line_sort_criteria))
end

describe 'AlphanumericSort' do
  it 'returns array' do
    expect(sort).to eq([])
    expect(sort('a', 'b')).to eq(['a', 'b'])
    expect(sort('b', 'a')).to eq(['a', 'b'])
    expect(sort('a 11', 'a 2')).to eq(['a 2', 'a 11'])
    expect(sort('a11', 'a2')).to eq(['a2', 'a11'])
    expect(sort('a000011', 'a02')).to eq(['a02', 'a000011'])
    expect(sort('line-2', 'line-1')).to eq(['line-1', 'line-2'])
    expect(sort('line 1', 'line 0 a1')).to eq(['line 0 a1', 'line 1'])
    expect(sort('line 1', 'line 1 a')).to eq(['line 1', 'line 1 a'])
    expect(sort('line 1', 'line a')).to eq(['line a', 'line 1'])
  end
end
